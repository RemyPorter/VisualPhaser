interface WeightRule {
  public float weight(float t);
}

class Neutral implements WeightRule {
  public float weight(float t) {
    return 1;
  }
}

class Sinus implements WeightRule {
  float frequency;
  public Sinus(float f) {
    frequency = f;
  }
  
  public float weight(float t) {
    return sin(t*frequency);
  }
}
