public class WINCHILD {
   int X, Y, W, H;
   int R = defaultColor, G = defaultColor, B = defaultColor;
   
   WINCHILD(int x, int y, int w, int h) {
      X = x; Y = y; W = w; H = h;
   }
   
   void SETCOLOR(int r, int g, int b) {
      R = r; G = g; B = b;
   }
   
   // WHEN YOU ARE DRAWING A CHILD
   // YOU PASS THE x, y COORDS OF THE
   // PARENT WINDOW
   void DRAW(int x, int y) {
      noStroke();
      fill(R, G, B);
      rect(x + X, y + Y, W, H);
   }
}