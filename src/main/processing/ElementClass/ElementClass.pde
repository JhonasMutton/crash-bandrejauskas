
//*************************************************************

class Skin {

  private final ArrayList<String> stageImages;

  Skin(ArrayList images) {
    this.stageImages = images;
  }

  public String getImage(int index) {
    return this.stageImages.get(index);
  }

  public ArrayList<String> getImages() {
    return this.stageImages;
  }
}
//*************************************************************
class Cartesian {
  private float x, y;

  Cartesian(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public Cartesian setX(float x) {
    this.x = x;
    return this;
  }

  public Cartesian setY(float y) {
    this.y = y;
    return this;
  }
}
//*************************************************************
abstract class Element {

  private String DEFAULT_SKIN = "default";
  private Cartesian coordenate;
  private float locX, locY; //talvez colocar um objeto com isso
  private float velX = 0.0, velY = 0.0 ;//velocidade do objeto, parecido com passo, mas pode ser universál para vários objetos
  private HashMap<String, Skin> skins; //<SkinName, Skin(List<stagesStrings>)>// lista de skins para o objeto
  private PImage stage;//estado do elemento
  private Skin currentSkin;//skin ativa
  private float elementWidth, elementHeight; //largura e altura do elemento//talvez deixar para a implementação definir um tamanho estático
  private float opacity=1; //opacidade
  private static float step; //o passo que o elemento anda por vez

  //constructors
  Element(float positionX, float positionY, float step, HashMap<String, Skin> skins) {
    this.skins = skins;//talvez receber skins por métodos implementados pelas classes filhas, assim fazendo ela mesmos separar de toda coleção de skins

    this.currentSkin = this.skins.get(DEFAULT_SKIN);//PODE DAR NULLPOINTE
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

  Element(float positionX, float positionY,float step, HashMap<String, Skin> skins, float velocityX, float velocity, ) {
    this.skins = skins;

    String imagePath = this.skins.get(DEFAULT_SKIN).getImage(0);
    this.stage = loadImage(imagePath);

    if (stage != null) {
      elementWidth = stage.width;
      elementHeight = stage.height;
    } else {
      throw new IllegalArgumentException("Invalid imagem path.");
    }


    this.coordenate = new Cartesian(positionX, positionY);
    this.velX = velocityX;    
    this.velY = velocityY;
    this.step = step;
  }
  
  //A classe filha define o passo para o elemento
  public float getStep(){
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
  //**********************************************************************************
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
    this.currentSkin = this.skins.get(skinName);//PODE DAR NULLPOINTER
    this.stage = loadImage(this.currentSkin.getImage(0));
    return this;
  }

  public Element setActiveStage(Int stage) {
    this.stage = loadImage(this.currentSkin.getImage(stage));//PODE DAR INDEX OUT OF BOUND EXCEPTION
    return this;
  }

//criar metodos cde colisão, DONE
//c variavel de opacidade, DONE
//e ver maneira de adicionar skins e ou multiplos estados DONE
//setar a skin atual no objeto
}
