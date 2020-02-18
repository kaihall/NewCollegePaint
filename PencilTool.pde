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
  
  public void cleanUp() {
    drawing = false;
    xPoints.clear();
    yPoints.clear();
    tempDraw.clear();
  }
}


public class pixel extends Object {
  public pixel (int x, int y, color stroke) {
    super();
    this.x = x;
    this.y = y;
    this.Color = stroke;
    this.fill = stroke;
    
    minX = x;
    minY = y;
    maxX = x;
    maxY = y;
  }
  
  public Object duplicate() {
    return new pixel(x+1,y+1,Color);
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
    yPoints = new ArrayList<Integer>();
    
    for (int i = 0; i < args.length; i++) {
      if (i%2 == 0) {
        xPoints.add(args[i]);
        minX = min(minX, args[i]);
        maxX = max(maxX, args[i]);
      }
      else {
        yPoints.add(args[i]);
        minY = min(minY, args[i]);
        maxY = max(maxY, args[i]);
      }
    }
  }
  
  public scribble(ArrayList<Integer> xPoints, ArrayList<Integer> yPoints, color stroke) {
    super();
    
    Color = stroke;
    
    this.xPoints = new ArrayList<Integer>(xPoints);
    this.yPoints = new ArrayList<Integer>(yPoints);
    
    minX = MAX_INT;
    minY = MAX_INT;
    maxX = MIN_INT;
    maxY = MIN_INT;
    
    for (int x : xPoints) {
      minX = min(minX,x);
      maxX = max(maxX,x);
    }
    
    for (int y : yPoints) {
      minY = min(minY,y);
      maxY = max(maxY,y);
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
  
  public Object duplicate() {
    int newX = maxX()+20 >= width*0.75 ? 0 : 20;
    int newY = maxX()+20 >= width*0.75 ? 0 : 20;
    
    ArrayList<Integer> newXPoints = new ArrayList<Integer>(xPoints);
    ArrayList<Integer> newYPoints = new ArrayList<Integer>(yPoints);
    
    for (int i = 0; i < newXPoints.size(); i++) {
      newXPoints.set(i,newXPoints.get(i)+newX);
      newYPoints.set(i,newYPoints.get(i)+newY);
    }
    
    return new scribble(newXPoints, newYPoints, Color);
  }
}
