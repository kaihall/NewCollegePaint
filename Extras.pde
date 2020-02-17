public class Extras{
  
  public Extras() {  }
  
  void pencilExtra(){
    basicColorTiles(0,true);
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
    
    
  }
  
  void selectExtra(){
    
    
  }
  
  void gridExtra() {
    
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
  
  public textButton(String text) {
    x1 = width*
  }
  
}
