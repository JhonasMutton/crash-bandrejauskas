class Cartesian {
  private float x, y;

  Cartesian(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public Cartesian setX(float x) {
    this.x = x;
    return this;
  }

  public Cartesian setY(float y) {
    this.y = y;
    return this;
  }
}
