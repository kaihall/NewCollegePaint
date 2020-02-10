public class RectangleTool extends Tool {
  boolean drawing;
  rectangle working;
  int sinceLastClick;
  int startX, startY;
  rectangle last;
  
  public RectangleTool(){
    super();
    //isActive = true;
    args = new int[4];
    drawing = false;
    working = null;
    sinceLastClick = 0;
    startX = 0;
    startY = 0;
    last = new rectangle(50,50,color(255),color(0),50,50);
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
          working = new rectangle(mouseX, mouseY, fill, stroke, mouseX, mouseY);
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
      working.setWidth(mouseX-startX);
      working.setHeight(mouseY-startY);
    }
  }
  
  void drawLastRectangle() {
    rectangle addThis = new rectangle(last.getX()+20,last.getY()+20,last.getFill(),last.getStroke(),last.getWidth(),last.getHeight());
    last = addThis;
    thingsToDraw.add(addThis);
  }
}
