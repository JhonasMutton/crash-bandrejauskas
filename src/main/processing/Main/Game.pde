
public class Game extends Screen {

  private boolean firstTime = true;
  private ArrayList<ScenarioBackground> scenariosLoaded = new ArrayList(); 
  private ArrayList<Box> boxes = new ArrayList();
  private Personage personage;
  private boolean stopped = true;
  private boolean countDownActive = true;
  private CountDown countDown;
  private int PERSONAGE_Y = 500;
  SoundFile music;
  int value = 0;
  Main main;
  Game(Main main, ArrayList<ElementSkins> elementSkins) {
    super(elementSkins);
    this.main = main;
  }

  @Override
    public void renderScreen() {
    super.nextGameState = GameStateEnum.GAME_SCREEN;

    if (isRender()) {
      this.capturePressedKeys();

      if (firstTime) {
        this.loadBackground();
        this.loadPersonage();
        this.loadCountDown();
        this.loadBoxes();
        this.firstTime = false;
        this.music = new SoundFile(this.main, Constants.SOUNDS_PATH + "/music/hogwild.mp3");
      }
      moveAndRenderScenario();
      moveAndRenderBoxes();
      personage.moveAndRenderPersonage(stopped);
      if (this.countDownActive) {
        boolean result = countDown.countDown();
        if (this.countDownActive && !result) {
          this.stopped = false;
          this.music.loop();
          countDown.resetCountDown();
        }
        this.countDownActive = result;
      }

      verifyCollision();
      //this.stopped = this.countDownActive;//todo mudar para suportar o pause
    }
  }

  private void moveAndRenderScenario() {
    for (ScenarioBackground scenario : this.scenariosLoaded) {
      scenario.moveXAndRender(this.stopped);
    }
  }

  private void loadBackground() {
    //for (ScenarioBackground box : this.scenariosLoaded) {
    //  this.scenariosLoaded.remove(box);
    //}
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

  private void loadPersonage() {

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
    this.personage = new Personage(100, PERSONAGE_Y, 0, -20, elementSkins, null);
    this.personage.setActiveStage(0);
  }

  private void loadCountDown() {
    this.countDown = new CountDown(0, 0, 0, 0, elementSkins, null);
  }

  private void verifyCollision() {
    for (Box box : this.boxes) {
      if (Colision.isColliding(this.personage, box)) {
        restart();
        //this.firstTime=true;
        return;
      }
    }
  }
  private void moveAndRenderBoxes() {
    for (Box box : this.boxes) {
      box.moveXAndRender(this.stopped);
    }
  }

  private void loadBoxes() {
    for (Box box : this.boxes) {
      this.boxes.remove(box);
    }
    this.boxes.add(new Box(1921, 650, -15, -3, elementSkins, new Cartesian(-173, -100), "default"));
  }

  private void capturePressedKeys() {
    if (keyPressed) {
      if (key == 'p' && !this.countDownActive) {
        this.stopped = true;
      }

      if (key == 'o' && !this.countDownActive) {
        goRun();
      }

      if (key == 32 && !this.countDownActive && !this.stopped && !personage.isJumping) {
        personage.isJumping = true;
        personage.setPersonageStage(PersonageAnimationStage.JUMPING);
      }
    }
  }

  public void restart() {
    resetPersonage();
    goRun();
    resetBoxes();
    resetScenario();
    this.music.stop();
    countDownActive = true;
    countDown.resetCountDown();
    stopped = true;
  }

  public void goRun() {
    if (this.stopped) {         
      this.countDown.countDownState = 0;
      this.countDownActive = true;
    } else {
      this.stopped = false;
    }
  }

  public void resetBoxes() {
    for (Box box : this.boxes) {
      box.backToInitialPosition();
    }
  }

  public void resetScenario() {
    for (ScenarioBackground scenario : this.scenariosLoaded) {
      scenario.backToInitialPosition();
    }
  }

  private void resetPersonage() {
    personage.isJumping = false;
    personage.setPersonageStage(PersonageAnimationStage.RUNNING);
    personage.setActiveStage(0);
    personage.setLocY(PERSONAGE_Y);
  }
}
