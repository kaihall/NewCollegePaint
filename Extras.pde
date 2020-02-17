public class Extras{
  
  public Extras() {  }
  
  void pencilExtra(){
    basicColorTiles(0,true);
    
    imageButton pixel = new imageButton("data/pencilPixel.png", width*0.75 + width/12 - 5, height*0.65);
    imageButton scribble = new imageButton("data/pencilScribble.png", width*0.75 + width/8 + 5, height*0.65);
    
    pixel.draw();
    scribble.draw();
    
    if (pixel.isClicked()) pencilTool.PIXELMODE = true;
    if (scribble.isClicked()) pencilTool.PIXELMODE = false;
  }
  
  void lineExtra(){
    basicColorTiles(0,true);
    
    /*
    textSize(width/39);
    text("Line Maker!", width*.835, height*.62);
    fill(0,0,255,20);
    rect(width*.79, height*.7, width/15, width/60);
    rect(width*.79, height*.7+width/68, width/15, width/60);
    rect(width*.79+width/10, height*.7, width/15, width/60);
    rect(width*.79+width/10, height*.7+width/68, width/15, width/60);
    
    textSize(20);
    fill(0);
    text("X1", width*.77, height*.7);
    text("X2", width*.77, height*.73);
    text("Y1", width*.87, height*.7);
    text("Y2", width*.87, height*.73);
    
    fill(255,0,0,0);
    rect(width*.834, height*.78, width/13, width/60);
    fill(0);
    text("Make this line!", width*.837, height*.78);
    */
  }
  void curveExtra(){
    basicColorTiles(0,true);    
  }
  
  void rectangleExtra(){
    fill(0);
    textSize(width/64);
    text("Outline", width*.835, height*.55);
    basicColorTiles(height/22,true);
    
    fill(0);
    textSize(width/64);
    text("Fill", width*.85, height*.65);
    basicColorTiles(height/7,false);
    
    fill(0);
    textSize(width/60);
    text("Press 'R' to draw a rectangle!", width*.76, height*.85);
  }
  
  void circleExtra(){
    fill(0);
    textSize(width/64);
    text("Outline", width*.835, height*.55);
    basicColorTiles(height/22,true);
    
    fill(0);
    textSize(width/64);
    text("Fill", width*.85, height*.65);
    basicColorTiles(height/7,false);
    
    fill(0);
    textSize(width/60);
    text("Press 'C' to draw a circle!", width*.76, height*.85);
    
  }
  
  void polygonExtra(){
    fill(0);
    textSize(width/64);
    text("Outline", width*.835, height*.55);
    basicColorTiles(height/22,true);
    
    fill(0);
    textSize(width/64);
    text("Fill", width*.85, height*.65);
    basicColorTiles(height/7,false);
    
    fill(0);
    textSize(width/64);
    text("Sides:", width*.76, height*.75);
    fill(0,0,255,20);
    rectMode(CORNER);
    rect(width*.81, height*.75, height/22, height/22);
    fill(0);
    text(String.valueOf(polygonTool.sides), width*.815, height*.751);
    button inc = new incrementButton(width*.835, height*0.75, height/22, height/44, color(0,0,255,20), true);
    button dec = new incrementButton(width*.835, height*0.774, height/22, height/44, color(0,0,255,20), false);
    inc.draw();
    dec.draw();
    if (inc.isClicked()) polygonTool.setSides(polygonTool.sides+1);
    if (dec.isClicked()) polygonTool.setSides(polygonTool.sides-1);
  }
  
  void textExtra(){
    basicColorTiles(0,false);

    ArrayList<fontButton> fontButtons = new ArrayList<fontButton>();
    fontButtons.add(new fontButton(width*.8, height*.65, height/22, height/22, color(255), Font.SansSerif));
    fontButtons.add(new fontButton(width*.8+(height/22)+10, height*.65, height/22, height/22, color(255), Font.Serif));
    fontButtons.add(new fontButton(width*.8+(height/11)+20, height*.65, height/22, height/22, color(255), Font.Fun));
    fontButtons.add(new fontButton(width*.8+(3*height/22)+30, height*.65, height/22, height/22, color(255), Font.Cursive));
    
    for (fontButton b : fontButtons) {
      b.draw();
      if (b.isClicked()) textTool.setFont(b.getFont());
    }
  }
  
  void imageExtra(){
    textButton b = new textButton("Load Image", height*0.75);
    b.draw();
    if (b.isClicked()) imageTool.uploadImage();
  }
  
  /*****************************************/
  /*****************DO THIS*****************/
  /*****************************************/
  void selectExtra(){
    
    
  }
  /*****************************************/
  /*****************************************/
  /*****************************************/
  
  void commentsExtra() {
    basicColorTiles(0,true);
    
    imageButton pencil = new imageButton("data/pencil.png", width*0.75 + width/12 - 5, height*0.65);
    imageButton text = new imageButton("data/text.png", width*0.75 + width/8 + 5, height*0.65);
    textButton cm = new textButton("Toggle Comments Mode", height*0.75);
    
    pencil.draw();
    text.draw();
    cm.draw();
    
    if (pencil.isClicked()) commentsTool.setTool(CommentsToolMode.Pencil);
    if (text.isClicked()) commentsTool.setTool(CommentsToolMode.Text);
    if (cm.isClicked()) {
      if (commentsMode) commentsMode = false;
      else commentsMode = true;
      
      // White out the canvas
      noStroke();
      fill(255,255,255); // This covers the canvas
      rect(0, 0, width*0.748, height);
      
      // Draw all previous Objects to the canvas
      if (thingsToDraw != null) {
        for (Object o : thingsToDraw) {
          o.draw();
        }
      }
      if (tempDraw != null) {
        for (Object o : tempDraw) {
          o.draw();
        }
      }
      
      // Draw comments (if on)
      if (commentsMode) {
        for (Object o : comments) {
          o.draw();
        }
      }
      
      // Draw the grid (if on)
      if (gridMode) {
        gridTool.drawGrid();
      }
    }
  }
  
  void gridExtra() {
    textButton b = new textButton("Toggle Grid Mode", height*0.75);
    b.draw();
    if (b.isClicked()) {
      if (gridMode) gridMode = false;
      else gridMode = true;
      
      // White out the canvas
      noStroke();
      fill(255,255,255); // This covers the canvas
      rect(0, 0, width*0.748, height);
      
      // Draw all previous Objects to the canvas
      if (thingsToDraw != null) {
        for (Object o : thingsToDraw) {
          o.draw();
        }
      }
      if (tempDraw != null) {
        for (Object o : tempDraw) {
          o.draw();
        }
      }
      
      // Draw comments (if on)
      if (commentsMode) {
        for (Object o : comments) {
          o.draw();
        }
      }
      
      // Draw the grid (if on)
      if (gridMode) {
        gridTool.drawGrid();
      }
    }
  }
  
  void fileExtra() {
    textButton proj = new textButton("Save as Project", height*0.65);
    textButton img = new textButton("Save as Image", height*0.75);
    textButton load = new textButton("Load Project", height*0.85);
    
    proj.draw();
    img.draw();
    load.draw();
    
    if (proj.isClicked()) fileTool.save(SaveType.Project);
    if (img.isClicked()) fileTool.save(SaveType.Image);
    if (load.isClicked()) fileTool.load();
  }
  
  void printExtra() {
    textButton b = new textButton("Print Drawing", height*0.75);
    b.draw();
    if (b.isClicked()) printTool.print();
  }
  
  void uploadExtra() {
    textButton b = new textButton("Upload Drawing", height*0.75);
    b.draw();
    if (b.isClicked()) uploadTool.upload();
  }
  
  void basicColorTiles(int yOffset, boolean stroke) {
    ArrayList<button> listOfButtons = new ArrayList<button>();
    //fill(255,0,0);
    listOfButtons.add(new button((width*3/4)+10,            height*.55 + yOffset, width/40, width/40, color(255, 0, 0)));
    //fill(255,165,0);
    listOfButtons.add(new button((width*3/4+width/40)+10,   height*.55 + yOffset, width/40, width/40, color(255, 165, 0)));
    //fill(255,255,0);
    listOfButtons.add(new button(width*3/4+width/20+10,     height*.55 + yOffset, width/40, width/40, color (255, 255, 0)));
    //fill(0,255,0);
    listOfButtons.add(new button(width*3/4+width*.075+10,   height*.55 + yOffset, width/40, width/40, color(0, 255, 0)));
    //fill(0,0,255);
    listOfButtons.add(new button(width*3/4+width/10+10,     height*.55 + yOffset, width/40, width/40, color(0, 0, 255)));
    //fill(128,0,128);
    listOfButtons.add(new button(width*3/4+width*.125+10,   height*.55 + yOffset, width/40, width/40, color(128,0,128)));
    //fill(0);
    listOfButtons.add(new button(width*3/4+width*.15+10,    height*.55 + yOffset, width/40, width/40, color(0, 0, 0)));
    stroke(0);
    //fill(255, 0, 0, 0);
    //listOfButtons.add(new button(width*3/4+width*.175,   height*.55 + yOffset, width/40, width/40, color(255, 0, 0)));
    //text("*", width*3/4+width*.1835, height*.555 + yOffset); 
    colorSelBut.setX(width*3/4+width*.1835);
    colorSelBut.setY(height*.555 + yOffset);
    listOfButtons.add(colorSelBut);
    
    
    for (button b : listOfButtons) {
      if (b.isClicked()) b.setColor(stroke);
      b.draw();
    }
  }
}

public class button {
  color c;
  float x1,x2,y1,y2;
  boolean selected = false;
  
  button(float X1,float Y1, float X2, float Y2, color C) {
    c=C;
    x1=X1;
    y1=Y1;
    x2=X2;
    y2=Y2;
  }
  
  void draw() {
    fill(c);
    rect(x1,y1,x2,y2);
  }
  
  void setColor(boolean stroke) { 
    if (stroke) currentTool.setStroke(c); 
    else currentTool.setFill(c);
  }
  
  boolean isClicked() {
    if ((mouseX >= x1) && (mouseX <= (x1 + x2)) && mousePressed) {
      if (mouseY >= y1 && mouseY <= (y1+y2)) {
        selected = true;
        return true; 
      }
    }
    selected = false;
    return false;
  }
}



public class colorSelectorButton extends button {
  ColorPicker cp = new ColorPicker(width-width/4+width/300, height/2 + height/300, width/4, height/3, 0);
  boolean drawCP = false;
  int sinceLastPress=0;
  
  colorSelectorButton(float X1,float Y1, float X2, float Y2, color C) {
    super(X1, Y1, X2, Y2, C);
    this.x1 = x1-width/128;
    this.y1 = y1-height/216;
    this.x2 = width/38.4;
    this.y2 = height/22.5;
  }
  
  void setColor() {
    if (!drawCP) {
      drawCP = true;
      sinceLastPress=0;
    } else {
      if (cp.checkState() && sinceLastPress > inputDelay) {
        c = cp.getColor();
        currentTool.setStroke(c);
        sinceLastPress=0;
        drawCP = false;
      }
    }
  }
  
  public void draw() {
    sinceLastPress++;
    fill(255);  
    rect(x1, y1, x2, y2);
    fill(c);
    textSize(width/40);
    text("*", x1+width/128, y1+height/540);
    if (drawCP) {
      setColor();
      fill(0);
      rectMode(CORNER);
      rect(width-width/4, height/2 + height/300, width/4, height/3);
      cp.draw();
    }
  }
  
  public void setX(float x) { this.x1 = x-width/128; }
  public void setY(float y) { this.y1 = y-height/216; }
  
    boolean isClicked() {
    if ((mouseX >= x1) && (mouseX <= (x1 + x2)) && mousePressed && sinceLastPress > inputDelay) {
      if (mouseY >= y1 && mouseY <= (y1+y2)) {
        selected = true;
        return true; 
      }
    }
    selected = false;
    return false;
  }
}


public class incrementButton extends button{
  
  boolean increase;
  
  public incrementButton(float X1,float Y1, float X2, float Y2, color C, boolean increase) {
    super(X1, Y1, X2, Y2, C);
    this.increase = increase;
  }
  
  public void draw() {
    stroke(0);
    fill(c);
    rect(x1, y1, x2, y2);
    fill(0);
    textSize(10);
    textFont(createFont("Arial.ttf",20));
    
    char display = (increase) ? '+' : '-';
    
    text(display, x1 + 20, y1);
  }
}


public class fontButton extends button{
  
  Font f;
  String fontName;
  
  public fontButton(float X1,float Y1, float X2, float Y2, color C, Font f) {
    super(X1, Y1, X2, Y2, C);
    this.f = f;
    
    switch (f) {
      case Serif:
        fontName = "TimesNewRoman.ttf";
        break;
      case Fun:
        fontName = "COMIC.TTF";
        break;
      case Cursive:
        fontName = "MrsSaintDelafield.ttf";
        break;
      default:
        fontName = "Arial.ttf";
        break;
    }
  }
  
  public void draw() {
    stroke(0);
    fill(c);
    rect(x1, y1, x2, y2);
    fill(0);
    textSize(25);
    textFont(createFont(fontName,25));
    text("Aa", x1 + 10, y1 + 10);
  }
  
  public Font getFont() {return f;}
}



public class textButton extends button {
  
  String label;
  
  public textButton(String text, float y) {
    super(0,0,0,0,color(255));
    x1 = width*0.8;
    x2 = width - width*0.75 - width*0.1;
    y1 = y;
    y2 = 30;
    label = text;
  }
  
  public void draw() {
    //textMode(CENTER);
    textAlign(CENTER);
    fill(255);
    stroke(0);
    rect(x1,y1-7,x2,y2);
    fill(0);
    textSize(25);
    textFont(createFont("Arial.ttf",25));
    text(label, x1 + x2/2, y1 + y2/2);
    rectMode(CORNER);
    //textMode(CORNER);
    textAlign(int(width*.375), TOP);
  }
}



public class imageButton extends button {
  
  PImage img;
  
  public imageButton(String file, float x, float y) {
    super(x,y,x,y,color(0));
    img = loadImage(file);
    x1 = x;
    y1 = y;
    x2 = width/24;
    y2 = height/20;
  }
  
  public void draw() {
    image(img,x1,y1,x2,y2);
    noFill();
    stroke(0);
    rect(x1,y1,x2,y2);
  }
  
}
