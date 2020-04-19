public float smoothstep(float edge0, float edge1, float x) {
  float t = constrain((x - edge0)/(edge1 - edge0), 0.0, 1.0);
  return t * t * (3.0 - 2.0 * t);
}

public float t() {
  return frameCount / 30.0;
}
