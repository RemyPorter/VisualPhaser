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
        return x - field.dc(x,y);
      }
    }, 0.4)
    .sinWeight(0.25)
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
  //saveFrame("shockwave/####.tiff");
}

  
