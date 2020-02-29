Tree tree;

void setup() {
  size(2000, 1000);
  background(230);  

  tree = new Tree();
}

void draw() {  
  tree.update();
  tree.draw();
}
