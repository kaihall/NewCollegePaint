public class HitBox{ 
  
  float xPos;
  float yPos;
  float wid;
  float hite;
  
  HitBox(float x, float y, float Width, float Height){
    this.xPos = x;
    this.yPos = y;
    this.wid = Width;
    this.hite = Height;
  }
  
  void makeHitBox(){
    
    if(mousePressed){
      if(dist(mouseX, mouseY,(xPos+wid)/2,(yPos+hite/2))<wid){
        if(dist(mouseX, mouseY, (xPos+wid)/2,(yPos+hite/2))<hite){
          stroke(255,0,0);
          fill(0,0,0,0); // alpha value zero so transparent
          rect(xPos, yPos, wid, hite);
        }
      }
    }
  }
}
