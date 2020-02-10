public class ExtrasPanel{
  
  private float wid = width/4;
  private float hite = height/2;
  private String title = "Extras Panel!";
  
  
  public ExtrasPanel(){}
 
  
  void show(){
    stroke(0);
    strokeWeight(3);
    rect(width*.749, height*.501, wid, hite);
    textSize(32);
    fill(0,0,255);
    text(title, width*.83, hite);
    fill(255);
   }
}
