public class Game extends Screen {
  @Override
    public void renderScreen() { 
      super.nextGameState = GameStateEnum.MAIN_MENU;
      background(200, 00, 200);
     
  }
}
