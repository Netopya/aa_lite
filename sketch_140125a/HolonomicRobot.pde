class HolonomicRobot extends FRCRobot {
  public HolonomicRobot(int alliance, int x, int y) {
      super(alliance,x,y); 
      setHeight(getRobotHeight() * 2/3);
      //setWidth(getRobotWidth() * 2/3);
      setWidth(getRobotHeight());
      
   }
   
   public void drawMe(boolean selectedRobot) {
  
     outlineLogic(selectedRobot);
     noStroke();
     
     if(getAlliance() == 1) {
        fill(255,0,0);
     } else {
       fill(0,0,255);
     }
     
     float x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8;
     float centerX,centerY;
     centerX = getX()+getRobotWidth()/2;
     centerY = getY()+getRobotHeight()/2;
  
     float r = sqrt(pow(getRobotWidth()/2,2) + pow(getRobotHeight()/2,2));
     float recAngle = atan2(getRobotWidth()/2,getRobotHeight()/2);
     
     
     recAngle -= PI/10;
     
     x1 = centerX + r * cos(recAngle+getRobotAngle());
     y1 = centerY + r * sin(recAngle+getRobotAngle());
      
     x2 = centerX + r * cos(PI/2-recAngle+getRobotAngle());
     y2 = centerY + r * sin(PI/2-recAngle+getRobotAngle());
     
     x3 = centerX + r * cos(PI/2+recAngle+getRobotAngle());
     y3 = centerY + r * sin(PI/2+recAngle+getRobotAngle());
     
     x4 = centerX + r * cos(PI-recAngle+getRobotAngle());
     y4 = centerY + r * sin(PI-recAngle+getRobotAngle());
     
     x5 = centerX + r * cos(PI+recAngle+getRobotAngle());
     y5 = centerY + r * sin(PI+recAngle+getRobotAngle());
     
     float ratio = (float)3/(float)2;
     
     
     x6 = centerX + r * cos(ratio*PI-recAngle+getRobotAngle());
     y6 = centerY + r * sin(ratio*PI-recAngle+getRobotAngle());
     
     x7 = centerX + r * cos(ratio*PI+recAngle+getRobotAngle());
     y7 = centerY + r * sin(ratio*PI+recAngle+getRobotAngle());
     
     x8 = centerX + r * cos(TWO_PI-recAngle+getRobotAngle());
     y8 = centerY + r * sin(TWO_PI-recAngle+getRobotAngle());
      
     //polygon(x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7,x8,y8);

     beginShape();
      vertex(x1,y1);
      
      vertex(x2,y2);
      
      vertex(x3,y3);
      
      vertex(x4,y4);
      vertex(x5,y5);
      vertex(x6,y6);
      vertex(x7,y7);
      vertex(x8,y8);
    
     endShape(); 
     
     stroke(0,0,255);
     strokeWeight(30);
     point(centerX,centerY);
     strokeWeight(3);
     point(x3,y3);
     
   
     
 }
 
 public void move(int x,int y) {
   
   //turnRobot(x);
   
   setY(getY() + y); 
   setX(getX() + x);
  
   
 }
 
 
}
