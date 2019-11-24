
public class Game extends Screen {

  private boolean firstTime = true;
  private ArrayList<ScenarioBackground> scenariosLoaded = new ArrayList(); 
  private ArrayList<Box> boxes = new ArrayList();
  private Personage personage;
  private boolean stopped = true;
  private boolean countDownActive = true;
  private CountDown countDown;
  private int PERSONAGE_Y = 500;
  private SoundFile music;
  private ArrayList<SoundFile> deathSound = new ArrayList();

  private float meters = 0;
  private float velocityGeneral = 1.0;
  private Text meterShowed;

  Main main;
  boolean activated = false;
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
        this.loadSounds();
        this.loadTexts();
      } else if (activated) {
        this.restart(); 
        activated = false;
      }
      moveAndRenderScenario();
      moveAndRenderBoxes();
      personage.moveAndRenderPersonage(stopped);

      meterShowed.setText("Score:" + meters);
      meterShowed.renderText();
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

      if (!stopped) {
        countMeters();
      }
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
    this.countDown = new CountDown(main, 0, 0, 0, 0, elementSkins, null);
  }

  private void verifyCollision() {
    for (Box box : this.boxes) {
      if (Colision.isColliding(this.personage, box)) {
        music.stop();
        playDeathSound();
        super.nextGameState = GameStateEnum.DEAD_SCREEN;
        main.lastScore = meters;
        if (meters > main.bestScore) {
          main.bestScore = meters;
        }
        //restart();
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

  private void loadSounds() {
    this.music = new SoundFile(this.main, Constants.SOUNDS_PATH + "/music/hogwild.mp3");
    this.deathSound.add( new SoundFile(this.main, Constants.SOUNDS_PATH + "/effects/buttons/death1.wav"));
    this.deathSound.add( new SoundFile(this.main, Constants.SOUNDS_PATH + "/effects/buttons/death2.mp3"));
    this.deathSound.add( new SoundFile(this.main, Constants.SOUNDS_PATH + "/effects/buttons/death3.wav"));
    this.deathSound.add( new SoundFile(this.main, Constants.SOUNDS_PATH + "/effects/buttons/death4.wav"));
    this.deathSound.add( new SoundFile(this.main, Constants.SOUNDS_PATH + "/effects/buttons/death5.wav"));
  }

  private void capturePressedKeys() {
    if (keyPressed) {
      if (key == 'p' && !this.countDownActive) {
        this.stopped = true;
        this.music.pause();
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
    meters = 0;
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

  private void loadTexts() {
    this.meterShowed = new Text("0", new Cartesian(50, 90), 100, FontEnum.DEFAULT, new RGB(255, 255, 255), new RGB(255, 255, 255), "left");
  }

  private void playDeathSound() {
    float random = random(10);
    print(random);
    if (random >=0 && random <2) {
      this.deathSound.get(0).play();
    } else if (random >1 && random <4) {
      this.deathSound.get(1).play();
    } else if (random >3 && random <6) {
      this.deathSound.get(2).play();
    } else if (random >5 && random <8) {
      this.deathSound.get(3).play();
    } else if (random >7 && random <10) {
      this.deathSound.get(4).play();
    }
  }

  private void countMeters() {
    this.meters = meters + 1 * velocityGeneral;
  }
}
