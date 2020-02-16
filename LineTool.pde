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
  
  void sketch(){
    sinceLastClick++;
    if (mouseX < width*.75 && mousePressed && sinceLastClick > inputDelay) {
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
  
  void makeLine(int x1, int y1, int x2, int y2) {
    thingsToDraw.add(new Line(x1,y1,fill,stroke,x2,y2));
  }
  
  public Object getObject() { return working; }
}


public class Line extends Object {
  int startX = 0;
  int startY = 0;
  int endX = 0;
  int endY = 0;
  //int[] fill;
  //int[] Color;
 
  public Line(int X, int Y, color Fill, color COlor, int eX, int eY) {
    super();
    startX = X;
    startY = Y;
    endX = eX;
    endY = eY;
    fill = Fill;
    Color = COlor;
  }
 
  public void drawShape() {
    line(startX, startY, endX, endY);
  }
  
  public void setX(int x) {startX = x;}
  
  public void setY(int y) {startY = y;} 
  
  public void setEndX(int x) {endX = x;}
  
  public void setEndY(int y) {endY = y;}
  
  //public void setFill() {}
  
  //public void setColor() {}
  
}
