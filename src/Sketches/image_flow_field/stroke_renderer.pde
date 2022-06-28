class StrokeRenderer {
  PImage _img;
  
  int _currentIteration;
  int _currentDotCount;
  int _currentStrokeWeight;
  
  int _dotCountStart;
  int _dotCountEnd;
  
  int _strokeWeightStart;
  int _strokeWeightEnd;
  
  int _refinementIterations;
  
  StrokeRenderer(ImageConfig config) {
    _img = loadImage("/images/" + config.GetName());
      
    _currentIteration = 0;
    _currentDotCount = config.GetDotCountStart();
    _currentStrokeWeight = config.GetStrokeWeightStart();
    
    _dotCountStart = config.GetDotCountStart();
    _dotCountEnd = config.GetDotCountEnd();
    
    _strokeWeightStart = config.GetStrokeWeightStart();
    _strokeWeightEnd = config.GetStrokeWeightEnd();
    
    _refinementIterations = config.GetRefinementIterations();
  }
  
  void DrawPoints(int width, int height, int border) {
    if (_currentIteration >= _refinementIterations) {
      noLoop();
      return;
    }
    
    for (int i = 0; i< _currentDotCount; i++) {
      int x = int(random(0, width));
      int y = int(random(0, height));
  
      DrawPoint(x, y, border);
    }
  }
  
  void DrawPoint(int x, int y, int border) {
    color c = _img.get(x, y);
    stroke(c);
    strokeWeight(_currentStrokeWeight);
  
    point(x + border, y + border);
  }
  
  void RefineSteps() {
    if (_currentIteration >= _refinementIterations) {
      noLoop();
      return;
    }
    
    _currentIteration++;
  
    float refinementFactor = _currentIteration/(float)_refinementIterations;
    _currentDotCount = int(lerp(_dotCountStart, _dotCountEnd, refinementFactor));
    _currentStrokeWeight = int(lerp(_strokeWeightStart, _strokeWeightEnd, refinementFactor));
  }
}
