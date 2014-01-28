class ArcadeRobot extends FRCRobot {
  
   public ArcadeRobot(int alliance, int x, int y) {
      super(alliance,x,y); 
   }
   
public void drawMe(boolean selectedRobot) {
  
   outlineLogic(selectedRobot);
   noStroke();
   
   if(getAlliance() == 1) {
      fill(255,0,0);
   } else {
     fill(0,0,255);
   }
   
   float x1,y1,x2,y2,x3,y3,x4,y4;
   float centerX,centerY;
   centerX = getX()+getRobotWidth()/2;
   centerY = getY()+getRobotHeight()/2;

   float r = sqrt(pow(getRobotWidth()/2,2) + pow(getRobotHeight()/2,2));
   float recAngle = atan2(getRobotWidth()/2,getRobotHeight()/2);
   
   x1 = centerX + r * cos(recAngle+getRobotAngle());
   y1 = centerY + r * sin(recAngle+getRobotAngle());
   
   x2 = centerX + r * cos(PI-recAngle+getRobotAngle());
   y2 = centerY + r * sin(PI-recAngle+getRobotAngle());
   
   x3 = centerX + r * cos(PI+recAngle+getRobotAngle());
   y3 = centerY + r * sin(PI+recAngle+getRobotAngle());
   
   x4 = centerX + r * cos(TWO_PI-recAngle+getRobotAngle());
   y4 = centerY + r * sin(TWO_PI-recAngle+getRobotAngle());
    
   quad(x1,y1,x2,y2,x3,y3,x4,y4);

   stroke(0,0,255);
   strokeWeight(30);
   point(centerX,centerY);
   
   
   
     
 }
 
 public void move(int x,int y) {
   
   turnRobot(x);
   
   setY(getY() + y*sin(getRobotAngle())*1.5); 
   setX(getX() + y*cos(getRobotAngle())*1.5);
   
   
   //println(x + " " + y);
  
   
 }
}
