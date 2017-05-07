ArrayList<WINDOW> windows = new ArrayList<WINDOW>();

void setup() {
   size(1270, 720);
   
   setupWindows();
   prepAndPack();
}

void prepAndPack() {
   // TO MAKE IT AS UNIVERSAL AS POSSIBLE
   // THE PACK CLASS ACCEPTS INT ARRAY WITH
   // JUST THE WIDTH AND HEIGHT OF EACH RECT
   // SO I AM COPYING THE PARAMS FROM THE
   // WINDOWS OBJECTS TO A 2D ARRAY
   int windowsSize = windows.size();
   int[][] rects = new int[windowsSize][2];
   for (int i = 0; i < windowsSize; ++i) {
      WINDOW current = windows.get(i);
      rects[i][0] = current.W;
      rects[i][1] = current.H;
   }
   
   GREEDY_PACK p = new GREEDY_PACK(rects, width, height);
   int[][] result = p.RESULT;
   
   for (int i = 0; i < windowsSize; ++i) {
      WINDOW current = windows.get(i);
      if (result[i][0] == width) {
         println("IMPOSSIBLE TO FIT THE WINDOW WITH TITLE: " + current.TITLE);
      }
      
      current.X = result[i][0];
      current.Y = result[i][1];
   }
}

// TEMP FUNCTION FOR ADDING COUPLE OF WINDOWS
void setupWindows() {
   WINDOW w1 = new WINDOW(0, 0, 400, 500, "1");
   WINDOW w2 = new WINDOW(0, 0, 300, 200, "2");
   WINDOW w3 = new WINDOW(0, 0, 100, 300, "3");
   WINDOW w4 = new WINDOW(0, 0, 200, 300, "4");
   WINDOW w5 = new WINDOW(0, 0, 200, 300, "5");
   WINDOW w6 = new WINDOW(0, 0, 900, 100, "6");
   
   // CHANGING THE COLOR FOR EASIER DIFFERENTIATION
   w1.R = 140;
   w2.G = 140;
   w3.B = 140;
   w4.R = 200;
   w5.G = 200;
   w6.B = 200;
   
   windows.add(w1);
   windows.add(w2);
   windows.add(w3);
   windows.add(w4);
   windows.add(w5);
   windows.add(w6);
}

// -------------------------------------------
// FUNCTIONS FOR INTERACTING WITH THE WINDOWS
// -------------------------------------------

void draw() {
   background(150);
   
   for (WINDOW w : windows) {
      w.DRAW();
   }
}

void mousePressed() {
   for (int i = 0; i < windows.size(); ++i) {
      int pressing = windows.get(i).PRESSED(mouseX, mouseY);
      if (pressing == 0) {
         windows.remove(i);
      }
   }
}

void mouseDragged() {
   for (WINDOW w : windows) {
      w.DRAGGED(mouseX, mouseY);
   }
}

void mouseReleased() {
   for (WINDOW w : windows) {
      w.RELEASED(mouseX, mouseY);
   }
}