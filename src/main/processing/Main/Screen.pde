abstract class Screen {

  GameStateEnum nextGameState;
  int lastRenderMillis = millis();
  int stepMillis = 1/Constants.FPS;
  ArrayList<ElementSkins> elementSkins;
  
  Screen(ArrayList<ElementSkins> elementSkins){
    this.elementSkins = elementSkins;
  }
  
  public abstract void renderScreen();

  public GameStateEnum getNextState() {
    return nextGameState;
  }

  public boolean isRender() {
    int time = millis();
    boolean isRender = ((time-lastRenderMillis) >= this.stepMillis);

    if (isRender) {
      lastRenderMillis = time;
    }
    return isRender;
  }
}
