// Greet

public class Title {

  String message = "Welcome to NCF Paint!";
  int textX = width/3;
  int textY = height/50;
  float alignX = width*0.375;
  
  
  // void makeTextBox(){
  
  void showTitle(){
    
    textSize(46);
    textAlign(int(alignX), TOP);
    fill(0,0,255);
    noStroke();
    noFill();
    rect(textX, textY, height/2,width/12);
    text(message, textX, textY);
  }
}
