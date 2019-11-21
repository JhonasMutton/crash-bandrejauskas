public static class Colision {

  public static boolean isColliding(Element el1, Element el2) {
    Cartesian center1 = el1.getCenter();
    Cartesian center2 = el2.getCenter();

    float dx = abs(center1.getX() - center2.getX()) - (el1.getRadiusWidht()+el2.getRadiusWidht());
    float dy = abs(center1.getY() - center2.getY()) - (el1.getRadiusHeight()+el2.getRadiusHeight());

    if (dx < 0 || dy < 0) {
      return true ;
    } else {
      return false;
    }
  }
}
