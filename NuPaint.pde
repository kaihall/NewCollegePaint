ArrayList<Object> thingsToDraw; // Generic List that functions as a Grouped set of shapes
ArrayList<Object> tempDraw; //For temporary objects (ex. pencil drawing used for curve tool). Please clear after use.
Tool currentTool;
PencilTool pencilTool;
LineTool lineTool;
RectangleTool rectTool;
CircleTool circleTool;
CurveTool curveTool;
PolygonTool polygonTool;

void setup(){
  fullScreen();
  background(255);
  frameRate(30);
  
  thingsToDraw = new ArrayList<Object>();
  tempDraw = new ArrayList<Object>();
  
  pencilTool = new PencilTool();
  lineTool = new LineTool();
  rectTool = new RectangleTool();
  circleTool = new CircleTool();
  curveTool = new CurveTool();
  polygonTool = new PolygonTool();
  
  currentTool = pencilTool;
  //circleTool.setActive(true);
}

void draw(){
  background(255); //Added to make the canvas reset
  
  if (thingsToDraw != null) {
    for (Object o : thingsToDraw) {
      o.draw();
    }
    for (Object o : tempDraw) {
      o.draw();
    }
  }
  
  // Too lazy to make global
  ToolBox box = new ToolBox();
  box.show();
  //HitBox hitbox = new HitBox(width*3/4, 0, width/12, height/10);
  //hitbox.display();
  ExtrasPanel panel = new ExtrasPanel();
  panel.show();
  //ButtonBoxes button = new ButtonBoxes();
  Title greeting = new Title();
  greeting.showTitle();
  //ButtonBoxes boxes = new ButtonBoxes();
  //boxes.createBox();
  ButtonDisplay display = new ButtonDisplay();
  display.displayButton();
  currentTool.sketch();
}

// pressing any mouse button will make a circle appear at that point
/*void mousePressed() {
  objects currType = objects.circle;
  int[] Fill = {100,60,0};
  int[] Color = {100,100,0};
  int[] args = {mouseX, mouseY, width/8};
  
  objectFactory oF = new objectFactory();
  
  Object dummyObject = oF.createObject(currType, Fill, Color, args);
  thingsToDraw.add(dummyObject);
}




// Objects are grouped

/*void keyPressed() {
  int jumpVal = 10;
  if (thingsToDraw != null) {
    if (key == CODED) {
      if (keyCode == UP) {
        for (Object o : thingsToDraw) {
          o.setY(o.getY()-jumpVal); 
        }
      }
      if (keyCode == LEFT) {
        for (Object o : thingsToDraw) {
          o.setX(o.getX()-jumpVal); 
        }
      }    
      if (keyCode == RIGHT) {
        for (Object o : thingsToDraw) {
          o.setX(o.getX()+jumpVal); 
        }
      }  
      if (keyCode == DOWN) {
        for (Object o : thingsToDraw) {
          o.setY(o.getY()+jumpVal); 
        }
      }      
    }
  */
//}
//}

void keyPressed() {
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
}

void switchTool(Tool t) {
  currentTool.setActive(false);
  currentTool = t;
  t.setActive(true);
}
