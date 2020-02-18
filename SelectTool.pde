public enum SelectToolMode { Select, Move, Rotate, Resize, Group, Ungroup, Delete, Duplicate }

public class SelectTool extends Tool {
  
  private SelectToolMode mode;
  private ArrayList<Object> selected;
  private ArrayList<group> groups;
  private int sinceLastClick;
  private boolean drawing;
  private int lastX;
  private int lastY;
  
  public SelectTool() {
    mode = SelectToolMode.Select;
    selected = new ArrayList<Object>();
    groups = new ArrayList<group>();
    sinceLastClick = 0;
    drawing = false;
    lastX = 0;
    lastY = 0;
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
          //rotateSketch();
          mode = SelectToolMode.Select;
          break;
        case Resize:
          //resizeSketch();
          mode = SelectToolMode.Select;
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
        case Duplicate:
          duplicate();
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
    drawing = false;
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
    if (mouseX < width*0.75 && mousePressed) {
      if (!drawing) {
        drawing = true;
        lastX = mouseX;
        lastY = mouseY;
      } else {
        int moveX = mouseX - lastX;
        int moveY = mouseY - lastY;
        lastX = mouseX;
        lastY = mouseY;
        
        for (Object o : selected) {
          if (o.maxX() + moveX < width*0.748) o.move(moveX,0);
          if (o.maxY() + moveY < height) o.move(0,moveY);
        }
      }
    }
    
    else if (drawing) {
      drawing = false;
      lastX = 0;
      lastY = 0;
    }
  }
  
  private void rotateSketch() {
    if (mouseX < width*0.75 && mousePressed) {
      if (!drawing) {
        drawing = true;
        lastX = mouseX;
        lastY = mouseY;
      } else {
        int mult = (mouseX > lastX) ? -1 : 1;
        lastX = mouseX;
        lastY = mouseY;
        
        for (Object o : selected) {
          o.turn(radians(mult));
        }
      }
    }
    
    else if (drawing) {
      drawing = false;
      lastX = 0;
      lastY = 0;
    }
  }
  
  private void resizeSketch() {
    if (mouseX < width*0.75 && mousePressed) {
      if (!drawing) {
        drawing = true;
        lastX = mouseX;
        lastY = mouseY;
      } else {
        if (lastX == 0) lastX = 1;
        float scale = mouseX/lastX;
        lastX = mouseX;
        lastY = mouseY;
        
        for (Object o : selected) {
          if (o.maxX() * scale < width*0.748 && o.maxY() * scale < height) o.rescale(scale);
        }
      }
    }
    
    else if (drawing) {
      drawing = false;
      lastX = 0;
      lastY = 0;
    }
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
  
  private void duplicate() {
    for (Object o : selected) {
      thingsToDraw.add(o.duplicate());
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
  
  public Object duplicate() {
    ArrayList<Object> retVal = new ArrayList<Object>();
    
    for (Object o : group) {
      retVal.add(o.duplicate());
    }
    
    return new group(retVal);
  }
  
  public void disband() {
    for (Object o: group) {
      thingsToDraw.add(o);
    }
    group.clear();
    if (thingsToDraw.contains(this)) thingsToDraw.remove(this);
  }
}
