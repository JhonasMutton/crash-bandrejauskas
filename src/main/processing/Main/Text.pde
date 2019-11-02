public class Text extends GraphObject {
  private RGB selectedColor;
  private RGB unselectedColor;
  private int fontSize;
  private PFont font;
  private String text;
  private boolean selected;
  private RGB currentColor;

  Text(String text, Cartesian coordenate, int fontSize, FontEnum font, RGB selected, RGB unselected) {
    this.text = text;
    super.coordenate = coordenate;
    this.fontSize = fontSize;
    this.font = createFont(font.toString(), fontSize) ;
    this.selectedColor = selected;
    this.unselectedColor = unselected;
    this.currentColor = unselected;
  }

  public void setSelected(boolean selected) {
    this.selected = selected;
    if (selected) {
      this.currentColor = selectedColor;
    } else {
      this.currentColor = unselectedColor;
    }
  }

  public void renderText() {
    fill(currentColor.r, currentColor.g, currentColor.b);
    textFont(font,fontSize);   
    //textAlign();
    
  translate(width/2,height/2);  // Translate to the center//coloca a referencia central
  //rotate(1);      
  // Rotate by theta
  
  textAlign(CENTER);          //colocar alinhamento  
  text(text,0,0);     
  }
}
