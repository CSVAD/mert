float rW = 80;
float rH = 70;

boolean isInner = true;

PShape top, left, right;

void setup() {
  size(800, 800);
  background(0);

  constructShapes();

  float offset = 0;
  for (int j=0; j<= height/rH; j++) {
    if(j%2==0)  offset = rW/2;
    else        offset = 0;

    for (int i=0; i<= width/rW; i++) {
      drawSeed(i*rW+offset, j*rH, PI/2);
    }
  }
}

void draw() {}

void constructShapes() {
  top = createShape();
  left = createShape();
  right = createShape();
  
  // topleft, top, topright, bottomright, bottom, bottomleft
  float[] px = {-rW/2, 0, rW/2, rW/2, 0, -rW/2};
  float[] py = {rH/3, rH/1.5, rH/3, -rH/3, -rH/1.5, -rH/3};
  
  //top
  top.beginShape(QUAD);
  top.noStroke();
  top.fill(120, 200);
  top.vertex(px[0],py[0]);
  top.vertex(px[1],py[1]);
  top.vertex(px[2],py[2]);
  top.vertex(0,0);
  top.endShape();
  
  // left
  left.beginShape(QUAD);
  left.noStroke();
  left.fill(200, 240);
  left.vertex(0,0);
  left.vertex(px[4],py[4]);
  left.vertex(px[5],py[5]);
  left.vertex(px[0],py[0]);
  left.endShape();
  
  // right
  right.beginShape(QUAD);
  right.noStroke();
  right.fill(150, 230);
  right.vertex(0,0);
  right.vertex(px[2],py[2]);
  right.vertex(px[3],py[3]);
  right.vertex(px[4],py[4]);
  right.endShape();
}

void drawSeed(float x, float y, float r) {
  pushMatrix();
  translate(x, y);
  rotate(r);
  
  // center points
  //strokeWeight(5);
  //point(0,0);
  //strokeWeight(1);  
  
  // outer quads
  shape(top);
  shape(left);
  shape(right);
  
 
  // inner quads
  if(isInner) {
    pushMatrix();
    scale(0.5);
    translate(0, rH/3);
    shape(top);
    popMatrix();
    
    pushMatrix();
    scale(0.5);
    translate(-rW/4, -rH/6);
    shape(left);
    popMatrix();
    
    pushMatrix();
    scale(0.5);
    translate(rW/4, -rH/6);
    shape(right);
    popMatrix();
  }
  
  
  popMatrix();
}
