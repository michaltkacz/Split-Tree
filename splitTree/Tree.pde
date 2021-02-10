
class Tree {
  private ArrayList<Edge> incompleteEdges;
  private ArrayList<Edge> completeEdges;

  public Tree() {
    incompleteEdges = new ArrayList<Edge>();
    completeEdges = new ArrayList<Edge>();

    incompleteEdges.add(new Edge());
  }

  public void update() {
    for (int i=incompleteEdges.size()-1; i>=0; i--) {
      Edge e = incompleteEdges.get(i);
      e.update();

      if (e.isLineComplete()) {
        completeEdges.add(e);
        incompleteEdges.remove(e);
      } else {
        continue;
      }

      if (e.isHaveChildren()) {
        continue;
      } else {
        PVector newLineStartPosition = e.getLineEndPosition();

        int numberOfNewEdges = (int) random(2, 4);
        for (int j=0; j<numberOfNewEdges; j++) {
          incompleteEdges.add(new Edge(newLineStartPosition));
        }
        e.setHaveChildren(true);
      }
    }
  }

  public void draw() {
    //for (Edge e : completeEdges) {
    //  e.draw();
    //}
    for (Edge e : incompleteEdges) {
      e.draw();
    }
  }
}
