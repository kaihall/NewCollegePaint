// This class creates a simple pencil that colors in one pixel at a time when the mouse is pressed.

public class PencilTool extends Tool {
  //boolean isClicked = false;
  float xCoord = width*.8;
  float yCoord = height/12;
  float radiusX = width/12;
  float radiusY = height/6;
  public boolean PIXELMODE = false;
  boolean drawing;
  
  // Constructor should also take in RGB values so user can select colors from color selector
  
  public PencilTool(){
    super();
    args = new int[4];
    drawing = false;
  }  
  
  void sketch(){
    if(isActive){
      if(mouseX < width*.75 && mousePressed){
        if (PIXELMODE) {
          args[0] = mouseX;
          args[1] = mouseY;
          thingsToDraw.add(of.createObject(objects.pixel,fill,stroke,args));
        }
        
        else if (!drawing){
          args[0] = mouseX;
          args[1] = mouseY;
          drawing = true;
        }
        
        else {
          args[2] = mouseX;
          args[3] = mouseY;
          thingsToDraw.add(of.createObject(objects.line,fill,stroke,args));
          args[0] = mouseX;
          args[1] = mouseY;
        }
     }
     
     else if (drawing) drawing = false;
    } 
    
    else if (drawing) drawing = false;
  }
}


public class pixel extends Object {
  public pixel (int x, int y, color stroke) {
    super();
    this.x = x;
    this.y = y;
    this.Color = stroke;
    this.fill = stroke;
  }
  
  public void drawShape() {
    set(x,y,Color);
  }
}

public class scribble extends Object {
  ArrayList<Integer> xPoints;
  ArrayList<Integer> yPoints;
  
  public scribble(int[] args, color stroke) {
    super();
    
    Color = stroke;
    
    xPoints = new ArrayList<Integer>();
    yPoints =new ArrayList<Integer>();
    
    for (int i = 0; i < args.length; i++) {
      if (i%2 == 0) xPoints.add(args[i]);
      else yPoints.add(args[i]);
    }
  }
  
  public void drawShape(){
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
