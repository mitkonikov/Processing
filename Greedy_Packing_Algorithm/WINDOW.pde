public class WINDOW {
   int X, Y, W, H;
   int xOffset = 0, yOffset = 0;
   int defaultColor = 80;
   int R = defaultColor, G = defaultColor, B = defaultColor;
   int RO = 10, GO = 10, BO = 10;
   int TEXTSIZE = 24;
   
   int closeW = 20, closeH = 20;
   int closeX() { return X + W - closeW - 10; }
   int closeY() { return Y + 3; }
   
   boolean locked = false;
   String TITLE = "no title";
   
   // THE CLASS CONSTRACTOR
   WINDOW(int x, int y, int w, int h, String title) {
      X = x; Y = y; W = w; H = h;
      TITLE = title;
   }
   
   // SETTING COLOR
   void SETCOLOR(int r, int g, int b) {
      R = r; G = g; B = b;
   }
   
   // DRAWING THE WINDOW ON THE CANVAS
   void DRAW() {
      noStroke();
      // WINDOW BACKGROUND
      fill(R, G, B);
      rect(X, Y, W, H);
      // WINDOW FRAME
      fill(R + 20, G + 20, B + 20);
      rect(X, Y, W, 10);
      // WINDOW BUTTONS
      // CLOSE
      fill(10, 10, 10);
      rect(closeX(), closeY(), closeW, closeH);
      // TITLE
      textSize(TEXTSIZE);
      text(TITLE, X + 5, Y + 20);
   }
   
   // TESTING IF THE COORDINATES ARE
   // INSIDE THE SOME GIVEN BOX
   private boolean overBox(int x, int y, int xB, int yB, int wB, int hB) {
      if (x >= xB && x < xB + wB) {
         if (y >= yB && y < yB + hB) {
            return true;
         }
      }
      
      return false;
   }
   
   // WHEN THE MOUSEPRESSED EVENT IS TRIGGERED
   int PRESSED(int x, int y) {
      if (overBox(x, y, closeX(), closeY(), closeW, closeH)) {
         // GIVE A CLOSING ORDER
         return 0;
      }
      
      // TESTING IF THE COORDS ARE INSIDE THE WINDOW
      if(overBox(x, y, X, Y, W, H)) {
         locked = true;
         R += RO; G += GO; B += BO;
      } else {
         locked = false;
      }
      
      // CALCULATING THE OFFSET
      // BETWEEN THE MOUSE COORDS
      // AND THE BOX'S COORDS
      xOffset = x - X;
      yOffset = y - Y;
      
      // EVERYTHING IS GOOD
      return 1;
   }
   
   // WHEN THE MOUSEDRAGGED EVENT IS TRIGGERED
   void DRAGGED(int x, int y) {
      // IF ITS IN LOCKED STATE
      if(locked) {
         X = x - xOffset;
         Y = y - yOffset;
      }
   }
   
   // WHEN THE MOUSEREALESED EVENT IS TRIGGERED
   void RELEASED(int x, int y) {
      if (overBox(x, y, X, Y, W, H)) {
         locked = false;
         R -= RO; G -= GO; B -= BO;
      }
   }
}