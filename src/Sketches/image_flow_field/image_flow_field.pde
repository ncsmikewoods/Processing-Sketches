ImageConfig imageConfig;
int border = 45;

StrokeRenderer renderer;

int timer;

void settings() {
  ImageFactory factory = new ImageFactory();
  imageConfig = factory.GetSunset();
  
  size(imageConfig.GetWidth() + (border*2), imageConfig.GetHeight() + (border*2));
}

void setup() {
  initialize();
}

void draw() {
  renderer.DrawPoints(imageConfig.GetWidth(), imageConfig.GetHeight(), border);
  
  if (millis() - timer >= (imageConfig.GetResolutionStepInSeconds() * 1000)) {
    renderer.RefineSteps();
    timer = millis();
  }
}

void mousePressed() {
  initialize(); 
}

void initialize() {
  loop();
  background(50);
  timer = millis();
  renderer = new StrokeRenderer(imageConfig);
}

void createFlowField() {
  // create a grid

  // at each point create a noise value -- noise(xoff, yoff)*TWO_PI
  // create a vector new PVector(0,0).fromAngle(noiseValue)
}
