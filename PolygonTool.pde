public class PolygonTool extends Tool {
  boolean drawing;
  polygon working;
  int sinceLastClick;
  int startX, startY;
  int sides;
  
  public PolygonTool(){
    super();
    drawing = false;
    working = null;
    sinceLastClick = 0;
    startX = 0;
    startY = 0;
    sides = 5;
  }  
  
  void draw() {}
  
  void sketch(){
    sinceLastClick++;
    if (mouseX < width*.75 && mousePressed && sinceLastClick > inputDelay) {
      sinceLastClick = 0;
      if (isActive) {
        if (drawing) {
          drawing = false;
        }
        else {
          drawing = true;
          working = new polygon(mouseX, mouseY, fill, stroke, sides, 2);
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
      working.setRadius(abs(mouseX-startX)+abs(mouseY-startY));
    }
  }
  
  public void cleanUp() {
    if (drawing) {
      drawing = false;
      thingsToDraw.remove(working);
    }
  }
  
  public void setSides(int n) {
    sides = max(n,3);
    sides = min(sides,12);
  }
  
  public Object getObject() { return working; }
  public boolean drawing() { return drawing; }
  public boolean isInBounds(int x, int y, int MaxX, int MaxY) {
    return (x + abs(x-mouseX) + abs(y-mouseY) <= MaxX);
  }
}



public class polygon extends Object{
  
  int sides;
  int radius;
  
  public polygon(int x, int y, color fill, color stroke, int sides, int radius) {
    this.x = x;
    this.y = y;
    this.Color = stroke;
    this.fill = fill;
    this.sides = sides;
    this.radius = radius;
  }
  
  //Found on Processing's website, thanks Processing
  public void drawShape() {
    minX = MAX_INT;
    minY = MAX_INT;
    maxX = MIN_INT;
    maxY = MIN_INT;
        
    prepColor();
    float angle = TWO_PI / sides;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
      minX = (int)min(minX,sx);
      minY = (int)min(minY,sy);
      maxX = (int)max(maxX,sx);
      maxY = (int)max(maxY,sy);
    }
    endShape(CLOSE);
  }
  
  public void setRadius(int r) {
    radius = r;
  }
  
  public Object duplicate() {
    int newX = maxX()+20 >= width*0.75 ? 0 : x+20;
    int newY = maxX()+20 >= width*0.75 ? 0 : y+20;
    return new polygon(newX, newY, fill, Color, sides, radius);
  }
}
