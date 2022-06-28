int strokeDistance = 20;
int strokeSegments = 8;
int strokeWidth = 20;

void setup() {
  size(500, 500);
  
  background(255);
  stroke(100);
  fill(100);
  
  frameRate(1);
  //noLoop();
  smooth(4);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  
  drawStroke();
}

void drawStroke(){
  pushMatrix();
  
  float initialRotation = random(0, TWO_PI);
  
  rotate(initialRotation); // TODO : base on noise value
  float halfStrokeLength = (strokeDistance * (strokeSegments - 1))/ 2;
  translate(halfStrokeLength * -1, 0); // Offset half the length of the segment so the middle matches the rotation axis
  
  PVector spineStart = new PVector(0, 0); //<>//
  float curveTheta = radians(random(-15, 15)); // TODO : get this from noise
  float cumulativeRotation = curveTheta;
  
  beginShape(QUAD_STRIP);
  vertex(0, (strokeWidth/2*-1));
  vertex(0, strokeWidth/2);
  
  for(int i = 0; i < strokeSegments; i++) {
    PVector nextSpine = new PVector(strokeDistance, 0);
    PVector end = PVector.add(spineStart, nextSpine);
    
    end.rotate(curveTheta);
    nextSpine.rotate(cumulativeRotation);
    
    generateSegmentWithVectors(end, nextSpine, i*20);
    //drawDebugLine(spineStart, end);
    
    spineStart = end;
    cumulativeRotation += curveTheta;
  }
  endShape();
  
  popMatrix();
}

void generateSegmentWithVectors(PVector v, PVector nextSpine, int fillColor) {
  fill(fillColor);
  
  PVector vLeft = GetPerpendicularLeft(nextSpine);
  PVector vRight = GetPerpendicularRight(nextSpine);

  vLeft.setMag(strokeWidth/2);
  vRight.setMag(strokeWidth/2);
  
  PVector newLeft = PVector.add(v, vLeft);
  PVector newRight = PVector.add(v, vRight);
  
  vertex(newLeft.x, newLeft.y);
  vertex(newRight.x, newRight.y);
}

PVector GetPerpendicularLeft(PVector v1) {
  return v1.copy().rotate(radians(-90));
}

PVector GetPerpendicularRight(PVector v1) {
  return v1.copy().rotate(radians(90));
}

void drawDebugLine(PVector start, PVector end) {
  stroke(255,0,0);
  
  line(start.x, start.y, end.x, end.y);
  
  stroke(100);
}
