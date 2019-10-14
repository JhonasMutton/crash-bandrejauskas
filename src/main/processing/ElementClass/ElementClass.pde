abstract class Element {

  private float locX, locY; //talvez colocar um objeto com isso
  private float velX = 0.0, velY = 0.0 ;
  private PImage image;//cogitar a posibilidade de o mesmo elemento ter mais de uma imagem/estado, e armazenar todas a imagens e em qual estado a imagem é atrelada
  private String imagePath;
  private float elementWidth, elementHeight;

  Element(String imagePath, float positionX, float positionY) {
    this.image = loadImage(imagePath);

    if (image != null) {
      elementWidth = image.width;
      elementHeight = image.height;
    } else {
      throw new IllegalArgumentException("Invalid imagem path.");
    }

    this.locX = positionX; 
    this.locY = positionY;
  }

  Element(String imagePath, float positionX, float positionY, float velocityX, float velocityY) {
    this.image = loadImage(imagePath);

    if (image != null) {
      elementWidth = image.width;
      elementHeight = image.height;
    } else {
      throw new IllegalArgumentException("Invalid imagem path.");
    }

    this.locX = positionX; 
    this.locY = positionY; 
    this.velX = velocityX;    
    this.velY = velocityY;
  }

  public float getLocX() {
    return this.locX;
  }

  public float getLocY() {
    return this.locY;
  }
  
  public float getVelX() {
    return this.velX;
  }
  
  public float getVelY() {
    return this.velY;
  }

  public Element setLocX(float locX) {
    this.locX = locX;  
    return this;
  }

  public Element setLocY(float locY) {
    this.locY = locY;  
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
  
}
