
abstract class Element extends GraphObject{

  private String DEFAULT_SKIN = "default";
  private float velX = 0.0, velY = 0.0 ;//velocidade do objeto, parecido com passo, mas pode ser universál para vários objetos
  private ElementSkins skins; //<SkinName, Skin(List<stagesStrings>)>// lista de skins para o objeto
  private PImage stage;//estado do elemento
  private Skin currentSkin;//skin ativa
  private float opacity=1; //opacidade
  private float step; //o passo que o elemento anda por vez

  //constructors
  Element(float positionX, float positionY, ArrayList<ElementSkins> elementSkins) {
    this.skins = getObjectSkin(elementSkins, getObjectName());

    this.currentSkin = findSkin(this.skins, DEFAULT_SKIN);
    this.stage = loadImage(this.currentSkin.getImage(0));

    if (stage != null) {
      super.elementWidth = stage.width;
      super.elementHeight = stage.height;
    } else {
      throw new IllegalArgumentException("Invalid imagem path.");
    }

    super.elementWidth = getWidth();
    super.elementHeight = getHeight();
    super.coordenate = new Cartesian(positionX, positionY);
    this.step = getStep();
  }

  Element(float positionX, float positionY, float velocityX, float velocityY, ArrayList<ElementSkins> elementSkins) {
    this.skins = getObjectSkin(elementSkins, getObjectName());

    this.currentSkin = findSkin(this.skins, DEFAULT_SKIN);
    this.stage = loadImage(this.currentSkin.getImage(0));

    if (stage == null) {
      throw new IllegalArgumentException("Invalid imagem path.");
    }

    super.elementWidth = getWidth();
    super.elementHeight = getHeight();
    super.coordenate = new Cartesian(positionX, positionY);
    this.velX = velocityX;    
    this.velY = velocityY;
    this.step = getStep();
  }

  //abstract methods
  public abstract String getObjectName();

  public abstract float getStep();

  public abstract int getWidth();

  public abstract int getHeight();


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
    return super.coordenate.getY();
  }

  public float getBottomLoc() {
    return super.coordenate.getY() - super.elementHeight;
  }

  public float getLeftLoc() {
    return super.coordenate.getX();
  }

  public float getRigh() {
    return super.coordenate.getX() + super.elementWidth;
  }

  //setters
  public Element setLoc(float x, float y) {
    this.setLocX(x);
    this.setLocY(y);   
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
    this.stage = loadImage(this.currentSkin.getImage(stage));
    return this;
  }

  //Utils methods
  public void renderElement() {//considerar opacidade
    image(this.stage, super.coordenate.getX(), super.coordenate.getY());
  }

  public void moveX() {
   super.coordenate.setX(super.coordenate.getX() + this.step * this.velX) ;
  }  

  public void moveY() {
   super.coordenate.setY(super.coordenate.getY() + this.step * this.velY) ;
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