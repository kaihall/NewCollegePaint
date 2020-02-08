// The right side panel

public class ToolArea {
  
  void display(){
    fill(255,255,255);
    stroke(0,0,0);
    strokeWeight(4);
    rectMode(CENTER);
    rect(width*(0.875), 0, width/4, height*2);
    line(width*(0.75), height/2, width, height/2);
   }
}
