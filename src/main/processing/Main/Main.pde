//<>// //<>// //<>//
GameStateEnum state = GameStateEnum.MAIN_MENU;
Game game;
MainMenu mainMenu;
DeadScreen deadScreen;
boolean restart = false;
Utils utils =  new Utils();
float lastScore;
float bestScore;
ArrayList<ElementSkins> elementSkins;
void setup() {
  fullScreen();
  background(41, 44, 46);
  this.elementSkins = utils.loadJsonSkins("skins/skins.json");
  game = new Game(this, this.elementSkins);
  mainMenu =  new MainMenu(this, this.elementSkins);
  deadScreen =  new DeadScreen(this, this.elementSkins);
  image(loadImage(Constants.SCREENS_PATH + "/loading/loading.png"), 0, 0);
}

void draw() {


  switch(state) {
  case MAIN_MENU:
    mainMenu.renderScreen();
    setState(mainMenu);
    break;
  case GAME_SCREEN:
    if (restart) {
      game.restart();
      restart = false;
    }
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
