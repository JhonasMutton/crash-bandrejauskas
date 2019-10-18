
abstract class Element {

  private String DEFAULT_SKIN = "default";
  private Cartesian coordenate;
  private float locX, locY; //talvez colocar um objeto com isso
  private float velX = 0.0, velY = 0.0 ;//velocidade do objeto, parecido com passo, mas pode ser universál para vários objetos
  private ArrayList<Skin> skins; //<SkinName, Skin(List<stagesStrings>)>// lista de skins para o objeto
  private PImage stage;//estado do elemento
  private Skin currentSkin;//skin ativa
  private float elementWidth, elementHeight; //largura e altura do elemento//talvez deixar para a implementação definir um tamanho estático
  private float opacity=1; //opacidade
  private float step; //o passo que o elemento anda por vez

  //constructors
  Element(float positionX, float positionY) {
    this.skins = getObjectSkin();//talvez receber skins por métodos implementados pelas classes filhas, assim fazendo ela mesmos separar de toda coleção de skins

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

  Element(float positionX, float positionY, float velocityX, float velocityY) {
    this.skins = getObjectSkin();

    this.currentSkin = findSkin(this.skins, DEFAULT_SKIN);
    this.stage = loadImage(this.currentSkin.getImage(0));

    if (stage != null) {
      elementWidth = stage.width;
      elementHeight = stage.height;
    } else {
      throw new IllegalArgumentException("Invalid imagem path.");
    }


    this.coordenate = new Cartesian(positionX, positionY);
    this.velX = velocityX;    
    this.velY = velocityY;
    this.step = getStep();
  }

  //A classe filha define o passo para o elemento
  public float getStep() {
    return 0.0;
  }

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
  //**********************************************************************************
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

  //metodos de colisão das pontas
  //**********************************************************************************

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

  //Metodos de render
  public void renderElement() {//considerar opacidade
    image(this.stage, this.locX, this.locY);
  }

  public void moveX() {
    this.locX = this.locX + this.step * this.velX;
  }  

  public void moveY() {
    this.locY = this.locY + this.step * this.velY;
  } 

  public void moveXAndRender() {
    moveX();
    renderElement();
  }  

  public void moveYAndRender() {
    moveY();
    renderElement();
  }  
  //Metodos de renderização, de andar para X e ou Y, de andar e renderizar DONE
  //criar metodos cde colisão, DONE
  //c variavel de opacidade, DONE
  //e ver maneira de adicionar skins e ou multiplos estados DONE
  //setar a skin atual no objeto

  //exportar para classe static
  public Skin findSkin(ArrayList<Skin> skins, String skinToFind) {
    for (Skin skin : skins) {
      if (skinToFind.equals(skin.getSkinName())) {
        return skin;
      }
    }
    throw new IllegalArgumentException("Skin não encontrada!");
  }
  
  //implementar na classe filha
  public ArrayList<Skin> getObjectSkin(){
   return null; 
  }
}
