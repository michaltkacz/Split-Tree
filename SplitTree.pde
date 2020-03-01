Tree tree;

void setup() {
  size(2000, 800);
  background(250);  
  noSmooth();
  tree = new Tree();
}

void draw() {
  //background(250);
  tree.update();
  tree.draw();
}
