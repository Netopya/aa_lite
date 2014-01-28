class ArcadeRobot extends FRCRobot {
   public ArcadeRobot(int alliance, int x, int y) {
      super(alliance,x,y); 
   }
   
   outlineLogic();
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
}
