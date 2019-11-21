class Box extends LoopElement {

  Box(float positionX, float positionY, ArrayList<ElementSkins> elementSkins, Cartesian limitPosition) {
    super( positionX, positionY, elementSkins, limitPosition);
  }

  Box(float positionX, float positionY, float velocityX, float velocityY, ArrayList<ElementSkins> elementSkins, Cartesian limitPosition, String skinName) {
    super( positionX, positionY, velocityX, velocityY, elementSkins, limitPosition, skinName);
  }

  @Override
    public String getObjectName() {
    return "box";
  }

  @Override
    public float getStep() {
    return 1.0;
  }

  @Override
    public int getWidth() {
    return 144;
  }

  @Override
    public int getHeight() {
    return 150;
  }
}
