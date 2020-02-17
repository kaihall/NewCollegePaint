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
  int sinceLastClick;
  
  public HitBox(float x, float y, float RadiusX, float RadiusY, float xCoord, float yCoord, Tool t, objects o) {
    this.xDistance = x;
    this.yDistance = y;
    this.radiusX = RadiusX;
    this.radiusY = RadiusY;
    this.xCoordRect = xCoord;
    this.yCoordRect = yCoord;
    this.tool = t;
    this.objectType = o;
    this.sinceLastClick = inputDelay;
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
    sinceLastClick++;
    if (mousePressed && mouseButton == LEFT && sinceLastClick > inputDelay) {
      if (tool != null && (currentTool != tool || currentTool == gridTool)) {
        sinceLastClick = 0;
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
    
    /*
    // This only runs for the image tool. This is only run when the tool is switched to the image tool
    if (objectType == objects.image) {
      ImageTool it = (ImageTool)t;
      it.uploadImage();
    }
    */
    
    if (currentTool == gridTool) {
      if (gridMode) gridMode = false;
      else gridMode = true;
      
      // White out the canvas
      noStroke();
      fill(255,255,255); // This covers the canvas
      rect(0, 0, width*0.748, height);
      
      // Draw all previous Objects to the canvas
      if (thingsToDraw != null) {
        for (Object o : thingsToDraw) {
          o.draw();
        }
      }
      if (tempDraw != null) {
        for (Object o : tempDraw) {
          o.draw();
        }
      }
      
      // Draw comments (if on)
      if (commentsMode) {
        for (Object o : comments) {
          o.draw();
        }
      }
      
      // Draw the grid (if on)
      if (gridMode) {
        gridTool.drawGrid();
      }
    }
  }  
}
