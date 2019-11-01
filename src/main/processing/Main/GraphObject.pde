abstract class GraphObject {
  private Cartesian coordenate;
  private float elementWidth, elementHeight; 
  public void setLocX(float locX) {
    this.coordenate.setX(locX);    
  }

  public void setLocY(float locY) {
    this.coordenate.setY(locY);    
  }
  //getters
  public float getLocX() {
    return this.coordenate.getX();
  }
  
  public float getLocY() {
    return this.coordenate.getY();
  }
}
