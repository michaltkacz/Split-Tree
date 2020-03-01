
class Edge {
  private PVector lineStartPosition;
  private PVector lineEndPosition;

  private PVector lineLength;
  private PVector lineCurrentEndPosition;

  private float lineLengthFactor = 0f;
  private boolean lineComplete = false;
  private boolean haveChildren = false;
   
  public Edge() {
    this(new PVector((float)Math.random() * width, (float) Math.random() * height));
  }

  public Edge(PVector _lineStartPosition) {
    lineStartPosition = _lineStartPosition;
    lineEndPosition = new PVector((float)Math.random() * width, (float) Math.random() * height);

    lineLength = PVector.sub(lineEndPosition, lineStartPosition);
    lineCurrentEndPosition = PVector.mult(lineLength, lineLengthFactor);
    lineCurrentEndPosition.add(lineStartPosition);
  }

  public PVector getLineEndPosition() {
    return lineEndPosition;
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

    lineLengthFactor += 0.01;
    if (lineLengthFactor > 1f) {
      lineLengthFactor = 1f;
      lineComplete = true;
    }

    lineCurrentEndPosition = PVector.mult(lineLength, lineLengthFactor);
    lineCurrentEndPosition.add(lineStartPosition);
  }

  public void draw() {
    //noStroke();
    //fill(color(100, 200, 220));
    //circle(lineStartPosition.x, lineStartPosition.y, 5);

    //noStroke();
    //fill(color(220, 100, 100));
    //circle(lineEndPosition.x, lineEndPosition.y, 5);


    strokeWeight(1); 
    stroke(color(5, 150, 220));
    line(lineStartPosition.x, lineStartPosition.y, lineCurrentEndPosition.x, lineCurrentEndPosition.y);
  }
}
