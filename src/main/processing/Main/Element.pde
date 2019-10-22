
abstract class Element {

  private String DEFAULT_SKIN = "default";
  private Cartesian coordenate;//coodenates of element
  private float velX = 0.0, velY = 0.0 ;//velocidade do objeto, parecido com passo, mas pode ser universál para vários objetos
  private ElementSkins skins; //<SkinName, Skin(List<stagesStrings>)>// lista de skins para o objeto
  private PImage stage;//estado do elemento
  private Skin currentSkin;//skin ativa
  private float elementWidth, elementHeight; //largura e altura do elemento//talvez deixar para a implementação definir um tamanho estático
  private float opacity=1; //opacidade
  private float step; //o passo que o elemento anda por vez

  //constructors
  Element(float positionX, float positionY, ArrayList<ElementSkins> elementSkins) {
    this.skins = getObjectSkin(elementSkins, getObjectName());

    this.currentSkin = findSkin(this.skins, DEFAULT_SKIN);
    this.stage = loadImage(this.currentSkin.getImage(0));

    if (stage != null) {
      elementWidth = stage.width;
      elementHeight = stage.height;
    } else {
      throw new IllegalArgumentException("Invalid imagem path.");
    }

    this.coordenate = new Cartesian(positionX, positionY);
    this.step = getStep();
  }

  Element(float positionX, float positionY, float velocityX, float velocityY, ArrayList<ElementSkins> elementSkins) {
    this.skins = getObjectSkin(elementSkins, getObjectName());

    this.currentSkin = findSkin(this.skins, DEFAULT_SKIN);
    this.stage = loadImage(this.currentSkin.getImage(0));

    if (stage == null) {
      throw new IllegalArgumentException("Invalid imagem path.");
    }

    this.elementWidth = getWidth();
    this.elementHeight = getHeight();
    this.coordenate = new Cartesian(positionX, positionY);
    this.velX = velocityX;    
    this.velY = velocityY;
    this.step = getStep();
  }

  //abstract methods
  public abstract String getObjectName();

  public abstract float getStep();

  public abstract int getWidth();

  public abstract int getHeight();

  //getters
  public float getLocX() {
    return this.coordenate.getX();
  }

  public float getLocY() {
    return this.coordenate.getY();
  }

  public float getVelX() {
    return this.velX;
  }

  public float getVelY() {
    return this.velY;
  }

  public float getOpacity() {
    return this.opacity;
  }
  //Colision Methods
  public float getTopLoc() {
    return this.coordenate.getY();
  }

  public float getBottomLoc() {
    return this.coordenate.getY() - this.elementHeight;
  }

  public float getLeftLoc() {
    return this.coordenate.getX();
  }

  public float getRightLoc() {
    return this.coordenate.getX() + this.elementWidth;
  }

  //setters
  public Element setLoc(float x, float y) {
    this.setLocX(x);
    this.setLocY(y);
    return this;
  }

  public Element setLocX(float locX) {
    this.coordenate.setX(locX);    
    return this;
  }

  public Element setLocY(float locY) {
    this.coordenate.setY(locY);    
    return this;
  }

  public Element setVelY(float velY) {
    this.velY = velY;  
    return this;
  }

  public Element setVelX(float velX) {
    this.velX = velX;  
    return this;
  }

  public Element setOpacity(float opacity) {
    this.opacity = opacity;
    return this;
  }  

  public Element setActiveSkin(String skinName) {
    this.currentSkin = findSkin(this.skins, skinName);
    this.stage = loadImage(this.currentSkin.getImage(0));
    return this;
  }

  public Element setActiveStage(int stage) {
    this.stage = loadImage(this.currentSkin.getImage(stage));//PODE DAR INDEX OUT OF BOUND EXCEPTION
    return this;
  }

  //Utils methods
  public void renderElement() {//considerar opacidade
    image(this.stage, this.coordenate.getX(), this.coordenate.getY());
  }

  public void moveX() {
   this.coordenate.setX(this.coordenate.getX() + this.step * this.velX) ;
  }  

  public void moveY() {
   this.coordenate.setY(this.coordenate.getY() + this.step * this.velY) ;
  } 

  public void moveXAndRender() {
    moveX();
    renderElement();
  }  

  public void moveYAndRender() {
    moveY();
    renderElement();
  }  

  public Skin findSkin(ElementSkins skins, String skinToFind) {
    for (Skin skin : skins.getSkins()) {
      if (skinToFind.equals(skin.getSkinName())) {
        return skin;
      }
    }
    throw new IllegalArgumentException("Skin não encontrada!");
  }

  private ElementSkins getObjectSkin(ArrayList<ElementSkins> elementSkins, String objectType) {
    for (ElementSkins skin : elementSkins) {
      if (objectType.equals(skin.getObjectType())) {
        return skin;
      }
    }
    throw new IllegalArgumentException("Skin não encontrada!");
  }
}
