public class Utils {

  public ArrayList<ElementSkins> loadJsonSkins(String path) {
    JSONObject json = loadJSONObject(Constants.RESOURCES_PATH.concat(path));
    JSONArray listSkins = json.getJSONArray(Constants.LIST_SKINS);
    ArrayList<ElementSkins> elementSkins = new ArrayList();

    for (int i = 0; i < listSkins.size(); i++) {

      JSONObject elementSkinJSON = listSkins.getJSONObject(i);
      String objectType = elementSkinJSON.getString(Constants.OBJECT_TYPE);
      JSONArray skins = elementSkinJSON.getJSONArray(Constants.SKINS);

      ArrayList<Skin> skinArray = new ArrayList();

      for (int j = 0; j< skins.size(); j++) {

        JSONObject skin = skins.getJSONObject(j);
        String skinName = skin.getString(Constants.SKIN_NAME);

        JSONArray stageImages = skin.getJSONArray(Constants.STAGE_IMAGES);

        ArrayList<String> stageImagesArray =  new ArrayList();
        for (int k = 0; k< stageImages.size(); k++) {
          String stateImage = stageImages.getString(k);
          stageImagesArray.add(stateImage);
        }

        Skin skinFound = new Skin(skinName, stageImagesArray);
        skinArray.add(skinFound);
      }

      ElementSkins elementSkin = new ElementSkins(objectType, skinArray);
      elementSkins.add(elementSkin);
    }

    return elementSkins;
  }
}
