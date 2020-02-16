public class GridTool extends Tool {
  
  int gridSize;
  
  public GridTool() {
    super();
    gridSize = 50;
  }
  
  public void sketch() {}
  
  public void drawGrid() {
    stroke(0);
    strokeWeight(1);
    
    for (int x = gridSize; x < width*0.75; x += gridSize)
      line(x,0,x,height);
    
    for (int y = gridSize; y < height; y += gridSize)
      line(0,y,width*0.75,y);
  }
  
}
