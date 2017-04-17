
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();

boolean send = false;
String msg = "";

void setup() {
   size(400, 300);
   
   InitLayout();
}

void draw() {
   background(180);
   
   for (TEXTBOX t : textboxes) {
      t.DRAW();
   }
   
   if (send) {
      text(msg, (width - textWidth(msg)) / 2, 260);
   }
}

void InitLayout() {
   TEXTBOX receiver = new TEXTBOX();
   receiver.W = 300;
   receiver.H = 35;
   receiver.X = (width - receiver.W) / 2;
   receiver.Y = 50;
   textboxes.add(receiver);
   
   TEXTBOX message = new TEXTBOX((width - 300) / 2, 100, 300, 100);
   textboxes.add(message);
}

void mousePressed() {
   for (TEXTBOX t : textboxes) {
      t.PRESSED(mouseX, mouseY);
   }
}

void keyPressed() {
   for (TEXTBOX t : textboxes) {
      if (t.KEYPRESSED(key, keyCode)) {
         send = true;
         msg = "Message is: " + textboxes.get(1).Text;
      }
   }
}