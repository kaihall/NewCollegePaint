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
    selected = true;
    minX = MAX_INT;
    minY = MAX_INT;
    maxX = MIN_INT;
    maxY = MIN_INT;
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
    strokeWeight(2);
    pushMatrix();
    translate(offsetX,offsetY);
    rotate(angle);

    prepColor();
    drawShape();
    
    if (selected) {
      noFill();
      stroke(100,100,255,100);
      rect(minX, minY, maxX-minX, maxY-minY);
    }
    
    popMatrix();
  }
  
  public boolean underMouse() {
    return mouseX >= minX && mouseX <= maxX && mouseY >= minY && mouseY <= maxY;
  }
  
  public abstract void drawShape();
}
