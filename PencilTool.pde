// This class creates a simple pencil that colors in one pixel at a time when the mouse is pressed.

public class PencilTool extends Tool {
  //boolean isClicked = false;
  float xCoord = width*.8;
  float yCoord = height/12;
  float radiusX = width/12;
  float radiusY = height/6;
  public boolean PIXELMODE = false;
  boolean drawing;
  ArrayList<Integer> xPoints;
  ArrayList<Integer> yPoints;
  int[] args2;
  
  // NOTE: If there's time, come back and make it a little more smooth (append new points onto a curve instead of making a new one at the very end)
  
  public PencilTool(){
    super();
    args = new int[4];
    drawing = false;
    xPoints = new ArrayList<Integer>();
    yPoints = new ArrayList<Integer>();
  }  
  
  void sketch () {
    sketch(false, this.stroke);
  }
  
  void sketch(boolean comment, color stroke){
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
          tempDraw.add(of.createObject(objects.line,fill,stroke,args));
          args[0] = mouseX;
          args[1] = mouseY;
          xPoints.add(mouseX);
          yPoints.add(mouseY);
        }
     }
     
     else if (drawing) {
        xPoints.add(mouseX);
        yPoints.add(mouseY);
        drawing = false;
        tempDraw.clear();
         
        //read in the points
        args2 = new int[xPoints.size() + yPoints.size()];
         
        for (int i = 0; i < args2.length; i++) {
          if (i%2==0) args2[i] = xPoints.remove(0);
          else args2[i] = yPoints.remove(0);
        }
         
        xPoints.clear();
        yPoints.clear();
        
        if (comment) {
          comments.add(of.createObject(objects.scribble,fill,stroke,args2));
        }
        
        else {
          thingsToDraw.add(of.createObject(objects.scribble,fill,stroke,args2));
        }
     }
    } 
    
    else if (drawing) drawing = false;
  }
  
  public Object getObject() { return null; }
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
