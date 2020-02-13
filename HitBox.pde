// Need to add mousePressed() method


public class HitBox{ 
  
  float xDistance;
  float yDistance;
  float radiusX;
  float radiusY;
  float xCoordRect;
  float yCoordRect;
  //boolean isClicked = false;
  
  public HitBox(float x, float y, float RadiusX, float RadiusY, float xCoord, float yCoord){
    this.xDistance = x;
    this.yDistance = y;
    this.radiusX = RadiusX;
    this.radiusY = RadiusY;
    this.xCoordRect = xCoord;
    this.yCoordRect = yCoord;
  }
  
  void makeHitBox(){
    //if(isClicked == true){
    if(dist(mouseX, mouseY, xDistance, yDistance) < radiusX){
      if(dist(mouseX, mouseY, xDistance, yDistance) < radiusY/2){
          stroke(255,0,0);
          fill(0,0,0,0); // alpha value zero so transparent
          rect(xCoordRect, yCoordRect, radiusX, radiusY);
        //}
    }
      }
    }
  }
