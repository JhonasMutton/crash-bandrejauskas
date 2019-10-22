 //<>//
PImage img;
float offset = 0;
float easing = 0.05;

void setup() {
  size(800, 800);
  Utils utils =  new Utils();

  ArrayList<ElementSkins> elementSkins =  utils.loadJsonSkins("skins/skins.json");

  Box box  = new Box(0, 400, 100, 0, elementSkins); //<>//


  box.moveXAndRender();

  print(elementSkins.toString());
}

void draw() {
}
