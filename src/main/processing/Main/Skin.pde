class Skin {

  private final String skinName;
  private final ArrayList<String> stageImages;

  Skin(String skinName, ArrayList images) {
    this.stageImages = images;
    this.skinName = skinName;
  }

  public String getImage(int index) {
    return this.stageImages.get(index);
  }

  public ArrayList<String> getImages() {
    return this.stageImages;
  }

  public String getSkinName() {
    return this.skinName;
  }
}
