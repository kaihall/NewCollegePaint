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
  circle, square, pixel, rectangle, line, ellipse, triangle, curve, polygon, text, scribble, image, grid
}

public class objectFactory {
  
  public objectFactory() {}
  
  Object createObject(objects o, color Fill, color Color, int[] args) {
    Object retVal;
    
    switch(o){
       case circle:
         retVal = new circle(args[0], args[1], Fill, Color, args[2]);
         break;
       case pixel:
         retVal = new pixel(args[0], args[1], Color); 
         break;
       case line:
         retVal = new Line(args[0], args[1], Fill, Color, args[2], args[3]);
         break;
       case square:
         retVal = new rectangle(args[0], args[1], Fill, Color, args[2], args[2]);
         break;
       case rectangle:
         retVal = new rectangle(args[0], args[1], Fill, Color, args[2], args[3]);
         break;
       case ellipse:
         retVal = new ellipse(args[0], args[1], Fill, Color, args[2], args[3]);
         break;   
       case curve:
         retVal = new curve(args,Color);
         break;
       case scribble:
         retVal = new scribble(args, Color);
         break;
       default:
         println("Something went wrong, it appears that you passed a shape that does not exists");
         retVal = null;
         break;
    }
    return retVal;
  }
}

/*
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
 
  public void drawShape() {
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
*/
