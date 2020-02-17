public enum SelectToolMode { Select, Move, Rotate, Resize, Group, Ungroup, Delete }

public class SelectTool extends Tool {
  
  private SelectToolMode mode;
  private ArrayList<Object> selected;
  private ArrayList<group> groups;
  private int sinceLastClick;
  
  public SelectTool() {
    mode = SelectToolMode.Select;
    selected = new ArrayList<Object>();
    groups = new ArrayList<group>();
    sinceLastClick = 0;
  }
  
  public void sketch() {
    if (isActive) {
      switch (mode) {
        case Select:
          selectSketch();
          break;
        case Move:
          moveSketch();
          break;
        case Rotate:
          rotateSketch();
          break;
        case Resize:
          resizeSketch();
          break;
        case Group:
          group();
          mode = SelectToolMode.Select;
          break;
        case Ungroup:
          ungroup();
          mode = SelectToolMode.Select;
          break;
        case Delete:
          delete();
          mode = SelectToolMode.Select;
          break;
        default:
          mode = SelectToolMode.Select;
          break;
      }
      
      sinceLastClick++;
    }
  }
  
  public void setMode(SelectToolMode stm) {
    mode = stm;
  }
  
  public void cleanUp() {
    for (Object o : selected) {
      o.selected = false;
    }
    selected.clear();
  }
  
  private void selectSketch() {
    if (mousePressed && mouseX <= width*0.75 && sinceLastClick > inputDelay) {
      sinceLastClick = 0;
      
      for (int i = thingsToDraw.size()-1; i >= 0; i--) {
        Object current = thingsToDraw.get(i);
        if (current.underMouse()) {
          current.select();
          if (current.selected) selected.add(current);
          else if (selected.contains(current)) selected.remove(current);
          break;
        }
      }
    }
  }
  
  private void moveSketch() {
    
  }
  
  private void rotateSketch() {
    
  }
  
  private void resizeSketch() {
    
  }
  
  private void group() {
    if(selected != null) {
      group newGroup = new group(selected);
      thingsToDraw.add(newGroup);
      groups.add(newGroup);
    }
  }
  
  private void ungroup() {
    if (selected != null) {
      for (group g : groups) {
        if (g.selected) {
          g.disband();
          groups.remove(g);
        }
      }
    }
  }
  
  private void delete() {
    for (Object o : selected) {
      thingsToDraw.remove(o);
    }
  }
}



public class group extends Object {
  
  private ArrayList<Object> group;
  
  public group(ArrayList<Object> group) {
    if (group != null) {
      for (Object o : group) {
        thingsToDraw.remove(o);
        this.group.add(o);
        minX = min(minX, o.minX);
        minY = min(minY, o.minY);
        maxX = max(maxX, o.maxX);
        maxY = max(maxY, o.maxY);
      }
    }
    
    else group = new ArrayList<Object>();
  }
  
  public void drawShape() {
    for (Object o : group) {
      o.draw();
    }
  }
  
  public void disband() {
    for (Object o: group) {
      thingsToDraw.add(o);
    }
    group.clear();
    if (thingsToDraw.contains(this)) thingsToDraw.remove(this);
  }
}
