class ImageConfig {
  String _name;
  int _width;
  int _height;
  int _resolutionStepInSeconds = 3;
  int _dotCountStart = 3;
  int _dotCountEnd = 20;
  int _strokeWeightStart = 40;
  int _strokeWeightEnd = 5;
  int _refinementIterations = 5;
  
  ImageConfig(String name, int imgWidth, int imgHeight) {
    _name = name;
    _width = imgWidth;
    _height = imgHeight;  
  }
  
  String GetName() {
    return _name;
  }
  
  void SetName(String name) {
    _name = name;
  }
  
  int GetWidth() {
    return _width;
  }
  
  int GetHeight() {
    return _height;
  }
  
  int GetResolutionStepInSeconds() {
    return _resolutionStepInSeconds;
  }
  
  int GetDotCountStart(){
    return _dotCountStart;
  }
  
  int GetDotCountEnd(){
    return _dotCountEnd;
  }
  
  int GetStrokeWeightStart(){
    return _strokeWeightStart;
  }
  
  int GetStrokeWeightEnd(){
    return _strokeWeightEnd;
  }
  
  int GetRefinementIterations(){
    return _refinementIterations;
  }
}
