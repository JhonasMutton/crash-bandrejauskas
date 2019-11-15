import processing.sound.*;

public class MainMenu extends Screen {

  Button startButton;
  PImage logo;
  SoundFile music;
  boolean firstTime;


  MainMenu(SoundFile music) {
    this.music = music;

    this.logo = loadImage(Constants.MENU_PATH + "initial-logo.png");
    print("MainMenu");

    print("MainMenu1");
    startButton = new Button( 300, 100, new Cartesian(810, 500), Constants.BUTTONS_PATH + "start-0.png", Constants.BUTTONS_PATH + "start-1.png", Constants.BUTTONS_PATH + "start-2.png");
    print("MainMenu2");
    super.nextGameState = GameStateEnum.MAIN_MENU;
    print("MainMenu3");
    firstTime = true;
    //
  }


  @Override
    public void renderScreen() {
    if (isRender()) {
      super.nextGameState = GameStateEnum.MAIN_MENU;
      if (firstTime) {
        this.music.loop();
        firstTime=false;
      }

      image(this.logo, 0, 0);  

      if (mousePressed && (mouseButton == LEFT)) {//TODO-transformar numa função de verificação
        if (startButton.isOnTop(mouseX, mouseY)) {
          startButton.state = MouseState.SELECTED;
          goToGameScreen();
        }
      } else if (startButton.isOnTop(mouseX, mouseY)) {
        startButton.state = MouseState.OVER;
      } else {
        startButton.state = MouseState.UNSELECTED;
      }

      startButton.renderButton();
    }
  }

  public void goToGameScreen() {
    super.nextGameState = GameStateEnum.GAME_SCREEN;
    this.music.stop();
    firstTime=true;
  }
}



//void setup() {
//  size(640, 360);
//  background(255);

//  // Load a soundfile from the /data folder of the sketch and play it back
//  file = new SoundFile(this, "Whitefish_Salad.mp3");
//  file.play();
