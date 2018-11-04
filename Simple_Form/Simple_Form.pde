ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
ArrayList<BUTTON> buttons = new ArrayList<BUTTON>();

boolean locked = false;
String name = "";

void setup() {
   size(400, 250);
   
   TEXTBOX nameTB = new TEXTBOX(100, 103, 200, 35);
   nameTB.BorderEnable = true;
   BUTTON submitBT = new BUTTON(100, 143, 200, 35);
   submitBT.ButtonText = "Submit!";
   
   textboxes.add(nameTB);
   buttons.add(submitBT);
}

void draw() {
   background(40, 160, 40);
   
   // LABELS
   fill(250, 250, 250);
   text("SIMPLE FORM", (width - textWidth("SIMPLE FORM")) / 2, 60);
   textSize(15);
   text("What's your name?", (width - textWidth("What's your name?")) / 2, 80);
   textSize(24);
   
   // DRAW THE TEXTBOXES
   for (TEXTBOX t : textboxes) {
      t.DRAW();
   }
   
   // DRAW THE BUTTONS
   for (BUTTON b : buttons) {
      b.DRAW();
   }
   
   if (buttons.get(0).clicked) {
      locked = true;
      name = textboxes.get(0).Text;
   }
   
   if (locked) {
      fill(250, 250, 250);
      textSize(24);
      text("Hello " + name + "!", (width - textWidth("Hello " + name + "!")) / 2, 220);
   }
}

void mousePressed() {
   for (TEXTBOX t : textboxes) {
      t.PRESSED(mouseX, mouseY);
   }
   
   for (BUTTON b : buttons) {
      b.PRESSED(mouseX, mouseY);
   }
}

void mouseReleased() {
   for (BUTTON b : buttons) {
      b.RELEASED(mouseX, mouseY);
   }
}

void keyPressed() {
   for (TEXTBOX t : textboxes) {
      t.KEYPRESSED(key, (int)keyCode);
   }
}
