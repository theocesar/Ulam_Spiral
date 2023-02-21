int x, y;
int px, py;
int step = 1;
int stepSize = 10;
int numSteps = 1;
int state = 0;
int turnCounter = 1;
int totalSteps = 0;


// function to check if a number is prime.
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
  
  // starting the count at the middle of the window.
  x = width / 2;
  y = height / 2;
  px = x;
  py = y;
  background(0);
  


  while (step <= totalSteps) {
  
  // marking primes in the spiral.
  if (isPrime(step)) {
    fill(255);
    stroke(255);
    circle(x, y, stepSize * 0.5);
    //point(x, y);
  }
  // connecting all the numbers with a line.
  line(x, y, px, py);
  px = x;
  py = y;
  
  // command block that rotates the numbers in order to form the spiral.
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
  
  // checking if its time to turn.
  if (step % numSteps == 0) {
    // if it is, then turn.
    state = (state + 1) % 4;
    turnCounter++;
    // every two turns, increase the number of steps required to turn next time.
    if (turnCounter % 2 == 0) {
      numSteps++;
    }
  }
  step++;
} 
  //if (step > totalSteps) {
    //noLoop();
  //}
  
  
}
