abstract class NodeData implements Comparable {
  abstract void draw();
}

class Node implements Comparable {
  String name;
  float x, y;
  float r = 15;
  ArrayList<Edge> edges = new ArrayList();

  NodeData data;

  Node(String name, float x, float y) {
    this.name = name;
    this.x = x;
    this.y = y;
  }

  Node(String s) {
    String[] items = s.split(",");
    if (items.length>=3) {
      name = items[0];
      x = Float.parseFloat(items[1])*1.14;
      y = Float.parseFloat(items[2])*1.14;
    } else
      throw new IllegalArgumentException("Could not convert string \""+s+"\" to Node");
  }

  String toString() {
    return name+","+x+","+y;
  }

  int compareTo(Object o) {
    Node other = (Node)o;
    return data.compareTo(other.data);
  }

  boolean sameName(String name) {
    return this.name.equals(name);
  }

  void draw() {
    draw(0);
  }

  void draw(color c) {
    boolean hasBus = false;
    boolean hasSub = false;
    for (Edge e : edges) {
      if (e.type==1)
        hasSub = true;
      if (e.type==2)
        hasBus = true;
    }
    pushMatrix();
    translate(x, y);
    stroke(0, 0, 255);
    strokeWeight(5);
    strokeCap(ROUND);
    if (hasBus)
      ellipse(0, 0, r, r);
    stroke(c);
    strokeWeight(1);
    fill(255, 255, 0);
    ellipseMode(RADIUS);
    ellipse(0, 0, r*0.9, r*0.9);
    rectMode(RADIUS);
    fill(255, 0, 0);
    if (hasSub) {
      rect(0, 0, r*1.1, r/2);
      fill(255);
    } else
      fill(c);
    text(name, -1, -1);
    if (data!=null)
      data.draw();
    popMatrix();
  }

  boolean hit(float x, float y) {
    float dx = this.x-x;
    float dy = this.y-y;
    return (dx*dx+dy*dy) < r*r;
  }
}
