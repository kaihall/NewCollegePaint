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
        //rect(mouseX-25, mouseY-15, .5*textWidth(toolTipString)*1.1, 25);
        fill(0,0,0);
        textSize(20);
        for (int i=-1; i<2; i++) {
          text(toolTipString, mouseX-20+i, mouseY-10);
          text(toolTipString, mouseX-20, mouseY-10+i);
        }
        fill(0,225,0);
        text(toolTipString, mouseX-20, mouseY-10);
      }
    }
  }
}
