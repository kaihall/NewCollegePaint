// The right side panel

public class ToolBox {
  
  private float xCoord = width*3/4;
  private float yCoord = 0;
  private float wid = width/4;
  private float hite = height/2;
  
  
  public ToolBox() {}
 
  
  void show(){
    
    fill(255);
    stroke(0);
    strokeWeight(6);
    rect(xCoord, yCoord, wid, hite);
    
   }
}
