abstract class LoopElement extends Element {

  private Cartesian initialPosition;
  private Cartesian limitPosition;

  LoopElement(float positionX, float positionY, ArrayList<ElementSkins> elementSkins, Cartesian limitPosition) {
    super( positionX, positionY, elementSkins);
    this.initialPosition = new Cartesian(positionX, positionY);
    this.limitPosition = limitPosition;
  }

  LoopElement(float positionX, float positionY, float velocityX, float velocityY, ArrayList<ElementSkins> elementSkins, Cartesian limitPosition) {
    super(positionX, positionY, velocityX, velocityY, elementSkins);
    this.initialPosition = new Cartesian(positionX, positionY);
    this.limitPosition = limitPosition;
  }
  
  
}
