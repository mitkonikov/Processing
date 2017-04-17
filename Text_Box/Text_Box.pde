// code written by Mitko Nikov

ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
boolean logged = false; // DEMO

void setup() {
   size(400, 250);
   
   // USERNAME TEXTBOX
   // CONFIGURED USING THE GLOBAL VARS
   TEXTBOX userTB = new TEXTBOX();
   userTB.X = 160;
   userTB.Y = 103;
   userTB.W = 200;
   userTB.H = 35;
   
   // PASSWORD TEXTBOX
   // CONFIGURED USING THE CLASS CONSTRACTOR
   TEXTBOX passTB = new TEXTBOX(160, 153, 200, 35);
   passTB.BorderWeight = 3;
   passTB.BorderEnable = true;
   
   textboxes.add(userTB);
   textboxes.add(passTB);
}

void draw() {
   background(40, 160, 40);
   
   // LABELS
   fill(250, 250, 250);
   text("LOGIN FORM", (width - textWidth("LOGIN FORM")) / 2, 60);
   textSize(15);
   text("Press Enter to Login", (width - textWidth("Press Enter to Login")) / 2, 80);
   textSize(24);
   text("Username: ", 20, 130);
   text("Password: ", 20, 180);
   
   // DRAW THE TEXTBOXES
   for (TEXTBOX t : textboxes) {
      t.DRAW();
   }
   
   // JUST FOR DEMO (DO NOT EVER DO THAT!)
   if (logged) {
      fill(250, 250, 250);
      text("YOU ARE LOGGED IN!", (width - textWidth("YOU ARE LOGGED IN")) / 2, 230);
   }
}

void mousePressed() {
   for (TEXTBOX t : textboxes) {
      t.PRESSED(mouseX, mouseY);
   }
}

// JUST FOR DEMO
void Submit() {
   if (textboxes.get(0).Text.equals("mitkonikov")) {
      if (textboxes.get(1).Text.equals("test1234")) {
         logged = true;
      } else {
         logged = false;
      }
   } else {
      logged = false;
   }
}

void keyPressed() {
   for (TEXTBOX t : textboxes) {
      if (t.KEYPRESSED(key, (int)keyCode)) {
         Submit();
      }
   }
}