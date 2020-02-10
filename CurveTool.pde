public class CurveTool extends Tool {
  ArrayList<Integer> xPoints;
  ArrayList<Integer> yPoints;
  boolean drawing;
  int tightness;
  int[] args2;
  
  public CurveTool(){
    super();
    args = new int[2];
    xPoints = new ArrayList<Integer>();
    yPoints = new ArrayList<Integer>();
    drawing = false;
    tightness = 2;
  }  
  
  void sketch(){
    if(isActive){
      if(mouseX < width*.75 && mousePressed){
        drawing = true;
        args[0] = mouseX;
        args[1] = mouseY;
        xPoints.add(mouseX);
        yPoints.add(mouseY);
        tempDraw.add(of.createObject(objects.pixel,fill,stroke,args));
     } 
     
     else if (drawing) {
       drawing = false;
       tempDraw.clear();
       
       if (xPoints.size() <= tightness) {
         args2 = new int[xPoints.size() + yPoints.size()];
         for (int i = 0; i < xPoints.size() + yPoints.size(); i++) {
           if (i%2==0) args2[i] = xPoints.remove(0);
           else args2[i] = yPoints.remove(0);
         }
       }
       else {
         int size = (xPoints.size() + yPoints.size()) / tightness;
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
       
       xPoints.clear();
       yPoints.clear();
       
       thingsToDraw.add(of.createObject(objects.curve,fill,stroke,args2));
     }
    }
  }
}
