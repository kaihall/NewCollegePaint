public class ButtonThumbnails {
  
  
  PImage picture;
  float xPos, yPos;
  float wid, hite;
  
  public ButtonThumbnails(PImage Picture, float xCoord, float yCoord, float Wid, float Hite){
    
    this.picture = Picture;
    this.xPos = xCoord;
    this.yPos = yCoord;
    this.wid = Wid;
    this.hite = Hite;  
  }
  
  void show(){
    image(picture, xPos, yPos, wid, hite);
  }
}
