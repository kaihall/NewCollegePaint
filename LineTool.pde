public class LineTool extends Tool {
  // Constructor should also take in RGB values so user can select colors from color selector
  boolean drawing;
  Line working;
  
  public LineTool(){
    super();
    isActive = true;
    args = new int[4];
    drawing = false;
    working = null;
  }  
  
  void sketch(){
    if (!isActive && drawing) {
      drawing = false;
      thingsToDraw.remove(working);
    }
    else if (drawing) {
      working.setEndX(mouseX);
      working.setEndY(mouseY);
    }
  }
  
  void mousePressed() {
    if (isActive) {
      if (drawing) {
        drawing = false;
      }
      else {
        drawing = true;
        working = new Line(0, 0, fill, stroke, mouseX, mouseY);
        thingsToDraw.add(working);
      }
    }
  }

}
