public abstract class Tool {
  boolean isActive;
  objectFactory of;
  objects type;
  color stroke;
  color fill;
  int[] args;
  
  public Tool() {
    isActive = false;
    of = new objectFactory();
    stroke = color(0);
    fill = color(255);
  }
  
  public abstract void sketch();
  
  public void setActive(boolean val) {
    isActive = val;
  }
  
  public boolean active() {
    return isActive;
  }
  
  public void setStroke(color c) {
    stroke = c;
  }
  
  public void setFill(color c) {
    fill = c;
  }
  
  public void setType(objects Type) {
    this.type = Type;
  }
  
  public objects getType() {
    return this.type;
  }
  
  // This is used to keep the user from drawing over the toolbar in NuPaint draw()
  public Object getObject() {
    return null; 
  }
  
  // This is used to keep the user from drawing over the toolbar in NuPaint draw()
  public boolean drawing() {
    return false; 
  }
  
  public boolean isInBounds(int x, int y, int maxX, int maxY) { return false; }
  
}
