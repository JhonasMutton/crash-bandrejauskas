public class Personage extends Element {

  private PersonageAnimationStage personageStage = PersonageAnimationStage.INITIAL_SPRINT;
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
    return 175;
  }

  @Override
    public int getHeight() {
    return 200;
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
      case INITIAL_SPRINT:
        initialSprint();
        break;
      }
    }
    this.renderElement();
  }

  private boolean isChangePersonageStatus() {
    int time = millis();
    boolean isRender = ((time-lastSpriteChanged) >= 100);

    if (isRender) {
      lastSpriteChanged = time;
    }
    return isRender;
  }

  private void running() {
    // print(personageAnimationStatus, "\n");
    if (isChangePersonageStatus() && personageAnimationStatus < 14) {
      this.setActiveStage(personageAnimationStatus+6);
    }
    this.personageAnimationStatus++;
    if (personageAnimationStatus == 14) {
      this.personageAnimationStatus = 0;
      this.personageStage = PersonageAnimationStage.RUNNING;
    }
  }

  private void jumping() {
    if (this.getLocY() < 200) {
      this.setVelY(this.getVelY() * -1);
    } else if (this.getLocY() > 600) {
      this.setVelY(this.getVelY() * -1);
      this.personageStage = PersonageAnimationStage.INITIAL_SPRINT;
      this.personageAnimationStatus = 0;
      this.setLocY(600);
      this.isJumping = false;

      return;
    }
    this.moveY();
  }

  private void initialSprint() {
    // print(personageAnimationStatus, "\n");
    if (isChangePersonageStatus() && personageAnimationStatus < 6) {
      this.setActiveStage(personageAnimationStatus);
    }
    personageAnimationStatus++;
    if (personageAnimationStatus == 6) {
      personageAnimationStatus = 8;
      personageStage = PersonageAnimationStage.RUNNING;
    }
  }

  private void setPersonageStage(PersonageAnimationStage stage) {
    this.personageStage =  stage;
  }
}




public enum PersonageAnimationStage {
  INITIAL_SPRINT, 
    JUMPING, 
    RUNNING, 
    CROUCHING
}
