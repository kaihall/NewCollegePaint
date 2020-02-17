// Potential problem, this stored Tool checks with the global Tool which means if global Tool is reset then this class can messup in updateTool()

enum tools {
  pencil, line, rect, circle, curve, polygon, text
}

public class HitBox { 
  
  Extras e = new Extras();
  float xDistance;
  float yDistance;
  float radiusX;
  float radiusY;
  float xCoordRect;
  float yCoordRect;
  objects objectType;
  Tool tool;
  //boolean isClicked = false;
  
  public HitBox(float x, float y, float RadiusX, float RadiusY, float xCoord, float yCoord, Tool t, objects o) {
    this.xDistance = x;
    this.yDistance = y;
    this.radiusX = RadiusX;
    this.radiusY = RadiusY;
    this.xCoordRect = xCoord;
    this.yCoordRect = yCoord;
    this.tool = t;
    this.objectType = o;
  }
  
  void makeHitBox(){
    if(dist(mouseX, mouseY, xDistance, yDistance) < radiusX){
      if(dist(mouseX, mouseY, xDistance, yDistance) < radiusY/2){
        stroke(255,0,0);
        fill(0,0,0,0); // alpha value zero so transparent
        rect(xCoordRect, yCoordRect, radiusX, radiusY);
        updateTool();
      }
    }
  }
  
  void updateTool() {
    if (mousePressed && mouseButton == LEFT) {
      if (tool != null && currentTool != tool) {
        switchTool(tool, objectType); 
      }
    }
  }
  
  void switchTool(Tool t, objects type) {
    if (currentTool != null) {
      currentTool.setActive(false);
      currentTool.cleanUp();
    }
    currentTool = t;
    t.setType(type);
    t.setActive(true);
    
    // This only runs for the image tool. This is only run when the tool is switched to the image tool
    if (objectType == objects.image) {
      ImageTool it = (ImageTool)t;
      it.uploadImage();
    }
  }  
}
