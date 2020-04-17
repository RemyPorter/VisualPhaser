abstract class PhaseRule {
  protected PhaseField field;
  public PhaseRule(PhaseField field) {
    this.field = field;
  }
  public float weight = 1; 
  public float getOffsetForPoint(float x, float y) {
    return calcOffsetForPoint(x, y) * weight;
  }
  protected abstract float calcOffsetForPoint(float x, float y);
}

interface RuleStep {
  float f(float x, float y, PhaseField field);
}

class RuleWrapper extends PhaseRule {
  RuleStep action;
  public RuleWrapper(PhaseField field, RuleStep action) {
    super(field);
    this.action = action;
  }
  
  protected float calcOffsetForPoint(float x, float y) {
    return action.f(x, y, field);
  }
}

class WidthRule extends PhaseRule {
  float freq;
  public WidthRule(PhaseField field, float freq) {
    super(field);
    this.freq = freq;
  }
  
  protected float calcOffsetForPoint(float x, float y) {
    return freq*x/field.w;
  }
}

class QuarteroidRule extends PhaseRule {
  public QuarteroidRule(PhaseField field) {
    super(field);
  }
  
  protected float calcOffsetForPoint(float x, float y) {
    return x/field.pixelW*y*1.89;
  }
}
