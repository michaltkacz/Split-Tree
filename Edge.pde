
class Edge {
  private Node lineStartNode;
  private Node lineEndNode;

  private PVector lineLength;
  private PVector lineCurrentEndPosition;

  private float lineLengthFactor = 0f;
  private boolean lineComplete = false;
  private boolean haveChildren = false;

  private color strokeC = color(5, 150, 220);
  private int strokeW = 2;
  private int strokeA = 255;

  public Edge(Node start, Node end) {
    lineStartNode = start;
    lineEndNode = end;
    lineLength = PVector.sub(lineEndNode.getPosition(), lineStartNode.getPosition());
    lineCurrentEndPosition = PVector.mult(lineLength, lineLengthFactor);
    lineCurrentEndPosition.add(lineStartNode.getPosition());
  }

  public Node getLineEndNode() {
    return lineEndNode;
  }

  public boolean isLineComplete() {
    return lineComplete;
  }

  public boolean isHaveChildren() {
    return haveChildren;
  }

  public void setHaveChildren(boolean haveChildren) {
    this.haveChildren = haveChildren;
  }

  public void update() {
    if (lineComplete) {
      return;
    }

    lineLengthFactor += 0.008;
    if (lineLengthFactor > 1f) {
      lineLengthFactor = 1f;
      lineComplete = true;
    }

    lineCurrentEndPosition = PVector.mult(lineLength, lineLengthFactor);
    lineCurrentEndPosition.add(lineStartNode.getPosition());
  }

  public void draw() {
    strokeWeight(strokeW); 
    stroke(strokeC, strokeA);
    line(lineStartNode.getPosition().x, lineStartNode.getPosition().y, lineCurrentEndPosition.x, lineCurrentEndPosition.y);
  }
}
