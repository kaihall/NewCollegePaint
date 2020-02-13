
public class CurveTool extends Tool {
  ArrayList<Integer> xPoints;
  ArrayList<Integer> yPoints;
  boolean drawing;
  int tightness;
  int[] args2;
  int sinceLastRead;
  
  public CurveTool(){
    super();
    args = new int[2];
    xPoints = new ArrayList<Integer>();
    yPoints = new ArrayList<Integer>();
    drawing = false;
    tightness = 4;
    sinceLastRead = 4;
  }  
  
  void sketch(){
    if(isActive){
      sinceLastRead++;
      if(mouseX < width*.75 && mousePressed){
        drawing = true;
        args[0] = mouseX;
        args[1] = mouseY;
        tempDraw.add(of.createObject(objects.pixel,fill,stroke,args));
        if(sinceLastRead >= tightness) {
          sinceLastRead = 0;
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
       
        thingsToDraw.add(of.createObject(objects.curve,fill,stroke,args2));
      }
     
     
    }
  }
}

public class curve extends Object {
  ArrayList<Integer> xPoints;
  ArrayList<Integer> yPoints;
  
  public curve(int[] args, color stroke) {
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
