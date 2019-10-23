int resolution = 20;
float frequency = 0.4;
float amplitude = 1.5;
float vaseHeight = 2000;
float phase = 0;

void setup() {
  fullScreen(P3D);
  smooth(8);
  
  setupGUI();
}

void draw() {
  int rowNum = resolution*5;
  float quadHeight = vaseHeight/rowNum;

  background(30);
  lights();
  pushMatrix();
  translate(0, -vaseHeight/2, 0);
  fill(200);
  stroke(0,0,0);
  strokeWeight(1);
  rotateY((float)(frameCount * Math.PI / 400));

  PVector[][] verticies = calculateVerticies(rowNum, quadHeight);

  beginShape(QUAD_STRIP);
  for (int i=1; i<verticies.length; i++) {
    PVector[] pointListTop = verticies[i-1];
    PVector[] pointListBottom = verticies[i];

    for (int j=0; j <= pointListTop.length; j++) {
      int t = (j<pointListTop.length ? j : 0);
      
      PVector bottom = pointListBottom[t];
      PVector top = pointListTop[t];
      vertex(top.x, top.y, top.z);
      vertex(bottom.x, bottom.y, bottom.z);
    }
  }
  endShape(CLOSE);
  popMatrix();
  
  
  // ControlP5 and PeasyCam
  if(cp5.isMouseOver()) cam.setActive(false);
  else                  cam.setActive(true); 
  
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
}

PVector[][] calculateVerticies(int rowNum, float quadHeight) {
  PVector[][] vertices = new PVector[rowNum][resolution];
  
  for (int i=0; i<rowNum; i++) {
    float y = quadHeight*i;
    float theta = map(i,0,rowNum,0,20*PI);

    float r = 1;
    for(int h = 1; h <= 10; h++) {
      r += sin(theta*frequency/h+phase);
    }
    r *= amplitude/2;
    //float r = (1+sin(theta*frequency+phase))*amplitude/2;
    vertices[i] = calculatePoints(r*100, y, resolution);;
  }
  return vertices;
}


PVector[] calculatePoints(float r, float y, int res) {
  PVector [] pointList = new PVector[res];
  for (int i =0; i<res; i++) {
    float theta = 2*PI/res*i;
    float x = cos(theta)*(r*(noise(i)+1));
    float z = sin(theta)*(r*(noise(-i,i/2)+1));
    pointList[i] = new PVector(x, y, z);
  }

  return pointList;
}
