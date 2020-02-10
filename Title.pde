// The title page for NuPaint!

public class Title {
  PFont title = createFont("COMIC.TTF", 46);
  String message = "Welcome to NuPaint!";
  int textX = width/3;
  int textY = height/50;
  float alignX = width*0.375;
  
  
  // void makeTextBox(){
  
  void showTitle(){ 
    textSize(46);
    textFont(title);
    textAlign(int(alignX), TOP);
    fill(0,0,255);
    noStroke();
    noFill();
    rect(textX, textY, height/2,width/12);
    text(message, textX, textY);
  }
}
