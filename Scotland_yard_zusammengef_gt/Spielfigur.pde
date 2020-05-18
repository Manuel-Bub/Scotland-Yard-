class Spielfigur {
  boolean mrX;
  boolean human;
  boolean ticketBenutzt;
  boolean gezogen;
  int startfeld;
  int position;
  int reihenfolge; // auch für die Indentifikation der Spielfiguren
  int runde = 0;
  Ticket[] tickets; 
  int[] strecke = new int[24]; 

  Spielfigur(boolean mrX, boolean human, int startfeld, int reihenfolge/*, Ticket[] tickets*/) {
    this.mrX = mrX;
    this.human = human;
    this.startfeld = startfeld;
    this.reihenfolge = reihenfolge;
    tickets = new Ticket[5];

    if (mrX) {
      tickets[0] = new Ticket("Taxi", 4);
      tickets[1] = new Ticket("Bus", 3);
      tickets[2] = new Ticket("U-Bahn", 3);
      tickets[3] = new Ticket("Blacks", 4); // Abhängig von D-Spielern -> Anzahl Spieler
      tickets[4] = new Ticket("Doppelzug", 2);
    }

    if (human) {
      tickets[0] = new Ticket("Taxi", 10);
      tickets[1] = new Ticket("Bus", 8);
      tickets[2] = new Ticket("U-Bahn", 4);
      tickets[3] = new Ticket("Blacks", 0); // Abhängig von D-Spielern -> Anzahl Spieler
      tickets[4] = new Ticket("Doppelzug", 0);
    }
    //this.tickets = tickets;
  }

  void positionSpielfigur(int position) {  //hinterlegt die positionen vom spieler in strecken array
    if (runde < 1) {
      strecke[runde] = startfeld;
    } else {
      strecke[runde] = position;
    }
  }

  boolean ticketBekommen(String farbe) {    
    for (int i = 0; i < tickets.length; i++) {
      if (farbe.equals(tickets[i].farbe)) {
        tickets[i].anzahl++;
        return true;
      }
    }
    return false;
  }

  boolean ticketBenutzen(String farbe) {
    for (int i = 0; i < tickets.length; i++) {
      if (!ticketBenutzt) {
        if (farbe.equals(tickets[i].farbe) && tickets[i].anzahl > 0) {
          tickets[i].anzahl--;
          if (!mrX) {
            // mrX.ticketBekommen(farbe)
          }
          // positionSpielfigur(position)
          ticketBenutzt = true;
          return true;
        }
      }
    }
    return false;
  }

  boolean zugBeenden() {
    if (ticketBenutzt && !gezogen) {

      // runde++;
      gezogen = true;
      return true;
    }
    return false;
  }

  boolean spielEnde() {
    if (runde > 24) {
      return true;
      // } else if (mrX.position == detective.position && mrX.runde == detective.runde) {
      // return true;
      // }
    }
    return false;
  }

  void display() {
    // if (runde == 3 || runde == 8|| runde == 13|| runde == 18|| runde == 24)
    // fill(mrX? #000000 : #291EC9);
    // circle(xPos, yPos, 5);
  }
}
