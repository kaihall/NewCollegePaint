import java.util.LinkedList;

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
    
    // Make coordinates start from the #center# of the images
    imageMode(CENTER);
    
    pencil = loadImage("pencil.png");
    image(pencil, width*.8,height/12, wid, hite);
    ToolTip pencil = new ToolTip("Pencil tool!", width*.8, height/12, wid, hite);
    pencil.makeText();
    
    line = loadImage("line.png");
    image(line, width*.875, height*1/12, wid, hite);
    ToolTip line = new ToolTip("Line tool!", width*.875, height*1/12, wid*.7, hite);
    line.makeText();
    
    curve = loadImage("curve.png");
    image(curve, width*.95, height*1/12, wid, hite);
    ToolTip curve = new ToolTip("Curve tool!", width*.95, height*1/12, wid*.7, hite);
    curve.makeText();   
    
    rect = loadImage("rect.png");
    image(rect, width*.8, height/4, wid, hite);
    ToolTip rect = new ToolTip("Rectangle tool!", width*.8, height/4, wid, hite);
    rect.makeText(); 
    
    circle = loadImage("circle.png");
    image(circle, width*.875, height/4, wid, hite);
    ToolTip circle = new ToolTip("Circle tool!", width*.875, height/4, wid, hite);
    circle.makeText();
    
    polygon = loadImage("polygon.png");
    image(polygon, width*.95, height*.24, wid, hite);
    ToolTip polygon = new ToolTip("Polygon tool!", width*.95, height*.24, wid, hite);
    polygon.makeText();
    
    select = loadImage("select.png");
    image(select, width*.8, height*.4, wid, hite);
    ToolTip select = new ToolTip("Select tool!", width*.875, height*.4, wid, hite);
    select.makeText();
    
    scale = loadImage("scale.png");
    image(scale, width*.875, height*.4, wid, hite);
    ToolTip scale = new ToolTip("Scale tool!", width*.8, height*.4, wid, hite);
    scale.makeText();
    
    save = loadImage("save.png");
    image(save, width*.95, height*.4, wid, hite);
    ToolTip save = new ToolTip("Save tool!", width*.95, height*.4, wid, hite);
    save.makeText();
    
    group = loadImage("group.png");
    
  }
}
