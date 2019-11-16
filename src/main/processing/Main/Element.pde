
abstract class Element extends GraphObject {

  private String DEFAULT_SKIN = "default";
  private float velX = 0.0, velY = 0.0 ;//velocidade do objeto, parecido com passo, mas pode ser universál para vários objetos
  private ElementSkins skins; //<SkinName, Skin(List<stagesStrings>)>// lista de skins para o objeto
  private ArrayList<PImage> loadedSkin;
  private PImage stage;//estado do elemento
  private Skin currentSkin;//skin ativa
  private float opacity=1; //opacidade
  private float step; //o passo que o elemento anda por vez

  //constructors
  Element(float positionX, float positionY, ArrayList<ElementSkins> elementSkins) {    
    this.skins = getObjectSkin(elementSkins, getObjectName());

    findAndLoadSkin(DEFAULT_SKIN);

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

  Element(float positionX, float positionY, float velocityX, float velocityY, ArrayList<ElementSkins> elementSkins, String skinName) {
    this.skins = getObjectSkin(elementSkins, getObjectName());

    if (skinName == null || skinName == "") {
      skinName= DEFAULT_SKIN;
    }
    
    findAndLoadSkin(skinName);

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

  public Cartesian getCenter() {
    float cx = super.coordenate.getX() + this.getWidth()/2;
    float cy = super.coordenate.getY() - this.getHeight()/2;
    return new Cartesian(cx, cy);
  }

  public float getRadiusWidht() {
    return this.getWidth()/2;
  }

  public float getRadiusHeight() {
    return this.getHeight()/2;
  }

  public float getLocX() {
    return super.coordenate.getX();
  }

  public float getLocY() {
    return super.coordenate.getY();
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
    loadSkin(this.currentSkin);
    setActiveStage(0);
    return this;
  }

  public Element setActiveStage(int stage) {
    this.stage = this.loadedSkin.get(stage);
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

  private void loadSkin(Skin skin) {
    ArrayList<String> skins = skin.getImages();
    ArrayList<PImage> imagesLoaded = new ArrayList();
    for (String img : skins) {
      imagesLoaded.add(loadImage(img));
    }
    this.loadedSkin = imagesLoaded;
  }

  private void findAndLoadSkin(String skinName) {
    this.currentSkin = findSkin(this.skins, skinName);
    loadSkin(this.currentSkin);
    setActiveStage(0);
  }
}
