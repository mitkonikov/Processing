public class BUTTON {
   public int X = 0, Y = 0, H = 35, W = 200;
   
   // COLORS
   public color Background = color(100, 100, 100);
   public color Foreground = color(255, 255, 255);
   public color BackgroundClicked = color(50, 50, 50);
   public color Border = color(30, 30, 30);
   
   public boolean BorderEnable = false;
   public int BorderWeight = 1;
   
   private boolean clicked = false;
   
   public String ButtonText = "";
   public int TextSize = 24;
   
   BUTTON() {
      // CREATE OBJECT DEFAULT BUTTON
   }
   
   BUTTON(int x, int y, int w, int h) {
      X = x; Y = y; W = w; H = h;
   }
   
   void DRAW() {
      // DRAWING THE BACKGROUND
      if (clicked) {
         fill(BackgroundClicked);
      } else {
         fill(Background);
      }
      
      if (BorderEnable) {
         strokeWeight(BorderWeight);
         stroke(Border);
      } else {
         noStroke();
      }
      
      rect(X, Y, W, H);
      
      fill(Foreground);
      textSize(TextSize);
      text(ButtonText, X + (W - textWidth(ButtonText)) / 2, Y + TextSize + 2);
   }
   
   // FUNCTION FOR TESTING IS THE POINT
   // OVER THE BUTTON
   private boolean overBox(int x, int y) {
      if (x >= X && x <= X + W) {
         if (y >= Y && y <= Y + H) {
            return true;
         }
      }
      
      return false;
   }
   
   void PRESSED(int x, int y) {
      if (overBox(x, y)) {
         clicked = true;
      }
   }
   
   void RELEASED(int x, int y) {
      clicked = false;
   }
}
