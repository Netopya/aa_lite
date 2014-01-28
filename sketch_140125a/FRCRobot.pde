class FRCRobot {
  float  x,y;
  int alliance;
  float turrentAngle;
  float turrentLength;
  float robotAngle;
  float robotWidth,robotHeight;
  int outlineCount;
  boolean selectedRobot;
  float velocity;
  final static float MAXVELOCITY = 1.5;
  float headingX;
  int direction;
  FRCRobot[] robots;
  
 public FRCRobot() {
   
 }
 
 public FRCRobot(int alliance, int x, int y) {
   this.x = x;
   this.y = y;
   this.alliance = alliance;
   turrentLength = 50;
   robotWidth = 70;
   robotHeight = 100;
   turrentAngle = 0;
   robotAngle = 0;
   outlineCount = 0;
   velocity=0;
   direction=0;
 }
 
 public void storeRobots(FRCRobot[] robots) {
   this.robots = robots;
 }
 
 public float getX() {
   return x;
 }
 
 public float getY() {
   return y; 
 }
 
 public float getRobotAngle() {
  return  robotAngle;
 }
 
 public float getRobotWidth() {
   return robotWidth; 
 }
 
 public float getRobotHeight() {
   return robotHeight;
 }
 
 public int getAlliance() {
  return alliance; 
 }
 
 public void setX(float x) {
   this.x = x;
 }
 
 public void setY(float y) {
   this.y = y;
 }
 
 public void setWidth(float robotWidth) {
   this.robotWidth = robotWidth;
 }
 
 public void setHeight(float robotHeight) {
   this.robotHeight = robotHeight;
 }
 
  
 public void drawMe(boolean selectedRobot) {
   
   outlineLogic(selectedRobot);
   noStroke();
   
   if(alliance == 1) {
      fill(255,0,0);
   } else {
     fill(0,0,255);
   }
   
   //rect(x,y,robotWidth,robotHeight);
   float x1,y1,x2,y2,x3,y3,x4,y4;
   float centerX,centerY;
   centerX = x+robotWidth/2;
   centerY = y+robotHeight/2;

   float r = sqrt(pow(robotWidth/2,2) + pow(robotHeight/2,2));
   float recAngle = atan2(robotWidth/2,robotHeight/2);
   
   x1 = centerX + r * cos(recAngle+robotAngle);
   y1 = centerY + r * sin(recAngle+robotAngle);
   
   x2 = centerX + r * cos(PI-recAngle+robotAngle);
   y2 = centerY + r * sin(PI-recAngle+robotAngle);
   
   x3 = centerX + r * cos(PI+recAngle+robotAngle);
   y3 = centerY + r * sin(PI+recAngle+robotAngle);
   
   x4 = centerX + r * cos(TWO_PI-recAngle+robotAngle);
   y4 = centerY + r * sin(TWO_PI-recAngle+robotAngle);
   
   quad(x1,y1,x2,y2,x3,y3,x4,y4);
  
   stroke(0,255,0);
   strokeWeight(5);
   float linex = x+robotWidth/2;
   float liney = y+robotHeight/2;
   line(linex,liney, linex - cos(robotAngle + turrentAngle)*turrentLength, liney - sin(robotAngle + turrentAngle)*turrentLength);
   
   stroke(0,0,255);
   strokeWeight(30);
   point(centerX,centerY);
   
   
   
   this.y += sin(robotAngle)*velocity*direction;
   this.x += cos(robotAngle)*velocity*direction;
     
 }
 
 public void move(int x,int y) {
   /*this.x += x;
   this.y += y; */
   if(y != 0) {
     if(direction != y) {
       velocity =0;
     }
     if(velocity < MAXVELOCITY){
       velocity+=0.05;
     }
     direction = abs(y);
     
   } else {
     if(velocity > 0.1) {
       velocity-=0.1;
     } else if( velocity <= 0.1) {
       velocity = 0;
     }
     
     
   }
   velocity = y;
   turnRobot(x);
   
 }
 
 public void turnTurret(float direction) {
   turrentLength += direction*PI/180;
 }
 
 public void turnRobot(float direction) {
   robotAngle += 2*direction*PI/180;
 }

public void outlineLogic(boolean selectedRobot) {
  if(this.selectedRobot != selectedRobot){
     outlineCount = 0;
     this.selectedRobot = selectedRobot;
   }
   
   if(selectedRobot) {
     if(outlineCount < 30) {
       drawOutline();
     }
     
     if(outlineCount > 50) {
       outlineCount = 0;
     }
     outlineCount++;
   }
}

public void drawOutline() {
  strokeWeight(5);
  stroke(0,255,255);
  noFill();
  rect(x-60,y-60,robotWidth+120,robotHeight+120);
} 
  
}
