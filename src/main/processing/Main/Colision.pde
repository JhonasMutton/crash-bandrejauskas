public static class Colision {

  public static boolean isColliding(Element el1, Element el2) {
    Cartesian center1 = el1.getCenter();
    Cartesian center2 = el2.getCenter();

    float dx = abs(center1.getX() - center2.getX()) - (el1.getRadiusWidht()-50+el2.getRadiusWidht()-20);
    float dy = abs(center1.getY() - center2.getY()) - (el1.getRadiusHeight()+el2.getRadiusHeight());
   // print(center1.getY(), " ",center2.getY(), " ", el1.getRadiusHeight(), " ", el2.getRadiusHeight(), "\n" );
    
    ;
    if (dx < 0 && el1.getBottomLoc() > el2.getTopLoc()) {
      return true ;
    } else {
      return false;
    }
  }
}
