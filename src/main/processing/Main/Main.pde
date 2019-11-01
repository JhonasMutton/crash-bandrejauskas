 //<>//
GameStateEnum state = GameStateEnum.MAIN_MENU;
Game game;
MainMenu mainMenu;
DeadScreen deadScreen;
void setup() {
  size(1920, 1080); // Tamanho da Tela
  background(0);// Cor do BG
  game = new Game();
  mainMenu =  new MainMenu();
  deadScreen =  new DeadScreen();
}

void draw() {
  background(0);
  
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
