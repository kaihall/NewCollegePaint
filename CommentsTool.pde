public enum CommentsToolMode { Pencil, Text }

public class CommentsTool extends Tool {
  
  private boolean pencil;
  
  public CommentsTool() {
    pencil = true;
  }
  
  public void sketch() {
    if (isActive) {
      if (pencil) {
        pencilTool.setActive(true);
        pencilTool.PIXELMODE = false;
        pencilTool.sketch(true, stroke);
      }
      
      else {
        textTool.setActive(true);
        textTool.setFont(Font.SansSerif);
        textTool.sketch(true, stroke);
      }
    }
  }
  
  public void setFill(color c) {
    stroke = c;
  }
  
  public void setTool(CommentsToolMode ctm) {
    if (ctm == CommentsToolMode.Pencil) {
      pencil = true;
      textTool.setActive(false);
      textTool.cleanUp();
      pencilTool.setActive(true);
    }
    
    else {
      pencil = false;
      textTool.setActive(true);
      pencilTool.setActive(false);
      pencilTool.cleanUp();
    }
  }
  
  public void cleanUp() {
    textTool.setActive(false);
    pencilTool.setActive(false);
    textTool.cleanUp();
    pencilTool.cleanUp();
  }
}
