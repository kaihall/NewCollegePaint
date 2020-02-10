public abstract class Tool {
  boolean isActive;
  objectFactory of;
  color stroke;
  color fill;
  int[] args;
  
  public Tool() {
    isActive = false;
    of = new objectFactory();
    stroke = color(0);
    fill = color(0);
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
  
  
}
