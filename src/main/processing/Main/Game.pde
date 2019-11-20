
public class Game extends Screen {

  private boolean firstTime = true;
  private ScenarioBackground scenario;
  private ScenarioBackground scenario2;
  private ArrayList<ScenarioBackground> scenariosLoaded = new ArrayList();
  private Personage personage;
  private boolean stopped = true;
  private boolean countDownActive = true;
  private CountDown countDown;
  int value = 0;

  @Override
    public void renderScreen() {
    if (isRender()) {

      if (keyPressed) {
        if (key == 'p' && !this.countDownActive) {
          this.stopped = true;
        }

        if (key == 'o' && !this.countDownActive) {
          if (this.stopped) {         
            this.countDown.countDownState = 0;
            this.countDownActive = true;
          } else {
            this.stopped = false;
          }
        }

        if (key == 32 && !this.countDownActive && !this.stopped && !personage.isJumping) {
          personage.isJumping = true;
          personage.setPersonageStage(PersonageAnimationStage.JUMPING);
        }
      }
      
      super.nextGameState = GameStateEnum.GAME_SCREEN;
      background(200, 00, 200);
      if (firstTime) {
        Utils utils =  new Utils();
        ArrayList<ElementSkins> elementSkins =  utils.loadJsonSkins("skins/skins.json");
        this.loadBackground(elementSkins);
        this.loadPersonage(elementSkins);
        this.loadCountDown(elementSkins);
        this.firstTime = false;
      }
      moveAndRenderScenario();
      personage.moveAndRenderPersonage(stopped);
      if (this.countDownActive) {
        boolean result = countDown.countDown();
        if (this.countDownActive && !result) {
          this.stopped = false;
        }
        this.countDownActive = result;
      }

      //this.stopped = this.countDownActive;//todo mudar para suportar o pause
    }
  }

  private void moveAndRenderScenario() {
    for (ScenarioBackground scenario : this.scenariosLoaded) {
      scenario.moveXAndRender(this.stopped);
    }
  }

  private void loadBackground(ArrayList<ElementSkins> elementSkins) {
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

  private void loadPersonage(ArrayList<ElementSkins> elementSkins) {

    //for (ElementSkins e : elementSkins) {
    //        print("aqui1:" + e.getObjectType() + "\n");
    //  if (e.getObjectType().equals("personage")) {
    //    print("aqui1:");
    //    for (Skin s : e.getSkins()) {
    //       print("aqui2:", e.getObjectType(), "\n");
    //      if (s.getSkinName().equals("default")) {  
    //        for (String img : s.getImages()) {
    //          print(img);
    //        }
    //      }
    //    }
    //  }
    //}
    this.personage = new Personage(100, 600, 0, -15, elementSkins, null);
    this.personage.setActiveStage(0);
  }

  private void loadCountDown(ArrayList<ElementSkins> elementSkins) {
    this.countDown = new CountDown(0, 0, 0, 0, elementSkins, null);
  }
}
