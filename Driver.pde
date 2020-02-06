void setup(){
  fullScreen();
  background(255);
  frameRate(1000);
  
  ToolArea box = new ToolArea();
  box.display(); 
  Buttons button = new Buttons();
  button.display();
  Title greeting = new Title();
  greeting.showTitle();
}

void draw(){
}
