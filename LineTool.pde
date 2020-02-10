public class LineTool extends Tool {
  boolean drawing;
  Line working;
  int sinceLastClick;
  
  public LineTool(){
    super();
    //isActive = true;
    args = new int[4];
    drawing = false;
    working = null;
    sinceLastClick = 0;
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
          working = new Line(mouseX, mouseY, fill, stroke, mouseX, mouseY);
          thingsToDraw.add(working);
        }
      }
    }
    
    if (!isActive && drawing) {
      drawing = false;
      thingsToDraw.remove(working);
    }
    else if (drawing) {
      working.setEndX(mouseX);
      working.setEndY(mouseY);
    }
  }

}
