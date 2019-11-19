abstract class LoopElement extends Element {

  private Cartesian initialPosition;
  private Cartesian limitPosition;

  LoopElement(float positionX, float positionY, ArrayList<ElementSkins> elementSkins, Cartesian limitPosition) {
    super( positionX, positionY, elementSkins);
    this.initialPosition = new Cartesian(positionX, positionY);
    this.limitPosition = limitPosition;
  }

  LoopElement(float positionX, float positionY, float velocityX, float velocityY, ArrayList<ElementSkins> elementSkins, Cartesian limitPosition, String skinName) {
    super(positionX, positionY, velocityX, velocityY, elementSkins, skinName);
    this.initialPosition = new Cartesian(positionX, positionY);
    this.limitPosition = limitPosition;
  }

  @Override
    public void moveX() {
    float loc = super.getLocX() + super.step * super.velX;  

    if (loc < this.limitPosition.x) {
      super.setLoc(this.initialPosition.x, super.getLocY()) ;
    } else {
      super.setLoc(loc, super.getLocY()) ;
    }
  }  

  @Override
    public void moveY() {
    float loc = super.getLocY() + super.step * super.velY;  

    if (loc < this.limitPosition.y) {
      super.setLoc( super.getLocX(), this.initialPosition.y) ;
    } else {
      super.setLoc( super.getLocX(), loc) ;
    }
  }
}
