public class CircleTool extends Tool {
  boolean drawing;
  ellipse working;
  int sinceLastClick;
  int startX, startY;
  
  public CircleTool(){
    super();
    //isActive = true;
    drawing = false;
    working = null;
    sinceLastClick = 0;
    startX = 0;
    startY = 0;
  }  
  
  void draw() {}
  
  void sketch(){
    sinceLastClick++;
    if (mouseX < width*.75 && mousePressed && sinceLastClick > 5) {
      sinceLastClick = 0;
      if (isActive) {
        if (drawing) {
          drawing = false;
        }
        else {
          drawing = true;
          working = new ellipse(mouseX, mouseY, fill, stroke, 2, 2);
          thingsToDraw.add(working);
          startX = mouseX;
          startY = mouseY;
        }
      }
    }
    
    if (!isActive && drawing) {
      drawing = false;
      thingsToDraw.remove(working);
    }
    else if (drawing) {
      working.setWidth(2*(mouseX-startX));
      working.setHeight(2*(mouseY-startY));
    }
  }

}
