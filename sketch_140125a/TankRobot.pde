class TankRobot extends FRCRobot {
  public TankRobot(int alliance, int x, int y) {
      super(alliance,x,y); 
      
   }
   
   public void move(int x,int y) {
   
   super.turnRobot(x);
   
   setY(getY() + y*sin(getRobotAngle())*1.5); 
   setX(getX() + y*cos(getRobotAngle())*1.5);
  
   
 }
 
 public void turnRobot(float direction) {
 
 }
   /*
   vertex(x1,y1);
      
      vertex(x2,y2);
      
      vertex(x7,y7);
      
      vertex(x8,y8);
      
      vertex(x5,y5);
      vertex(x6,y6);
      
      vertex(x3,y3);
      
      vertex(x4,y4);
     */ 
      
}
