/**
wasdinput taken from http://wiki.processing.org/index.php?title=W-A-S-D_control_keyboard_input
@author sojamo
*/
 
final static int NORTH = 1;
final static int EAST = 2;
final static int SOUTH = 4;
final static int WEST = 8;
final static int CLOCKWISE = 1;
final static int COUNTERCLOCKWISE = 2;
int keyDirection;
int keyTurn;
float x,y;
int selectedRobot;
FRCRobot[] robots = new FRCRobot[6];
 
void setup() {
  size(1020,600);
  frameRate(30);  
  keyDirection = 0;
  keyTurn = 0;
  x = width/2;
  y = height/2;
  selectedRobot = 0;
  
  robots[0] = new ArcadeRobot(1,670,50);
  robots[1] = new HolonomicRobot(1,670,150);
  robots[2] = new TankRobot(1,670,250);
  
  robots[3] = new FRCRobot(2,150,50);
  robots[4] = new FRCRobot(2,150,150);
  robots[5] = new FRCRobot(2,150,250);
}
 
void draw() {
  int moveRate = 2;
  background(0);
  
  drawField();
  
  FRCRobot robot1 = robots[selectedRobot]; 
  
  switch(keyDirection) {
    case NORTH: robot1.move(0,-moveRate); break;
    case EAST: robot1.move(moveRate,0); break;
    case SOUTH: robot1.move(0,moveRate); break;
    case WEST: robot1.move(-moveRate,0); break;
    case NORTH|EAST: robot1.move(moveRate,-moveRate); break;
    case NORTH|WEST: robot1.move(-moveRate,-moveRate); break;
    case SOUTH|EAST: robot1.move(moveRate,moveRate); break;
    case SOUTH|WEST: robot1.move(-moveRate,moveRate); break;
  }
  
  switch(keyTurn) {
    case COUNTERCLOCKWISE: robot1.turnRobot(-1);break;
    case CLOCKWISE: robot1.turnRobot(1);break;
  }
  
  for(int i=0; i<robots.length; i++) {
    if(i!=selectedRobot) {
       robots[i].move(0,0);
    }
    robots[i].drawMe(i==selectedRobot);
  }
  //robot1.drawMe();
  
}
 
void keyPressed(){
  switch(key) {
    case('w'):case('W'):keyDirection |=NORTH;break;
    case('d'):case('D'):keyDirection |=EAST;break;
    case('s'):case('S'):keyDirection |=SOUTH;break;
    case('a'):case('A'):keyDirection |=WEST;break;
    case('k'):case('K'):keyTurn |=COUNTERCLOCKWISE;break;
    case('l'):case('L'):keyTurn |=CLOCKWISE;break;
    case('i'):case('I'):switchBot(-1);break;
    case('o'):case('O'):switchBot(1);break;
  }
  
  
}
 
void keyReleased(){  
  switch(key) {
    case('w'):case('W'):keyDirection ^=NORTH;break;
    case('d'):case('D'):keyDirection ^=EAST;break;
    case('s'):case('S'):keyDirection ^=SOUTH;break;
    case('a'):case('A'):keyDirection ^=WEST;break;
    case('k'):case('K'):keyTurn ^=COUNTERCLOCKWISE;break;
    case('l'):case('L'):keyTurn ^=CLOCKWISE;break;
  }
}

void switchBot(int toggle) {
  selectedRobot += toggle;
  if(selectedRobot == -1) {
    selectedRobot = 2;
  }
  
  if(selectedRobot == 3) {
    selectedRobot = 0;
  }
}

void drawField() {
  noFill();
  
  
  strokeWeight(5);
  stroke(0,0,255);
  rect(10,40,89,343);
  stroke(255,0,0);
  rect(10+89+2+8+268+268+268,40,89,343);
  
  strokeWeight(3);
  
  stroke(0,0,255);
  rect(10+89+2,10,268,403);
  stroke(255,255,255);
  rect(10+89+2+4+268,10,268,403);
  stroke(255,0,0);
  rect(10+89+2+6+268+268,10,268,403);
    
}
