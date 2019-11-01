public class MainMenu extends Screen {

  Button gameButton;

  MainMenu() {

    print("MainMenu");
    RGB selectedButton = new RGB(255, 255, 255);
    RGB unselectedButton = new RGB(00, 00, 00);
    print("MainMenu1");
    gameButton = new Button("Play", 200, 40, new Cartesian(860,500), selectedButton, unselectedButton);
    print("MainMenu2");
    super.nextGameState = GameStateEnum.MAIN_MENU;
    print("MainMenu3");
  }


  @Override
    public void renderScreen() {
    gameButton.renderButton();
  }
}
