public class PolygonTool{
  
  int prevPosX;
  int prevPosY;
  
  public PolygonTool(){}
 
 
void sketch() {
  if(mousePressed){
    if(prevPosX !=0 && prevPosY !=0) {
     line(prevPosX, prevPosY, mouseX, mouseY);
     }
     prevPosX = mouseX;
     prevPosY = mouseY;
    }
  }
}
