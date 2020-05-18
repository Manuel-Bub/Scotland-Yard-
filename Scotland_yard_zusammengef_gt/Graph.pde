class Graph {
  ArrayList<Edge> allEdges = new ArrayList();
  ArrayList<Node> allNodes = new ArrayList();

  Graph() {
  }

  Graph(String fileName) {
    restore(fileName);
  }

  void draw() {
    for (Edge e : allEdges)
      e.draw();
    for (Node n : allNodes)
      n.draw();
  }

  Node whichNode(float mouseX, float mouseY) {
    for (Node n : allNodes)
      if (n.hit(mouseX, mouseY))
        return n;
    return null;
  }

  void addNode(Node n) {
    allNodes.add(n);
  }

  void addEdge(String s) {
    Edge edge = new Edge(s, allNodes);
    allEdges.add(edge);
    edge.a.edges.add(edge);
    edge.b.edges.add(edge);
  }

  void addEdge(Node from, Node to) {
    Edge e = new Edge(from, to);
    allEdges.add(e);
    from.edges.add(e);
    to.edges.add(e);
  }

  void store(String fileName) {
    String[] out = new String[allEdges.size()+allNodes.size()+2];
    int i=0;
    out[i++] = "[Nodes]";
    for (Node n : allNodes)
      out[i++] = n.toString();
    out[i++] = "[Edges]";
    for (Edge e : allEdges)
      out[i++] = e.toString();
    saveStrings(fileName, out);
  }

  void restore(String fileName) {
    String[] in = loadStrings(fileName);
    if (in!=null) {
      allNodes.clear();
      allEdges.clear();
      int i = 0;
      while (i<in.length) {
        if (in[i].equals("[Nodes]")) {
          i++;
          while (i<in.length && !in[i].startsWith("["))
            allNodes.add(new Node(in[i++]));
        }
        else if (in[i].equals("[Edges]")) {
          i++;
          while (i<in.length && !in[i].startsWith("["))
            addEdge(in[i++]);
        } else {
          i++;
          while (i<in.length && !in[i].startsWith("["))
            i++;
        }
      }
    }
  }
}
