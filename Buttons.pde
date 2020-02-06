import java.util.List;

public class Buttons {
  PImage pencil;
  PImage line;
  PImage polygon;
  PImage rect;
  PImage rotate;
  PImage save;
  PImage scale;
  PImage select;
  PImage circle;
  PImage curve;
  PImage group;
  
  float wid = width/12;
  float hite = height/6;
  

  void display(){
    
    pencil = loadImage("pencil.png");
    image(pencil, width*.75,height*1/2000, wid, hite);
    
    line = loadImage("line.png");
    image(line, width*.83, height*1/2000, wid, hite);
    
    polygon = loadImage("polygon.png");
    image(polygon, width*.92, height*1/2000, wid, hite);
    
    
    rect = loadImage("rect.png");
    image(rect, width*.75, height*.17, wid, hite);
    
    
    rotate = loadImage("rotate.png");
    image(rotate, width*.83, height*.17, wid, hite);
    
    
    save = loadImage("save.png");
    image(save, width*.92, height*.17, wid, hite);
    
    
    scale = loadImage("scale.png");
    image(scale, width*.746, height*1/3, wid, hite);
    
    
    select = loadImage("select.png");
    image(select, width*.83, height*1/3, wid, hite);
    
    
    circle = loadImage("circle.png");
    image(circle, width*.92, height*1/3, wid, hite);
    curve = loadImage("curve.png");
    group = loadImage("group.png");
    
}
}
