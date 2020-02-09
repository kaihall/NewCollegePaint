// This class creates a simple pencil that colors in one pixel at a time when the mouse is pressed.

public class PencilTool {
  boolean isClicked = false;
  float xCoord = width*.8;
  float yCoord = height/12;
  float radiusX = width/12;
  float radiusY = height/6;
  
  // Constructor should also take in RGB values so user can select colors from color selector
  
  public PencilTool(){}  
  
  void sketch(){
    if(mousePressed){
      if(isClicked == true){
        rectMode(CENTER);
        fill(0,0,0);
        stroke(2);
        rect(mouseX, mouseY, 2, 2);
     }
    }
  }
  
  void mousePressed(){
    if(dist(mouseX,mouseY,xCoord,yCoord) < radiusX){
      isClicked = true;
    }  
  }
}
