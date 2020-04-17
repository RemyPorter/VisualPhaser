public PathicleBuilder builder(float radius, float n, float speed) {
  PathicleBuilder step = new PathicleBuilder();
  step.field.radius = radius;
  step.field.pixelW = width;
  step.field.pixelH = height;
  step.field.w = ((float)width) / n;
  step.field.h = ((float)height) / n;
  step.field.speed = speed;

  return step;
}

public class PathicleBuilder {
  PhaseField field = new PhaseField();
  Simulator sim = new Simulator();
  
  public PathicleBuilder() {
    sim.field = field;
  }
  
  public PathicleBuilder widthRule(float freq) {
    return widthRule(freq, 1);
  }
  
  public PathicleBuilder widthRule(float freq, float weight) {
    PhaseRule w = new WidthRule(field, freq);
    w.weight = weight;
    sim.ruleChain.add(w);
    return this;
  }
  
  public PathicleBuilder rule(RuleStep r) {
    return rule(r, 1);
  }
  
  public PathicleBuilder rule(RuleStep r, float weight) {
    PhaseRule rr = new RuleWrapper(field, r);
    rr.weight = weight;
    sim.ruleChain.add(rr);
    return this;
  }
  
  public PathicleBuilder weight(WeightRule r) {
    sim.weight = r;
    return this;
  }
  
  public PathicleBuilder sinWeight(float frequency) {
    return weight(new Sinus(frequency));
  }
  
  public Simulator build() {
    return sim;
  }
}
    
