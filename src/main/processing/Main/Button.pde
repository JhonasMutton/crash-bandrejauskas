public class Button extends GraphObject {

  private MouseState state;
  private MouseState priviousState = MouseState.UNSELECTED;
  private PImage selected;
  private PImage unselected;
  private PImage inOver;
  private SoundFile overSound;
  private SoundFile clickSound;

  Button(Main main, float buttonWidth, float buttonHeight, Cartesian coordenate, String unselected, String selected, String inOver, String clickSound, String overSound) {
    super.elementWidth = buttonWidth;
    super.elementHeight =  buttonHeight;
    super.coordenate = coordenate;
    this.selected = loadImage(selected);
    this.unselected = loadImage(unselected);
    this.inOver = loadImage(inOver);
    this.state= MouseState.UNSELECTED;
    this.overSound =  new SoundFile(main, overSound);
    this.clickSound  =  new SoundFile(main, clickSound);
  }

  public void mouseOver() {
    this.priviousState = this.state;
    this.state = MouseState.OVER;
  }

  public void mouseSelected() {
    this.priviousState = this.state;
    this.state = MouseState.SELECTED;
  }

  public void mouseUnselected() {
    this.priviousState = this.state;
    this.state = MouseState.UNSELECTED;
  }

  public void renderButton() {
    switch (state) {
    case OVER:
      if (this.priviousState != MouseState.OVER) {
        this.clickSound.stop();
        this.overSound.play();
      }
      image(inOver, super.getLocX(), super.getLocY());
      break;
    case SELECTED:
      image(selected, super.getLocX(), super.getLocY());
      if (this.priviousState != MouseState.SELECTED) {
        this.clickSound.play();
        this.overSound.stop();
      }
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

  public boolean isPressed() {
    if (mousePressed && (mouseButton == LEFT)) {//TODO-transformar numa função de verificação
      if (this.isOnTop(mouseX, mouseY)) {
        mouseSelected();
        return true ;
      }
    } else if (this.isOnTop(mouseX, mouseY)) {
      mouseOver();
    } else {
      mouseUnselected();
    }
   // this.renderButton();
    return false;
  }
}
