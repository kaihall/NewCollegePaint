public class PolygonTool extends Tool{
  
  int lastX;
  int lastY;
  int startX;
  int startY;
  int sinceLastClick;
  boolean drawing;
  Line working;
  ArrayList<Integer> xPoints;
  ArrayList<Integer> yPoints;
  
  public PolygonTool(){
    lastX = 0;
    lastY = 0;
    startX = -500;
    startY = 500;
    sinceLastClick = 0;
    drawing = false;
    working = null;
    xPoints = new ArrayList<Integer>();
    yPoints = new ArrayList<Integer>();
  }
   
   
  void sketch() {
    sinceLastClick++;
    if (isActive) {
      if (mouseX < width*.75 && mousePressed && sinceLastClick > 5) {
        sinceLastClick = 0;
        if (drawing) {
            if (dist(mouseX,mouseY,startX,startY) < 10) {
              drawing = false;
              tempDraw.clear();
              xPoints.add(startX);
              yPoints.add(startY);
              thingsToDraw.add(new Polygon(stroke,fill,xPoints,yPoints));
              xPoints.clear();
              yPoints.clear();
            } else {
              tempDraw.add(new Line(lastX, lastY, fill, stroke, mouseX, mouseY));
              working.setX(mouseX);
              working.setY(mouseY);
              xPoints.add(mouseX);
              yPoints.add(mouseY);
              lastX = mouseX;
              lastY = mouseY;
            }
        }
        else {
          drawing = true;
          working = new Line(mouseX, mouseY, fill, stroke, mouseX, mouseY);
          tempDraw.add(working);
          xPoints.add(mouseX);
          yPoints.add(mouseY);
          startX = mouseX;
          startY = mouseY;
          lastX = mouseX;
          lastY = mouseY;
        }
      }
    }
    
    if (!isActive && drawing) {
      drawing = false;
      thingsToDraw.remove(working);
    }
    else if (drawing) {
      working.setEndX(mouseX);
      working.setEndY(mouseY);
    }
  }
}

public class Polygon extends Object {
  color stroke;
  color fill;
  ArrayList<Integer> xPoints;
  ArrayList<Integer> yPoints;
  
  public Polygon(color stroke, color fill, ArrayList<Integer> xCoords, ArrayList<Integer> yCoords) {
    this.stroke = stroke;
    this.fill = fill;
    this.xPoints = new ArrayList<Integer>(xCoords);
    this.yPoints = new ArrayList<Integer>(yCoords);
  }
  
  public void draw() {
    prepColor();
    noFill();
    beginShape();
    vertex(xPoints.get(0),yPoints.get(0));
    for (int i = 0; i < min(xPoints.size(),yPoints.size()); i++) {
      vertex(xPoints.get(i),yPoints.get(i));
    }
    vertex(xPoints.get(xPoints.size()-1), yPoints.get(yPoints.size()-1));
    endShape();
  }
}
