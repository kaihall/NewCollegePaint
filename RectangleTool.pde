public class RectangleTool extends Tool {
  boolean drawing;
  rectangle working;
  int sinceLastClick;
  int startX, startY;
  rectangle last;
  
  public RectangleTool() {
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
    if (mouseX < width*.75 && mousePressed && sinceLastClick > inputDelay) {
      sinceLastClick = 0;
      if (isActive) {
        if (drawing) {
          drawing = false;
          last = working;
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
  
  public void cleanUp() {
    drawing = false;
    thingsToDraw.remove(working);
  }
  
  void drawLastRectangle() {
    int newX = last.getX()+20+last.getWidth() >= width*0.75 ? 0 : last.getX()+20;
    int newY = last.getX()+20+last.getWidth() >= width*0.75 ? 0 : last.getY()+20;
    rectangle addThis = new rectangle(newX,newY,last.getFill(),last.getStroke(),last.getWidth(),last.getHeight());
    last = addThis;
    thingsToDraw.add(addThis);
  }
  
  public Object getObject() { return working; }
}



public class rectangle extends Object {
  int w = 0;
  int h = 0;
  //int x=0;
  //int y=0;
  //int[] fill;
  //int[] Color;
 
  public rectangle(int X, int Y, color Fill, color COlor, int W, int H) {
    x = X;
    y = Y;
    w = W;
    h = H;
    fill = Fill;
    Color = COlor;
    minX = x - w;
    minY = y - h;
    maxX = x + w;
    maxY = y + h;   
  }
 
  public void drawShape() {
    rectMode(CORNER);
    rect(x, y, w, h);
  }
  
  public void setWidth(int W) {
    w = W;
    maxX = x + w/2;
    minX = x - w/2;
  }
  
  public void setHeight(int H) {
    h = H;
    maxY = y + h/2;
    minY = y - h/2;
  }
  
  public int getWidth() {return w;}
  
  public int getHeight() {return h;}
  
  //public void setX() {}
  
  //public void setY() {} 
  
  //public void setFill() {}
  
  //public void setColor() {}
  
}
