public class Personage extends Element {

  private PersonageAnimationStage personageStage = PersonageAnimationStage.RUNNING;
  private PersonageAnimationStage lastPersonageStage = PersonageAnimationStage.RUNNING;

  private int lastSpriteChanged = millis();
  private int personageAnimationStatus= 0;
  private boolean isJumping;

  Personage(float positionX, float positionY, ArrayList<ElementSkins> elementSkins) {
    super( positionX, positionY, elementSkins);
  }

  Personage(float positionX, float positionY, float velocityX, float velocityY, ArrayList<ElementSkins> elementSkins, String skinName) {
    super(positionX, positionY, velocityX, velocityY, elementSkins, skinName);
  }

  @Override
    public String getObjectName() {
    return "personage";
  }

  @Override
    public float getStep() {
    return 1.0;
  }

  @Override
    public int getWidth() {
    return 317;
  }

  @Override
    public int getHeight() {
    return 325;
  }

  private void moveAndRenderPersonage(boolean stopped) {
    if (!stopped) {
      switch (this.personageStage) {
      case RUNNING:
        running();
        break;
      case JUMPING:
        jumping();
        break;
      case CROUCHING:
        break;
      }
    }
    this.renderElement();
  }

  private boolean isChangePersonageStatus() {
    int time = millis();
    boolean isRender = ((time-lastSpriteChanged) >= 20);

    if (isRender) {
      lastSpriteChanged = time;
    }
    return isRender;
  }

  private void running() {
    if (lastPersonageStage != PersonageAnimationStage.RUNNING) {
      personageAnimationStatus = 0;
    }
    
    lastPersonageStage = PersonageAnimationStage.RUNNING;
    if (isChangePersonageStatus() && personageAnimationStatus < 20) {
      this.setActiveStage(personageAnimationStatus);
      this.personageAnimationStatus++;
    }
    if (personageAnimationStatus == 20) {
      this.personageAnimationStatus = 0;
      this.personageStage = PersonageAnimationStage.RUNNING;
    }
  }

  private void jumping() {
    if (lastPersonageStage != PersonageAnimationStage.JUMPING) {
      personageAnimationStatus = 20;
    }
    lastPersonageStage = PersonageAnimationStage.JUMPING;
    
    if (isChangePersonageStatus() && personageAnimationStatus >= 20 && personageAnimationStatus <= 29) {
      this.setActiveStage(personageAnimationStatus);
      this.personageAnimationStatus++;
    }

    if (this.getLocY() < 30) {
      this.setVelY(this.getVelY() * -1);
    } else if (this.getLocY() > 500) {
      this.setVelY(this.getVelY() * -1);
      this.personageStage = PersonageAnimationStage.RUNNING;
      this.setLocY(500);
      this.isJumping = false;
      return;
    }
    this.moveY();
  }

  private void setPersonageStage(PersonageAnimationStage stage) {
    this.personageStage =  stage;
  }
}

public enum PersonageAnimationStage {
  JUMPING, 
    RUNNING, 
    CROUCHING
}
