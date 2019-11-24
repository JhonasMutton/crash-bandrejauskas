public class Text extends GraphObject {
  private RGB selectedColor;
  private RGB unselectedColor;
  private int fontSize;
  private PFont font;
  private String text;
  private RGB currentColor;
  private int align = LEFT;

  Text(String text, Cartesian coordenate, int fontSize, FontEnum font, RGB selected, RGB unselected, String align) {
    this.text = text;
    super.coordenate = coordenate;
    this.fontSize = fontSize;
    this.font = createFont(font.toString(), fontSize) ;
    this.selectedColor = selected;
    this.unselectedColor = unselected;
    this.currentColor = unselected;

    switch(align) {
    case "left":
      this.align = LEFT;
      break;
    case "center":
      this.align = CENTER;
      break;
    case "right":
      this.align = RIGHT;
      break;
    }
    
  }

  public void setSelected(boolean selected) {
    if (selected) {
      this.currentColor = selectedColor;
    } else {
      this.currentColor = unselectedColor;
    }
  }

  public void setText(String text) {
    this.text = text;
  }

  public void renderText() {
    fill(currentColor.r, currentColor.g, currentColor.b);
    textFont(font, fontSize);   
    //textAlign();

    //translate(width/2, height/2);  // Translate to the center//coloca a referencia central
    //rotate(1);      
    // Rotate by theta

    textAlign(this.align);          //colocar alinhamento  
    text(text, super.coordenate.getX(), super.coordenate.getY());
  }
}
