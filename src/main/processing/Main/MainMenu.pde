import processing.sound.*;

public class MainMenu extends Screen {

  Button startButton;
  PImage logo;
  SoundFile music;
  boolean firstTime;
  PImage loading = loadImage(Constants.SCREENS_PATH + "/loading/loading.png");
  Main main;
  MainMenu(Main main, ArrayList<ElementSkins> elementSkins) {
    super(elementSkins);
    this.main = main;
    this.logo = loadImage(Constants.MENU_PATH + "initial-logo.png");
    startButton = new Button(main, 300, 100, new Cartesian(810, 500), Constants.BUTTONS_PATH + "start-0.png", Constants.BUTTONS_PATH + "start-1.png", Constants.BUTTONS_PATH + "start-1.png",Constants.SOUNDS_PATH + "/effects/buttons/click.mp3",Constants.SOUNDS_PATH + "effects/buttons/over.mp3" );
    super.nextGameState = GameStateEnum.MAIN_MENU;
    // image(loading, 0, 0);
    firstTime = true;
  }


  @Override
    public void renderScreen() {
    if (firstTime) {
      this.music = new SoundFile(this.main, Constants.SOUNDS_PATH + "/music/theme.mp3");
    }
    if (isRender()) {
      super.nextGameState = GameStateEnum.MAIN_MENU;
      if (firstTime) {
        this.music.loop();
        firstTime=false;
      }

      image(this.logo, 0, 0);  


      startButton.renderButton();
      if (startButton.isPressed()) {
        goToGameScreen();
        return;
      }
    }
  }

  public void goToGameScreen() {
    super.nextGameState = GameStateEnum.GAME_SCREEN;
    this.music.stop();
    firstTime=true;
    image(this.loading, 0, 0);
  }
}



//void setup() {
//  size(640, 360);
//  background(255);

//  // Load a soundfile from the /data folder of the sketch and play it back
//  file = new SoundFile(this, "Whitefish_Salad.mp3");
//  file.play();
