public class CountDown extends Element {

  public int countDownState = 0;
  private int lastCountDown = millis();
  private ArrayList<SoundFile> sounds = new ArrayList();

  CountDown(float positionX, float positionY, ArrayList<ElementSkins> elementSkins) {
    super( positionX, positionY, elementSkins);
  }

  CountDown(Main main, float positionX, float positionY, float velocityX, float velocityY, ArrayList<ElementSkins> elementSkins, String skinName) {
    super(positionX, positionY, velocityX, velocityY, elementSkins, skinName);
    this.sounds.add( new SoundFile(main, Constants.SOUNDS_PATH + "/effects/countDown/3.wav"));
    this.sounds.add( new SoundFile(main, Constants.SOUNDS_PATH + "/effects/countDown/2.wav"));
    this.sounds.add( new SoundFile(main, Constants.SOUNDS_PATH + "/effects/countDown/1.wav"));
    this.sounds.add( new SoundFile(main, Constants.SOUNDS_PATH + "/effects/countDown/go.wav"));
  }

  @Override
    public String getObjectName() {
    return "countdown";
  }

  @Override
    public float getStep() {
    return 0.0;
  }

  @Override
    public int getWidth() {
    return 1920;
  }

  @Override
    public int getHeight() {
    return 1080;
  }

  public  boolean countDown() {
    if (countDownState == 4 && isChangeCountDownStatus()) {
      this.countDownState = 5;
      return false;
    } else if (countDownState > 4) {
      return false;
    }
    boolean result = true;
    if (isChangeCountDownStatus()) {
      print(countDownState, "\n");
      this.countDownState = this.countDownState+1;
      this.setActiveStage(countDownState-1);
      this.sounds.get(countDownState-1).play();
    }
    this.renderElement();
    return result;
  }

  private boolean isChangeCountDownStatus() {
    int time = millis();
    boolean isRender = ((time-lastCountDown) >= 1000);
    if (isRender) {
      lastCountDown = time;
    }
    return isRender;
  }

  public void resetCountDown() {
    this.countDownState = 0;
  }
}
