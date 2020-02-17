public abstract class Object {
  int x=0;
  int y=0;
  color fill;
  color Color;
  float angle;
  int offsetX;
  int offsetY;
  int scale;
  boolean selected;
  int maxX, maxY, minX, minY;
  
  public Object() {
    offsetX = 0;
    offsetY = 0;
    angle = 0;
    scale = 1;
    selected = false;
  }
  
  public void setX(int X) {x= X;}
  public void setY(int Y) {y=Y;}  
  public int getX() {return x;}
  public int getY() {return y;}
  public void setFill (color args) {fill = args; } // takes in array of fills;
  public void setColor(color args) {Color = args;} // takes in array of colors
  public color getFill() {return fill;}
  public color getStroke() {return Color;}
  
  public void select() {
    if (selected) selected = false;
    else selected = true;
  }
  
  public void move(int x, int y) {
    offsetX += x;
    offsetY += y;
  }
  
  public void rotate(float angle) {
    this.angle += angle;
  }
  
  public void prepColor() {    
    fill(fill);
    stroke(Color);
  }
  
  public void draw() {
    prepColor();
    strokeWeight(2);
    pushMatrix();
    translate(offsetX,offsetY);
    rotate(angle);
    drawShape();
    popMatrix();
  }
  
  //public boolean 
  
  public abstract void drawShape();
}
