public class ToolTip {
  String toolTipString;
  float xDistance;
  float yDistance;
  float radiusX;
  float radiusY;
  
  ToolTip(String string, float x, float y, float RadiusX, float RadiusY){
    this.toolTipString = string;
    this.xDistance = x;
    this.yDistance = y;
    this.radiusX = RadiusX;
    this.radiusY = RadiusY;
  }
  
  void makeText(){
    
    if(dist(mouseX, mouseY, xDistance, yDistance) < radiusX){
      if(dist(mouseX, mouseY, xDistance, yDistance) < radiusY/2){
        fill(255,0,0,10);
        rect(mouseX-25, mouseY-15, .5*textWidth(toolTipString)*1.1, 25);
        fill(0,225,0);
        textSize(20);
        text(toolTipString, mouseX-20, mouseY-10);
      }
    }
  }
}
