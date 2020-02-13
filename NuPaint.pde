// Items for drawing
ArrayList<Object> thingsToDraw; // Generic List that functions as a Grouped set of shapes
ArrayList<Object> tempDraw; //For temporary objects (ex. pencil drawing used for curve tool). Please clear after use.
ToolBox box;
ExtrasPanel panel;
ButtonDisplay display;
UI basicUI;
message welcomeMessage; // This is a welcome message for the user

// Tools
Tool currentTool;
PencilTool pencilTool;
LineTool lineTool;
RectangleTool rectTool;
CircleTool circleTool;
CurveTool curveTool;
PolygonTool polygonTool;
TextTool textTool;

// Global Variables
boolean gridMode;
boolean commentsMode;
int inputDelay;

void setup(){
  fullScreen();
  background(255);
  frameRate(-1); // uncaps FPS
  
  thingsToDraw = new ArrayList<Object>();
  tempDraw = new ArrayList<Object>();
  
  pencilTool = new PencilTool();
  lineTool = new LineTool();
  rectTool = new RectangleTool();
  circleTool = new CircleTool();
  curveTool = new CurveTool();
  polygonTool = new PolygonTool();
  textTool = new TextTool();
  
  gridMode = false;
  commentsMode = true;
  
  inputDelay = int(frameRate/10); // This is currently unused
  
  currentTool = pencilTool;
  //circleTool.setActive(true);
  
  // thingsToDraw.add(new Text(width/4, height/2, 46, color(0,0,255), Font.Fun, "Welcome to NuPaint!"));
  welcomeMessage = new message(2, "WELCOME");
  display = new ButtonDisplay();
  panel = new ExtrasPanel();
  box = new ToolBox();
  basicUI = new UI(box, panel, display);
}


void draw(){
  // THis means the user is not inside the toolbar area
  if (mouseX <= width*0.748) {
    if (basicUI.checkDrawStatus()) { 
      basicUI.lastDraw();
    }
    //background(255); //Added to make the canvas reset
    noStroke();
    fill(255,255,255); // This covers the canvas
    rect(0, 0, width*0.748, height);
    if (thingsToDraw != null) {
      for (Object o : thingsToDraw) {
        o.draw();
      }
      for (Object o : tempDraw) {
        o.draw();
      }
    }
    currentTool.sketch();
  } else {
    basicUI.draw();
  }
  welcomeMessage.draw();
}

void keyPressed() {
  if (currentTool != textTool){
    if (key == 'c') {
      circleTool.drawLastCircle();
    }
    
    else if (key == 'r') {
      rectTool.drawLastRectangle();
    }
    
    else if (key == '1') {
      switchTool(pencilTool);
    }
    
    else if (key == '2') {
      switchTool(lineTool);
    }
    
    else if (key == '3') {
      switchTool(curveTool);
    }
    
    else if (key == '4') {
      switchTool(rectTool);
    }
    
    else if (key == '5') {
      switchTool(circleTool);
    }
    
    else if (key == '6') {
      switchTool(polygonTool);
    }
    
    else if (key == '7') {
      switchTool(textTool);
    }
   
    else if (key == 'x') {
      exit(); 
    }
  }
  
  else if (key == CODED && keyCode == SHIFT) {
    textTool.shiftPressed(true);
  }
}

void keyReleased() {
  if (currentTool == textTool && key == CODED && keyCode == SHIFT)
    textTool.shiftPressed(false);
}

void switchTool(Tool t) {
  currentTool.setActive(false);
  currentTool = t;
  t.setActive(true);
}

class message {
  int messageDuration;
  String text;
  long timeCreated;
  
  message(int time, String Message) {
    messageDuration = time;
    text = Message;
    timeCreated = System.nanoTime();
  }
  
  void draw() {
    long curTime = System.nanoTime();
    int timeRunning = (int)((curTime - timeCreated) / 1000000000.0f);
    if (timeRunning < messageDuration) {
      Object item = new Text(width/4, height/2, 46, color(0,0,255), Font.Fun, text);
      item.draw();
    }
  }
  
  // thingsToDraw.add(new Text(width/4, height/2, 46, color(0,0,255), Font.Fun, "Welcome to NuPaint!"));
  
}

class UI {
  boolean wasJustDrawn; // This is a boolean to show if this was drawn the previous frame
  ToolBox box;
  ExtrasPanel panel;
  ButtonDisplay display;
  
  UI(ToolBox boxItem, ExtrasPanel Panel, ButtonDisplay Display) {
    wasJustDrawn = true;
    box = boxItem;
    panel = Panel;
    display = Display;
  }
  
  void draw() {
    wasJustDrawn = true;
    box.show();
    panel.show();
    display.displayButton();
  } 
  
  public boolean checkDrawStatus() {
    boolean retVal = wasJustDrawn;
    wasJustDrawn = false;
    return retVal;
  }
  
  void lastDraw() {
    box.show();
    panel.show();
    display.displayButton();    
  }
}
