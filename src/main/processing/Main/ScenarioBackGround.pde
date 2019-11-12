public class ScenarioBackground extends Element {

  ScenarioBackground(float positionX, float positionY, ArrayList<ElementSkins> elementSkins) {
    super( positionX, positionY, elementSkins);
  }

  ScenarioBackground(float positionX, float positionY, float velocityX, float velocityY, ArrayList<ElementSkins> elementSkins) {
    super(positionX, positionY, velocityX, velocityY, elementSkins);
  }

  @Override
    public String getObjectName() {
    return "Scenario";
  }

  @Override
    public float getStep() {
    return 2.0;
  }

  @Override
    public int getWidth() {
    return 1920;
  }

  @Override
    public int getHeight() {
    return 1080;
  }
}
