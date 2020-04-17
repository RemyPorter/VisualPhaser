class Simulator {
  public ArrayList<PhaseRule> ruleChain = new ArrayList<PhaseRule>();
  public WeightRule weight;
  public PhaseField field;
  
  float phase(float x, float y) {
    float res = 0;
    for (PhaseRule r : ruleChain) {
      res += r.getOffsetForPoint(x, y);
    }
    return res;
  }
  
  public void draw(float t) {
    field.phaseWeight = weight.weight(t);
    for(float x = -field.radius; x < field.pixelW + field.radius; x += field.pixelW / field.w) {
      for (float y = -field.radius; y < field.pixelH + field.radius; y += field.pixelH / field.h) {
        float ph = phase(x, y);
        noStroke();
        if (sin(ph*2*PI) <= 0) {
          fill(#FF00FF);
        } else {
          fill(#00FFFF);
        }
        ellipse(x+sin(field.speed*t+ph*field.phaseWeight)*field.radius,
          y+cos(field.speed*t+ph*field.phaseWeight)*field.radius, 3, 3);
      }
    }
  }
}
