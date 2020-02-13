public class CircleTool extends Tool {
  boolean drawing;
  ellipse working;
  int sinceLastClick;
  int startX, startY;
  ellipse last;
  
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
  
  void draw() {}
  
  void sketch(){
    sinceLastClick++;
    if (mouseX < width*.75 && mousePressed && sinceLastClick > 5) {
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
    
    if (!isActive && drawing) {
      drawing = false;
      thingsToDraw.remove(working);
    }
    else if (drawing) {
      working.setWidth(2*(mouseX-startX));
      working.setHeight(2*(mouseY-startY));
    }
  }
  
  void drawLastCircle() {
    ellipse addThis = new ellipse(last.getX()+20,last.getY()+20,last.getFill(),last.getStroke(),last.getWidth(),last.getHeight());
    last = addThis;
    thingsToDraw.add(addThis);
  }
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
