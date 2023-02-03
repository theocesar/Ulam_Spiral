int x, y;
int px, py;
int step = 1;
int stepSize = 10;
int numSteps = 1;
int state = 0;
int turnCounter = 1;
int totalSteps = 0;


boolean isPrime(int value) {
  if (value == 1) return false;
  for (int i = 2; i <= sqrt(value); i++) {
    if (value % i == 0) {
      return false;
    }
  }
  return true;
}


void setup() {
  size(1000, 1000);
  
  int columns = width / stepSize;
  int rows = height / stepSize;
  totalSteps = columns * rows;
  
  x = width / 2;
  y = height / 2;
  px = x;
  py = y;
  background(0);
  


  while (step <= totalSteps) {
  //void draw() {  
    
  // textSize(stepSize);
  // textAlign(CENTER, CENTER);
  // text(step, x, y);
  if (isPrime(step)) {
    fill(255);
    stroke(255);
    circle(x, y, stepSize * 0.5);
    //point(x, y);
  }
  line(x, y, px, py);
  px = x;
  py = y;
  
  switch (state) {
    
    case 0:
    x += stepSize;
    break;
    
    case 1:
    y -= stepSize;
    break;
    
    case 2:
    x -= stepSize;
    break;
    
    case 3:
    y += stepSize;
    break;
  }
  
  if (step % numSteps == 0) {
    state = (state + 1) % 4;
    turnCounter++;
    if (turnCounter % 2 == 0) {
      numSteps++;
    }
  }
  step++;
} 
  if (step > totalSteps) {
    noLoop();
  }
  
  
}
