/*  
This class will be passed what the user wants to make along with the arugments needed to make that object
**Arguments to this Factory: [Object.Type, int[] Fill, int[] Color, int[] args]**
~Shape Args~
Pixel:      [x,y]
Circle:     [x,y,radius]
Rectangle:  [x,y,width,height]
Square:     [x,y,length]
Triangle:   [x,y,P1x,P1y,P2x,P2y,P3x,P3y]
Ellipse:    [x,y,width,height]
Line:       [x,y]
This will also hold all of the basic types of shapes Processing can make  
*/

enum objects {
  circle, square, pixel, rectangle, line, ellipse, triangle, curve
}

public class objectFactory {
  
  public objectFactory() {}
  
  Object createObject(objects o, color Fill, color Color, int[] args) {
    Object retVal;
    
    switch(o){
       case circle:
         println("Circle");
         retVal = new circle(args[0], args[1], Fill, Color, args[2]);
         break;
       case pixel:
         println("Pixel");
         retVal = new pixel(args[0], args[1], Color); 
         break;
       case line:
         println("Line");
         retVal = new Line(args[0], args[1], Fill, Color, args[2], args[3]);
         break;
       case square:
         println("Square");
         retVal = new rectangle(args[0], args[1], Fill, Color, args[2], args[2]);
         break;
       case rectangle:
         println("Rectangle");
         retVal = new rectangle(args[0], args[1], Fill, Color, args[2], args[3]);
         break;
       case ellipse:
         println("Ellipse");
         retVal = new ellipse(args[0], args[1], Fill, Color, args[2], args[3]);
         break;   
       case triangle:
         println("Triangle");
         retVal = new triangle(args[0], args[1], Fill, Color, args[2], args[3], args[4], args[5]);
         break; 
       case curve:
         println("Curve");
         retVal = new curve(args,Color);
         break;
       default:
         println("Something went wrong, it appears that you passed a shape that does not exists");
         retVal = null;
         break;
    }
    return retVal;
  }
}

public class pixel extends Object {
  public pixel (int x, int y, color stroke) {
    this.x = x;
    this.y = y;
    this.Color = stroke;
    this.fill = stroke;
  }
  
  public void draw() {
    prepColor();
    set(x,y,Color);
  }
}

public class circle extends Object {
  int radius = 0;
  //int x=0;
  //int y=0;
  //int[] fill;
  //int[] Color;
 
  public circle(int X, int Y, color Fill, color COlor, int Radius) {
    x = X;
    y = Y;
    radius = Radius;
    fill = Fill;
    Color = COlor;
  }
 
  public void draw() {
    prepColor();
    circle(x, y, radius);
  }
  
  public void setRadius(int r) {radius = r;}
  
  //public void setX(int x) {}
  
  //public void setY(int y) {} 
  
  //public void setFill(color c) {}
  
  //public void setColor() {}
  
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
  }
 
  public void draw() {
    prepColor();
    rectMode(CORNER);
    rect(x, y, w, h);
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

public class ellipse extends Object {
  int w = 0;
  int h = 0;
  //int x=0;
  //int y=0;
  //int[] fill;
  //int[] Color;
 
  public ellipse(int X, int Y, color Fill, color COlor, int W, int H) {
    x = X;
    y = Y;
    w = W;
    h = H;
    fill = Fill;
    Color = COlor;
  }
 
  public void draw() {
    prepColor();
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

public class Line extends Object {
  int startX = 0;
  int startY = 0;
  int endX = 0;
  int endY = 0;
  //int[] fill;
  //int[] Color;
 
  public Line(int X, int Y, color Fill, color COlor, int eX, int eY) {
    startX = X;
    startY = Y;
    endX = eX;
    endY = eY;
    fill = Fill;
    Color = COlor;
  }
 
  public void draw() {
    prepColor();
    line(startX, startY, endX, endY);
  }
  
  public void setX(int x) {startX = x;}
  
  public void setY(int y) {startY = y;} 
  
  public void setEndX(int x) {endX = x;}
  
  public void setEndY(int y) {endY = y;}
  
  //public void setFill() {}
  
  //public void setColor() {}
  
}

public class triangle extends Object {
  int startX = 0;
  int startY = 0;
  int midX = 0;
  int midY = 0;
  int endX = 0;
  int endY = 0;
  //int[] fill;
  //int[] Color;
 
  public triangle(int X, int Y, color Fill, color COlor, int eX, int eY, int mX, int mY) {
    startX = X;
    startY = Y;
    endX = eX;
    endY = eY;
    midX = mX;
    midY = mY;
    fill = Fill;
    Color = COlor;
  }
 
  public void draw() {
    prepColor();
    triangle(startX, startY, midX, midY, endX, endY);
  }
  
  public void setX(int x) {startX = x;}
  
  public void setY(int y) {startY = y;} 
  
  public void setEndX(int x) {endX = x;}
  
  public void setEndY(int y) {endY = y;}
  
  public void setMidX(int x) {midX = x;}
  
  public void setMidY(int y) {midY = y;}
  
  //public void setFill() {}
  
  //public void setColor() {}
  
}

public class curve extends Object {
  ArrayList<Integer> xPoints;
  ArrayList<Integer> yPoints;
  
  public curve(int[] args, color stroke) {
    Color = stroke;
    
    xPoints = new ArrayList<Integer>();
    yPoints =new ArrayList<Integer>();
    
    for (int i = 0; i < args.length; i++) {
      if (i%2 == 0) xPoints.add(args[i]);
      else yPoints.add(args[i]);
    }
  }
  
  public void draw(){
    prepColor();
    noFill();
    beginShape();
    curveVertex(xPoints.get(0),yPoints.get(0));
    for (int i = 0; i < min(xPoints.size(),yPoints.size()); i++) {
      curveVertex(xPoints.get(i),yPoints.get(i));
    }
    curveVertex(xPoints.get(xPoints.size()-1), yPoints.get(yPoints.size()-1));
    endShape();
  }
}
