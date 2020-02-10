// This class creates a simple pencil that colors in one pixel at a time when the mouse is pressed.

public class PencilTool extends Tool {
  //boolean isClicked = false;
  float xCoord = width*.8;
  float yCoord = height/12;
  float radiusX = width/12;
  float radiusY = height/6;
  
  // Constructor should also take in RGB values so user can select colors from color selector
  
  public PencilTool(){
    super();
  }  
  
  void sketch(){
    if(mousePressed){
      if(isActive){
        args = { mouseX, mouseY };
        thingsToDraw.add(of.createObject(objects.pixel,fill,stroke,args));
     }
    }
  }
}
