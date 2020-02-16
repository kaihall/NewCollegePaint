public class CircleTool extends Tool {
  boolean drawing;      //true if the user is drawing an ellipse right now
  ellipse working;      //the ellipse that the user is drawing
  int sinceLastClick;   //time since the user last clicked on the canvas
  int startX, startY;   //the center of the ellipse that the user is drawing
  ellipse last;         //the last ellipse drawn (defaults to 50-radius black and white circle in top left corner of screen)
  
  /*
   * Constructor; deactivates tool, initializes variables to arbitrary values, sets last ellipse equal to the default ellipse
   */
  public CircleTool(){
    super();
    //isActive = true;
    drawing = false;
    working = null;
    sinceLastClick = 0;
    startX = 0;
    startY = 0;
    last = new ellipse(50,50,color(255),color(0),50,50);
  }  
  
  
  /*
   * If the tool is active and the user clicks on the canvas...
   *    If the user isn't drawing anything: Stick a circle at the current location and start drawing
   *    If the user is drawing something: Stop drawing and leave the circle where it is
   */
  void sketch(){
    sinceLastClick++;
    if (mouseX < width*.75 && mousePressed && sinceLastClick > inputDelay) {
      sinceLastClick = 0;
      if (isActive) {
        if (drawing) {
          drawing = false;
          last = working;
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
    
    // If the tool somehow got turned off in the middle of drawing something, stop drawing
    if (!isActive && drawing) {
      drawing = false;
      thingsToDraw.remove(working);
    }
    
    // Make the ellipse bigger as the mouse moves away from it and smaller as it moves closer
    else if (drawing) {
      working.setWidth(2*(mouseX-startX));
      working.setHeight(2*(mouseY-startY));
    }
  }
  
  /*
   * Draws the most recent ellipse drawn by the user at a slight offset from the original, or a 50-radius black and white circle if no ellipses have been drawn yet
  */
  void drawLastCircle() {
    ellipse addThis = new ellipse(last.getX()+20,last.getY()+20,last.getFill(),last.getStroke(),last.getWidth(),last.getHeight());
    last = addThis;
    thingsToDraw.add(addThis);
  }
  
  public Object getObject() { return working; }
  public boolean drawing() { return drawing; }
}



public class ellipse extends Object {
  int w = 0;
  int h = 0;
  //int x=0;
  //int y=0;
  //int[] fill;
  //int[] Color;
 
  public ellipse(int X, int Y, color Fill, color COlor, int W, int H) {
    super();
    x = X;
    y = Y;
    w = W;
    h = H;
    fill = Fill;
    Color = COlor;
  }
 
  public void drawShape() {
    ellipse(x, y, w, h);
  }
  
  public void setWidth(int W) {w = W;}
  
  public void setHeight(int H) {h = H;}
  
  public int getWidth() {return w;}
  
  public int getHeight() {return h;}
  
  //public void setX() {}
  
  //public void setY() {} 
  
  //public void setFill() {}
  
  //public void setColor() {}
  
}

public class circle extends Object {
  int radius = 0;
  //int x=0;
  //int y=0;
  //int[] fill;
  //int[] Color;
 
  public circle(int X, int Y, color Fill, color COlor, int Radius) {
    super();
    x = X;
    y = Y;
    radius = Radius;
    fill = Fill;
    Color = COlor;
  }
 
  public void drawShape() {
    circle(x, y, radius);
  }
  
  public void setRadius(int r) {radius = r;}
  
  //public void setX(int x) {}
  
  //public void setY(int y) {} 
  
  //public void setFill(color c) {}
  
  //public void setColor() {}
  
}
