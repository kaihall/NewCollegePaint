public enum CommentsToolMode { Pencil, Text }

public class CommentsTool extends Tool {
  
  private boolean pencil;
  
  public CommentsTool() {
    pencil = true;
  }
  
  public void sketch() {
    if (isActive) {
      if (pencil) {
        pencilTool.PIXELMODE = false;
        pencilTool.sketch(true, stroke);
      }
      
      else {
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
      pencilTool.setActive(true);
    }
    
    else {
      pencil = false;
      textTool.setActive(true);
      pencilTool.setActive(false);
    }
  }
}
