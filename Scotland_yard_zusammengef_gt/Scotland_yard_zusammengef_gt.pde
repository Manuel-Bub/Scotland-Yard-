int spielzustand = 1; //1 = Hauptmenü, 2 = Einstellungen, 3 = Spiel geht los, 4 = Game Over

int anzahlStartfelder = 100;
int anzahlplayer = 3;
IntList startfelder = new IntList();
int [] spielerstartfeld = new int [anzahlplayer + 1];

Spielfigur Mrx;
Spielfigur Spieler1;
Spielfigur Spieler2;
Spielfigur Spieler3;
Spielfigur Spieler4;
Spielfigur Spieler5;
Graph graph;


//-----------------------------------------------------------------
void setup() {
  fullScreen();
  //size(1050, 700);
  //graph = new Graph("ScotlandYard.grp");
  //noLoop();
  //textAlign(CENTER, CENTER);

  background(#4CA500);

  for (int i = 1; i <= anzahlStartfelder; i++) {
    startfelder.append(i);
    startfelder.shuffle();
  }
  ZufallsStartfeld(anzahlplayer);
  println(spielerstartfeld);
}
//----------------------------------------------------------------------


//float s = 2; // Skalierungsfaktor für Anzeige

void draw() {
  //background(255);
  //scale(s);
  //graph.draw();
}
//-------------------------------------------------------------------

void keyPressed () {

  switch (spielzustand) {
  case 1: 
    background(#4CA500);
    textSize(100);
    text("Scotland Yard", width/2-400, height/2-200);
    text("Press Enter", width/2-400, 3*height/4);
    text("to Start", width/2-400, 3*height/4+150);

    if (keyPressed && keyCode == ENTER) {
      spielzustand = spielzustand + 1;
    }
    break;

  case 2:
    background(0);
    textSize(50);
    text("Wie viele Spieler?", width/2-400, height/2-200);
    text("2-6 inklusive Mr.X", width/2-400, height/2);
    text("Wähle mit Keyboard", width/2-400, height/2+100);
    text("Press enter to start", width/2-400, height/2+200);
    //2 Spieler
    if (key == '2') {
      Mrx = new Spielfigur(true, false, spielerstartfeld[0], 1);
      println("\nMr. X: ");
      for (Ticket i : Mrx.tickets) {
        println(i.farbe + " " + i.anzahl);
      }
      //----------
      Spieler1 = new Spielfigur(false, true, spielerstartfeld[1], 2);
      println("\nSpieler1: ");
      for (Ticket i : Spieler1.tickets) {
        println(i.farbe + " " + i.anzahl);
      }
      //---------
      text("/gewählt: 2", width/2+100, height/2+100);
      //2 bobbies hinzufügen
      spielzustand = 3;
    }

    //----------
    //3 Spieler
    if (key == '3') {
      Mrx = new Spielfigur(true, false, spielerstartfeld[0], 1);
      println("\nMr. X: ");
      println(Mrx.startfeld);
      for (Ticket i : Mrx.tickets) {
        println(i.farbe + " " + i.anzahl);
      }
      //------
      Spieler1 = new Spielfigur(false, true, spielerstartfeld[1], 2);
      println("\nSpieler1: ");
      println(Spieler1.startfeld);
      for (Ticket i : Spieler1.tickets) {
        println(i.farbe + " " + i.anzahl);
      }
      //-------
      Spieler2 = new Spielfigur(false, true, spielerstartfeld[2], 3);
      println("\nSpieler2: ");
      println(Spieler2.startfeld);
      for (Ticket i : Spieler2.tickets) {
        println(i.farbe + " " + i.anzahl);
      }
      //------
      text("/gewählt: 3", width/2+100, height/2+100);
      //2 bobbies hinzufügen
      spielzustand = 3;
    }

    //---------
    //4 Spieler
    if (key == '4') {
      Mrx = new Spielfigur(true, false, spielerstartfeld[0], 1);
      Spieler1 = new Spielfigur(false, true, spielerstartfeld[1], 2);
      Spieler2 = new Spielfigur(false, true, spielerstartfeld[2], 2);
      Spieler3 = new Spielfigur(false, true, spielerstartfeld[3], 4);
      //2 bobbies hinzufügen
      text("/gewählt: 4", width/2+100, height/2+100);
      spielzustand = 3;
    }
    break;

  case 3:
    //background(123);
    //textSize(50);
    //text("Dann hier Spielfeld", width/2-400, height/2-200);
    textSize(15);

    graph = new Graph("ScotlandYard.grp");
    noLoop();
    textAlign(CENTER, CENTER);


    float s = 1.15; // Skalierungsfaktor für Anzeige
    background(255);
    scale(s);
    graph.draw();



    break;


  case 4:
    background(#EA0000);
    text("Game over", width/2, height/2);
    break;
  }
}

//---------------------------------------------------------------------------------------------------------------------
void ZufallsStartfeld(int b) {
  for (int i = 0; i <= b; i++) {
    spielerstartfeld[i] = startfelder.get(0);
    startfelder.remove(0);
  }
}
// 125 Karten - 54 Taxis, 43 Bus, 23 U-Bahn, 5 Blacks, 2 Doppelzug
// 6 Figuren
// 18 Starkarten

//----------------------------------------------------------------------------------------------------------------------
