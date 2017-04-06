// it's set up for FULL HD 1920x1080 Monitor
// code written by Mitko Nikov

final public int[][] palette = { {0, 78, 100}, {220, 155, 77}, {55, 150, 76}, {165, 45, 43}, {146, 220, 229} };
final public int TEXTSIZE = 24;
final public int defaultColor = 100;

public ArrayList<WINDOW> windows = new ArrayList<WINDOW>();

void setup() {
   fullScreen();
   
   // ADDING WINDOWS FOR DEMONSTRATION
   WINDOW blue = new WINDOW(150, 150, 800, 450, "BLUE");
   WINDOW orange = new WINDOW(500, 500, 1000, 400, "ORANGE");
   blue.SETCOLOR(palette[0][0], palette[0][1], palette[0][2]);
   orange.SETCOLOR(palette[1][0], palette[1][1], palette[1][2]);
   
   // CCO = Children Color Offset
   int bCCO = -50;
   int oCCO = -50;
   
   // Childrens' size
   int CB = 50;
   
   // Aditional params for childs
   int paddingH = 20;
   
   // ADDING CHILDS
   for (int i = 1; i <= 7; ++i) {
      for (int j = 0; j < 3; ++j) {
         blue.addChildren(CB * 2 * i - CB / 2, CB * (j + 1) + j * paddingH, CB, CB, palette[0][0] + bCCO, palette[0][1] + bCCO, palette[0][2] + bCCO);
      }

      orange.addChildren(CB * 2 * i - CB / 2, CB, CB, CB, palette[1][0] + oCCO, palette[1][1] + oCCO, palette[1][2] + oCCO);
   }
   
   // ADDING THE WINDOWS IN THE ARRAY
   windows.add(blue);
   windows.add(orange);
}

void draw() {   
   background(palette[4][0], palette[4][1], palette[4][2]);
   fill(palette[3][0], palette[3][1], palette[3][2]);
   text(frameRate, width - 120, height - 20);
   
   // WINDOW LOGIC
   for (WINDOW w : windows) {
      w.DRAW();
   }
}

void mousePressed() {
   // WINDOW LOGIC
   for (int i = 0; i < windows.size(); ++i) {
      WINDOW current = windows.get(i);
      int returnValue = current.PRESSED(mouseX, mouseY);
      if (returnValue == 0) {
         windows.remove(i);
      }
   }
}

void mouseDragged() {
   // WINDOW LOGIC
   for (WINDOW w : windows) {
      w.DRAGGED(mouseX, mouseY);
   }
}

void mouseReleased() {
   // WINDOW LOGIC
   for (WINDOW w : windows) {
      w.RELEASED(mouseX, mouseY);
   }
}