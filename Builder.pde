public PathicleBuilder builder(float radius, float n, float speed) {
  PathicleBuilder step = new PathicleBuilder();
  step.field.radius = radius;
  step.field.pixelW = width;
  step.field.pixelH = height;
  step.field.w = ((float)width) / n;
  step.field.h = ((float)height) / n;
  step.field.speed = speed;
  step.sim.weight = new Neutral();
  return step;
}

public class PathicleBuilder {
  PhaseField field = new PhaseField();
  Simulator sim = new Simulator();
  
  public PathicleBuilder() {
    sim.field = field;
  }
  
  public PathicleBuilder useColor(color a) {
    return useColor(a, a);
  }
  
  public PathicleBuilder useColor(color a, color b) {
    sim.lowColor = a;
    sim.highColor = b;
    return this;
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
  
  public PathicleBuilder noisey(float scale) {
    return noisey(scale, scale, scale, 1);
  }
  
  public PathicleBuilder noisey(float scale, float weight) {
    return noisey(scale, scale, scale, weight);
  }
  
  public PathicleBuilder noisey(float scale, float time, float weight) {
    return noisey(scale, scale, time);
  }
  
  public PathicleBuilder noisey(float xscale, float yscale, float time, float weight) {
    PhaseRule nr = new NoiseRule(field, xscale, yscale, time);
    nr.weight = weight;
    sim.ruleChain.add(nr);
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
    
