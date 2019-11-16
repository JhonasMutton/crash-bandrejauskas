public class ScenarioBackground extends LoopElement {

  ScenarioBackground(float positionX, float positionY, ArrayList<ElementSkins> elementSkins, Cartesian limitPosition) {
    super( positionX, positionY, elementSkins, limitPosition);
  }

  ScenarioBackground(float positionX, float positionY, float velocityX, float velocityY, ArrayList<ElementSkins> elementSkins, Cartesian limitPosition, String skinName) {
    super( positionX, positionY, velocityX, velocityY, elementSkins, 
      limitPosition, skinName);
  }

  @Override
    public String getObjectName() {
    return "scenario";
  }

  @Override
    public float getStep() {
    return 1.0;
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
