public class Button extends GraphObject {

  private String text;
  private boolean state;
  private RGB selected;
  private RGB unselected;


  Button(String text, float buttonWidth, float buttonHeight, Cartesian coordenate, RGB selected, RGB unselected) {
    this.text = text;
    super.elementWidth = buttonWidth;
    super.elementHeight =  buttonHeight;

    super.coordenate = coordenate;

    this.selected = selected;
    this.unselected = unselected;
    this.state=true;
  }

  public void renderButton() {
    if (state) {
      fill(selected.r, selected.g, selected.b);
    } else {
      fill(unselected.r, unselected.g, unselected.b);
    }
    rect(super.coordenate.getX(), super.coordenate.getY(),super.elementWidth, super.elementHeight);
    //text(text, super.coordenate.getX(), super.coordenate.getY());
    
    Text text = new Text("Texto", new Cartesian(500, 500) , 70, FontEnum.DEFAULT, new RGB(0, 0,0), new RGB(255, 0, 0));
    text.renderText();
    }
}
