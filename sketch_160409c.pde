int MAKE_INTERVAL = 1;
int CIRCLE_DIAMETER = 50;
int DOT_CENTER_CIRCLE_DIAMETER = 3;
float NEEDLE_SPEED = -0.1f;
float timer;
ArrayList<PVector> circleList = new ArrayList<PVector>();
FloatList processList = new FloatList();



void setup() {
  size(500,300);
  resetTimer();
  PVector position = makeCirclePosition();
  circleList.add(position);
}

void draw() {
  background(255);
  timer--;
  for(int i=0;i<processList.size();i++){
     float process = processList.get(i);
     process += 1 * NEEDLE_SPEED;
     processList.set(i,process);
  }
  
  if(timer<=0) {
     resetTimer();
     PVector position = makeCirclePosition();
     circleList.add(position);
  }
  for(int i = 0; i<circleList.size(); i++) {
    makeCircle(circleList.get(i),i);  
  }
  
 
}

void makeCircle(PVector position,int index) {
  
  ellipse(position.x,position.y,CIRCLE_DIAMETER,CIRCLE_DIAMETER);
  makeCenterDotCircle(position);
  makeLine(position,index);
}

PVector makeCirclePosition() {
  PVector position = new PVector();
  position.x = width/2; 
  position.y = height/2;
  position.x = random(0,width); 
  position.y = random(0,height);
  processList.append(0);
  return position;
}

void makeCenterDotCircle(PVector position) {
  ellipse(position.x,position.y,DOT_CENTER_CIRCLE_DIAMETER,DOT_CENTER_CIRCLE_DIAMETER);
}

void makeLine(PVector position,int index) {
  line(position.x,position.y,position.x + CIRCLE_DIAMETER/2 *cos(processList.get(index)),position.y + CIRCLE_DIAMETER/2 *sin(processList.get(index)));
}


void resetTimer() {
  timer = MAKE_INTERVAL * frameRate;
}