public class Game extends Screen {

  private boolean firstTime = true;
  private ScenarioBackground scenario;
  private ScenarioBackground scenario2;
  
  @Override
    public void renderScreen() {
    if(isRender()){  
      
    super.nextGameState = GameStateEnum.GAME_SCREEN;
    background(200, 00, 200);
    if (firstTime) {
      Utils utils =  new Utils();

      ArrayList<ElementSkins> elementSkins =  utils.loadJsonSkins("skins/skins.json");
      scenario = new ScenarioBackground(0, 0, -10, -3, elementSkins, new Cartesian(-1920, -1080));    
      scenario2 = new ScenarioBackground(1920,0 , -10, -3, elementSkins, new Cartesian(0, 0));    

      this.firstTime = false;
    }

    scenario.moveXAndRender();
    scenario2.moveXAndRender();

    //super.nextGameState =
    }
  }
}
