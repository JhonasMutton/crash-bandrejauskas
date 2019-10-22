class ElementSkins {

  private String objectType;
  private ArrayList<Skin> skins;

  ElementSkins(String objectType, ArrayList<Skin> skins) {
    this.objectType = objectType;
    this.skins= skins;
  }

  public String getObjectType() {
    return this.objectType;
  }

  public ArrayList<Skin> getSkins() {
    return this.skins;
  }
}
