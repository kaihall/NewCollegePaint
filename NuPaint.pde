// Items for drawing
ArrayList<Object> thingsToDraw; // Generic List that functions as a Grouped set of shapes
ArrayList<Object> tempDraw; //For temporary objects (ex. pencil drawing used for curve tool). Please clear after use.
ToolBox box;
ExtrasPanel panel;
ButtonDisplay display;
UI basicUI;
message welcomeMessage; // This is a welcome message for the user
ColorPicker colorPicker;

// Tools
Tool currentTool;
PencilTool pencilTool;
LineTool lineTool;
RectangleTool rectTool;
CircleTool circleTool;
CurveTool curveTool;
PolygonTool polygonTool;
TextTool textTool;
ImageTool imageTool;
GridTool gridTool;

// Global Variables
boolean gridMode;
boolean commentsMode;
int inputDelay;
ArrayList<objects> expandables;
colorSelectorButton colorSelBut;

void setup(){
  fullScreen();
  background(255);
  frameRate(-1); //cap framerate at 60 to keep the input delay from mucking up
  inputDelay = int(frameRate/5); //used in several tools to keep them from registering repeated user input.
  
  thingsToDraw = new ArrayList<Object>();
  tempDraw = new ArrayList<Object>();
  
  pencilTool = new PencilTool();
  lineTool = new LineTool();
  rectTool = new RectangleTool();
  circleTool = new CircleTool();
  curveTool = new CurveTool();
  polygonTool = new PolygonTool();
  textTool = new TextTool();
  imageTool = new ImageTool();
  gridTool = new GridTool();
  
  gridMode = false;
  commentsMode = true;
  
  currentTool = null; // Set to null so that the user can then select pencil. Setting this to pencil first means when the user selects pencil it doesn't do anything
  //circleTool.setActive(true);
  
  thingsToDraw.add(new Text(width/4, height/2, 46, color(0,0,255), Font.Fun, "Welcome to NuPaint!"));
  //welcomeMessage = new message(2, "Welcome to NuPaint!");
  display = new ButtonDisplay();
  panel = new ExtrasPanel();
  box = new ToolBox();
  basicUI = new UI(box, panel, display);
  
  // Items that can expand
  expandables = new ArrayList<objects>();
  expandables.add(objects.text); expandables.add(objects.ellipse); expandables.add(objects.polygon); expandables.add(objects.image);
  
  // Draw for the first time
  background(255);
  if (gridMode) gridTool.drawGrid();
  thingsToDraw.get(0).draw();
  
  // Global Variable for Coloring
  colorSelBut = new colorSelectorButton(0,0,0,0,0);
}


void draw(){
  inputDelay = (int)(frameRate/5); // This updates the real inputDelay Value
  
  // This means the user is not inside the toolbar area
  if (mouseX <= width*0.748 && currentTool != null) {
    
    // Draw the UI if it was hovered over 1 frame before
    if (basicUI.checkDrawStatus()) { 
      basicUI.lastDraw();
    }
    
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
  
    // Draw what the User is currently Doing if they aren't going out of bounds
    if (expandables.contains(currentTool.getType())) {
      Object working = currentTool.getObject();
      if (working != null) {
        if (!currentTool.drawing()) {
          currentTool.sketch(); 
        } else {
          if (currentTool.isInBounds(working.getX(), working.getY(), int(width*0.748), height)) {
            currentTool.sketch();
          }
        }
      } else {
        currentTool.sketch(); 
      }
    } else {
      currentTool.sketch(); 
    }
    
    // Draw the grid (if on)
    if (gridMode) {
      gridTool.drawGrid();
    }
  // This means the user is inside the toolbar area
  } else {
    basicUI.draw();
  }
  
  // Draw Welcome Message
  //welcomeMessage.draw();
}

// objects Type Options: {circle, square, pixel, rectangle, line, ellipse, triangle, curve, polygon, text}
void keyPressed() {
  if (currentTool != textTool){
    if (key == 'c') {
      circleTool.drawLastCircle();
    }
    
    else if (key == 'r') {
      rectTool.drawLastRectangle();
    }
    
    else if (key == '1') {
      switchTool(pencilTool, objects.pixel);
    }
    
    else if (key == '2') {
      switchTool(lineTool, objects.line);
    }
    
    else if (key == '3') {
      switchTool(curveTool, objects.curve);
    }
    
    else if (key == '4') {
      switchTool(rectTool, objects.rectangle);
    }
    
    else if (key == '5') {
      switchTool(circleTool, objects.ellipse);
    }
    
    else if (key == '6') {
      switchTool(polygonTool, objects.polygon);
    }
    
    else if (key == '7') {
      switchTool(textTool, objects.text);
    }
    
    else if (key == '8') {
      switchTool(imageTool, objects.image);
      imageTool.uploadImage();
    }
   
    else if (key == 'x') {
      println("Goodbye :)");
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

void switchTool(Tool t, objects type) {
  if (currentTool != null) currentTool.setActive(false);
  currentTool = t;
  t.setType(type);
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
  private Extras e = new Extras();
  
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
