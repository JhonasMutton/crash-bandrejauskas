 //<>// //<>//
GameStateEnum state = GameStateEnum.MAIN_MENU;
Game game;
MainMenu mainMenu;
DeadScreen deadScreen;

void setup() {
 // fullScreen();
  size(1920, 1080); // Tamanho da Tela
   print("load image2 \n");
  game = new Game();
  background(255, 00, 00);
  mainMenu =  new MainMenu(new SoundFile(this, "Whitefish_Salad.mp3"));
  deadScreen =  new DeadScreen();
}

void draw() {
  

  switch(state) {
  case MAIN_MENU:
    mainMenu.renderScreen();
    setState(mainMenu);
    break;
  case GAME_SCREEN:
    game.renderScreen();
    setState(game);
    break;
  case DEAD_SCREEN:
    deadScreen.renderScreen();
    setState(deadScreen);
  default:
    break;
  }
}

public void setState(Screen screen) {
  state = screen.getNextState();
}

  
//import processing.sound.*;
//SoundFile file;

//void setup() {
//  size(640, 360);
//  background(255);
    
//  // Load a soundfile from the /data folder of the sketch and play it back
//  file = new SoundFile(this,"Whitefish_Salad.mp3");
//  file.play();
  
//}      

//void draw() {
  
//}
