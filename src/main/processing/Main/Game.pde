public class Game extends Screen {

  private boolean firstTime = true;
  private ScenarioBackground scenario;
  private ScenarioBackground scenario2;
  private ArrayList<ScenarioBackground> scenariosLoaded = new ArrayList();

  @Override
    public void renderScreen() {
    if (isRender()) {  

      super.nextGameState = GameStateEnum.GAME_SCREEN;
      background(200, 00, 200);
      if (firstTime) {
        this.loadBackground();
        this.firstTime = false;
      }
      moveAndRenderScenario();
    }
  }

  private void moveAndRenderScenario() {
    for (ScenarioBackground scenario : this.scenariosLoaded) {
      scenario.moveXAndRender();
    }
  }

  private void loadBackground() {
    Utils utils =  new Utils();
    ArrayList<ElementSkins> elementSkins =  utils.loadJsonSkins("skins/skins.json");

    this.scenariosLoaded.add(new ScenarioBackground(0, 0, -10, -3, elementSkins, new Cartesian(-1920, -1080), "layer1"));
    this.scenariosLoaded.add( new ScenarioBackground(1920, 0, -10, -3, elementSkins, new Cartesian(0, 0), "layer1"));

    this.scenariosLoaded.add(new ScenarioBackground(0, 0, -5, -3, elementSkins, new Cartesian(-1920, -1080), "layer2"));
    this.scenariosLoaded.add( new ScenarioBackground(1920, 0, -5, -3, elementSkins, new Cartesian(0, 0), "layer2"));

    this.scenariosLoaded.add(new ScenarioBackground(0, 0, -7, -3, elementSkins, new Cartesian(-1920, -1080), "layer3"));
    this.scenariosLoaded.add( new ScenarioBackground(1920, 0, -7, -3, elementSkins, new Cartesian(0, 0), "layer3"));

    this.scenariosLoaded.add(new ScenarioBackground(0, 0, -8, -3, elementSkins, new Cartesian(-1920, -1080), "layer4"));
    this.scenariosLoaded.add( new ScenarioBackground(1920, 0, -8, -3, elementSkins, new Cartesian(0, 0), "layer4"));

    this.scenariosLoaded.add(new ScenarioBackground(0, 0, -10, -3, elementSkins, new Cartesian(-1920, -1080), "layer5"));
    this.scenariosLoaded.add( new ScenarioBackground(1920, 0, -10, -3, elementSkins, new Cartesian(0, 0), "layer5"));

    this.scenariosLoaded.add(new ScenarioBackground(0, 0, -10, -3, elementSkins, new Cartesian(-1920, -1080), "layer6"));
    this.scenariosLoaded.add( new ScenarioBackground(1920, 0, -10, -3, elementSkins, new Cartesian(0, 0), "layer6"));

    this.scenariosLoaded.add(new ScenarioBackground(0, 0, -15, -3, elementSkins, new Cartesian(-1920, -1080), "layer7"));
    this.scenariosLoaded.add( new ScenarioBackground(1920, 0, -15, -3, elementSkins, new Cartesian(0, 0), "layer7"));

    this.scenariosLoaded.add(new ScenarioBackground(0, 0, -15, -3, elementSkins, new Cartesian(-1920, -1080), "layer8"));
    this.scenariosLoaded.add(new ScenarioBackground(1920, 0, -15, -3, elementSkins, new Cartesian(0, 0), "layer8"));
  }
}
