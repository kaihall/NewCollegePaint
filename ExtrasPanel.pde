public class ExtrasPanel{
  
  private float wid = width/4;
  private float hite = height/2;
  private String title = "Extras Panel!";
  float alignX = width*0.375;
  PFont font = createFont("COMIC.TTF",32);
  
  
  public ExtrasPanel(){}
 
  
  void show(){
    stroke(0);
    strokeWeight(3);
    rect(width*.749, height*.501, wid, hite);
    textFont(font);
    textAlign(int(alignX), TOP);
    fill(0,0,255);
    text(title, width*.83, hite);
    fill(255);
   }
}
