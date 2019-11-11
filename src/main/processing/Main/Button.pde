public class Button extends GraphObject {

  private MouseState state;
  private PImage selected;
  private PImage unselected;
  private PImage inOver;

  Button(float buttonWidth, float buttonHeight, Cartesian coordenate, String unselected, String selected, String inOver) {
    super.elementWidth = buttonWidth;
    super.elementHeight =  buttonHeight;
    super.coordenate = coordenate;
    this.selected = loadImage(selected);
    this.unselected = loadImage(unselected);
    this.inOver = loadImage(inOver);
    this.state= MouseState.UNSELECTED;
  }

  public void mouseOver() {
    this.state = MouseState.OVER;
  }

  public void mouseSelected() {
    this.state = MouseState.SELECTED;
  }

  public void mouseUnselected() {
    this.state = MouseState.SELECTED;
  }

  public void renderButton() {
    switch (state) {
    case OVER:
      image(inOver, super.getLocX(), super.getLocY());
      break;
    case SELECTED:
      image(selected, super.getLocX(), super.getLocY());      
      break;
    case UNSELECTED:
      image(unselected, super.getLocX(), super.getLocY());      
      break;
    }
    //rect(super.coordenate.getX(), super.coordenate.getY(), super.elementWidth, super.elementHeight);
    //text(text, super.coordenate.getX(), super.coordenate.getY());

    //Text text = new Text("Texto", new Cartesian(500, 500), 70, FontEnum.DEFAULT, new RGB(0, 0, 0), new RGB(255, 0, 0));
    //text.renderText();
  }

  public boolean isOnTop(int x, int y) {
    return
      ((x > super.getLocX() && x< (super.getLocX() + super.elementWidth)) &&
      (y > super.getLocY() &&y < (super.getLocY() + super.elementHeight)));
  }
}
