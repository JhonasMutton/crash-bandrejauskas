public class DeadScreen extends Screen {

  private PImage background;
  private PImage background2;

  private SoundFile effect;
  private Main main;
  private boolean active = true;
  Button restartButton;
  Button backMenu;


  DeadScreen(Main main, ArrayList<ElementSkins> elementSkins) {
    super(elementSkins);
    this.main = main;
    this.background = loadImage(Constants.DEAD_SCREEN_PATH + "deadScreen.png");
    this.background2 = loadImage(Constants.DEAD_SCREEN_PATH + "deadScreen2.png");

    this.effect = new SoundFile(this.main, Constants.SOUNDS_PATH + "/effects/YouDied.mp3");
    restartButton = new Button(main, 300, 60, new Cartesian(815, 750), Constants.BUTTONS_PATH + "restart-1.png", Constants.BUTTONS_PATH + "restart-1.png", Constants.BUTTONS_PATH + "restart-2.png",Constants.SOUNDS_PATH + "/effects/buttons/click.mp3",Constants.SOUNDS_PATH + "effects/buttons/over.mp3");
    backMenu = new Button(main, 725, 60, new Cartesian(597, 850), Constants.BUTTONS_PATH + "backMenu-1.png", Constants.BUTTONS_PATH + "backMenu-1.png", Constants.BUTTONS_PATH + "backMenu-2.png",Constants.SOUNDS_PATH + "/effects/buttons/click.mp3",Constants.SOUNDS_PATH + "effects/buttons/over.mp3");
  }

  @Override
    public void renderScreen() {
    super.nextGameState = GameStateEnum.DEAD_SCREEN;
    if (active) {
      delay(9000);
      this.effect.play();
      active = false;
    }
    renderBg();
    //image(this.background, 0, 0);
    restartButton.renderButton();
    if (restartButton.isPressed()) {
      super.nextGameState = GameStateEnum.GAME_SCREEN;
      main.restart = true;
      active = true;
      effect.stop();
    }

    backMenu.renderButton();
    if (backMenu.isPressed()) {
      super.nextGameState = GameStateEnum.MAIN_MENU;
      main.restart =true;
      active = true;
      effect.stop();
    }
  }


  public void renderBg() {
    tint(255, 10);
    image(this.background2, 0, 0);
    noTint();
    image(this.background, 0, 0);
  }
}
