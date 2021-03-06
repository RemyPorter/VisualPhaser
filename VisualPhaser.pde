import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

Simulator sim;
PostFX fx;
void setup() {
  size(320, 240, P3D);
  //fullScreen(P3D);
  fx = new PostFX(this);
  sim = builder(5, 3, 1)
    .rule(new RuleStep() {
      public float f(float x, float y, PhaseField field) {
        return (0.5 - smoothstep(sin(x / field.pixelW*2*PI), -1, 1)) - sin(y/field.pixelH*2*PI);
      }
    }, 1)
    //.sinWeight(0.25)
    .build();
}

void draw() {
  clear();
  noStroke();
  float t = frameCount / 30.0;
  //if (t >= 4 * PI) return;
  sim.draw(t);
    fx.render()
    .bloom(0.7, 20, 50)
    .compose();
  //saveFrame("twinsies/####.tiff");
}

  
