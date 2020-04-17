class PhaseField {
  public float speed;
  public float radius;
  public float phaseWeight = 1;
  public float w;
  public float h;
  public float pixelW;
  public float pixelH;
  
  public float dc(float x, float y) {
    return PVector.dist(new PVector(x, y), new PVector(pixelW/2, pixelH/2));
  }
}
