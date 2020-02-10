public abstract class Object {
  int x=0;
  int y=0;
  color fill;
  color Color;
  
  public void draw() {};
  public void setX(int X) {x= X;}
  public void setY(int Y) {y=Y;}  
  public int getX() {return x;}
  public int getY() {return y;}
  public void setFill (color args) {fill = args; } // takes in array of fills;
  public void setColor(color args) {Color = args;} // takes in array of colors
  public color getFill() {return fill;}
  public color getStroke() {return Color;}
  
  // What does prepColor do?
  
  public void prepColor() {    
    fill(fill);
    stroke(Color);
  }
}
