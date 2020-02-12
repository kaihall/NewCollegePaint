public class HitBox{ 
  
  float xPos;
  float yPos;
  float wid;
  float hite;
  float radiusX;
  float radiusY;
  float xWidth;
  float yLength;
  
  HitBox(float x, float y, float Width, float Height, float xW, float yL){
    this.xPos = x;
    this.yPos = y;
    this.wid = Width;
    this.hite = Height;
    this.xWidth = xW;
    this.yLength = yL;
  }
  
  void makeHitBox(){
    
    this.xWidth = xW;
    this.yLength = yL;
    
      if(dist(mouseX, mouseY, xPos, yPos) < radiusX){
        if(dist(mouseX, mouseY, xPos, yPos) < radiusY/2){
          stroke(255,0,0);
          fill(0); // alpha value zero so transparent
          rect(xWidth, yLength, wid, hite);
        }
      }
    }
  }
