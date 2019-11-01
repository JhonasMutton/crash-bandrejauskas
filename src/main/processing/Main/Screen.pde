abstract class Screen {

  GameStateEnum nextGameState;

  public abstract void renderScreen();

  public GameStateEnum getNextState() {
    return nextGameState;
  }
}
