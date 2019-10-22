class Box extends Element {

  Box(float positionX, float positionY, ArrayList<ElementSkins> elementSkins) {
    super( positionX, positionY, elementSkins);
  }

  Box(float positionX, float positionY, float velocityX, float velocityY, ArrayList<ElementSkins> elementSkins) {
    super(positionX, positionY, velocityX, velocityY, elementSkins);
  }

  @Override
    public String getObjectName() {
    return "box";
  }

  @Override
    public float getStep() {
    return 2.0;
  }

  @Override
    public int getWidth() {
    return 100;
  }

  @Override
    public int getHeight() {
    return 100;
  }
}
