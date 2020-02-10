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
    sinceLastRead = tightness;
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
       
       /*
        * BROKEN - was too complicated for me to figure out what I was doing wrong
        *
       //if there arent't enough points to construct a curve of the specified tightness, just use the end points
       if (xPoints.size() <= tightness) {
         args2 = new int[xPoints.size() + yPoints.size()];
         for (int i = 0; i < xPoints.size() + yPoints.size(); i++) {
           if (i%2==0) args2[i] = xPoints.remove(0);
           else args2[i] = yPoints.remove(0);
         }
       }
       else 
         int size = (xPoints.size() + yPoints.size());
         args2 = new int[size];
         for (int i = 0; i < size; i++) {
           if ((i/2)%tightness == 0 || i >= size-2) {
             if (i%2==0) args2[i] = xPoints.remove(0);
             else {
               args2[i] = yPoints.remove(0);
               println(args2[i-1] + ", " + args2[i]);
             }
           }
           else {
             if (i%2==0) xPoints.remove(0);
             else yPoints.remove(0);
           }
         }
       }
       */
       
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
