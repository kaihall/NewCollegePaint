ArrayList<Object> thingsToDraw = new ArrayList<Object>(); // Generic List that functions as a Grouped set of shapes

void setup(){
  fullScreen();
  background(255);
  frameRate(1000);
}

void draw(){
  if (thingsToDraw != null) {
    for (Object o : thingsToDraw) {
      o.draw();
    }
  }
  
  // Too lazy to make global
  ToolArea box = new ToolArea();
  box.display(); 
  Buttons button = new Buttons();
  button.display();
  Title greeting = new Title();
  greeting.showTitle();
  PencilTool tool = new PencilTool();
  tool.sketch();
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
