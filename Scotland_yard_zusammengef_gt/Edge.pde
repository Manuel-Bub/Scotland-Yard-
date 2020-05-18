class Edge {
  Node a = null;
  Node b = null;
  float value;
  int type;
  final int[] lineColor = {color(0), color(255, 0, 0), color(0, 0, 255), color(255, 255, 0)};
  final int[] lineWidth = {4, 13, 8, 3};
  ArrayList<Node> wayPoints = new ArrayList();

  Edge(Node a, Node b) { 
    this.a = a;
    this.b = b;
    value = floor(dist(a.x, a.y, b.x, b.y));
  }

  Edge(String s, ArrayList<Node> nodes) {
    String[] names = s.split(",");
    if (names!=null && names.length>=2) {
      for (Node n : nodes) {
        if (n.sameName(names[0]))
          a = n;
        if (n.sameName(names[1]))
          b = n;
      }
      if (a==null)
        throw new IllegalArgumentException("Could not find Node \""+names[0]+"\"");
      if (b==null)
        throw new IllegalArgumentException("Could not find Node \""+names[1]+"\"");
      value = floor(dist(a.x, a.y, b.x, b.y));
      if (names.length>2) {
        switch (names[2]) {
        case "B": 
          type = 2;
          break;
        case "T": 
          type = 3;
          break;
        case "U": 
          type = 1;
          break;
        default:
        }
        for (int i=3; i<names.length; i++)
          for (Node n : nodes) {
            if (n.sameName(names[i])) {
              wayPoints.add(n);
              break;
            }
          }
      }
    } else
      throw new IllegalArgumentException("Could not convert string \""+s+"\" to Edge");
  }

  String toString() {
    return a.name+","+b.name;
  }

  void draw() {
    draw(0);
  }

  void drawLine(Node a, Node b) {
    float dx = b.x-a.x;
    float dy = b.y-a.y;
    float l = sqrt(dx*dx+dy*dy);
    dx /= l;
    dy /= l;
    strokeWeight(lineWidth[type]);
    stroke(lineColor[type]);
    line(a.x+dx*a.r, a.y+dy*a.r, b.x-dx*b.r, b.y-dy*b.r);
  }

  void draw(color c) {
    Node from = a;
    strokeCap(SQUARE);
    for (Node to : wayPoints) {
      drawLine(from, to);
      from = to;
    }
    drawLine(from, b);
  }

  Node other(Node me) {
    if (a==me)
      return b;
    if (b==me)
      return a;
    return null;
  }
}
