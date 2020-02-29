
class Tree {
  private ArrayList<Node> nodes;
  private ArrayList<Edge> edges;

  public Tree() {
    nodes = new ArrayList<Node>();
    edges = new ArrayList<Edge>();

    Node rootNode = new Node();
    Node firstNode = new Node();

    nodes.add(rootNode);
    nodes.add(firstNode);

    edges.add(new Edge(rootNode, firstNode));
  }

  public void update() {
    for (Edge e : edges) {
      e.update();
    }

    for (int i=edges.size()-1; i>=0; i--) {
      Edge e = edges.get(i);

      if (!e.isLineComplete()) {
        continue;
      }

      if (e.isHaveChildren()) {
        continue;
      }

      Node newLineStartNode = e.getLineEndNode();

      int numberOfNewNodes = (int) random(2, 4);
      for (int j=0; j<numberOfNewNodes; j++) {
        Node newLineEndNode = new Node();
        nodes.add(newLineEndNode);
        edges.add(new Edge(newLineStartNode, newLineEndNode));
      }
      e.setHaveChildren(true);
    }

    for (int i=0; i<edges.size(); i++) {
    }
  }

  public void draw() {
    for (Node n : nodes) {
      n.draw();
    }

    for (Edge e : edges) {
      e.draw();
    }
  }
}
