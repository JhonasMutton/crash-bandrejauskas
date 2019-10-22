
PImage img;
float offset = 0;
float easing = 0.05;

void setup() {
  size(640, 360);
 Utils utils =  new Utils();
 
ArrayList<ElementSkins> elementSkins =  utils.loadJsonSkins("skins/skins.json");

print(elementSkins.toString()); //<>//
}

void draw() { 

}
