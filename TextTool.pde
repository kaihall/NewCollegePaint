enum Font {SansSerif,Serif,Fun,Cursive};

public class TextTool extends Tool {
  
  boolean drawing;  // true if a text box is active right now
  Font font;        // the font type that the tool is using to make new Text objects
  String text;      // the text being typed in the box
  int x, y;         // location of the top left corner of the Text
  int size;         // font size
  int textHeight;   // how tall the text is with all of its lines
  Text working;     // the Text that the tool is currently working with
  int sinceLastClick, sinceLastPress;   // time since the last mouse click or key press
  boolean shift;    // true if shift is being held down
  
  /*
   * Constructor with default settings: Arial, 20 pt, black text
  */
  public TextTool() {
    super();
    drawing = false;
    font = Font.SansSerif;
    size = 20;
    textHeight = 20;
    text = "";
    x = 0;
    y = 0;
    working = null;
    sinceLastClick = 0;
    sinceLastPress = 0;
    fill = color(0);
    shift = false;
  }
  
  /*
   * If working on text right now, draw a text box and check for input. Stop working on the current Text object when the mouse is clicked.
   * If not working on text right now, create a new text box when the user clicks on the canvas.
  */
  public void sketch() {
    if (isActive) {
      sinceLastClick++;
      sinceLastPress++;
      
      if (drawing) {
        drawBox();
        checkKeys();
      }
      
      if (mouseX < width*.75 && mousePressed && sinceLastClick > inputDelay) {
        sinceLastClick = 0;
        if (!drawing) {
          drawing = true;
          x = mouseX;
          y = mouseY;
          working = new Text(x,y,size,fill,font);
          thingsToDraw.add(working);
        }
        
        else {
          drawing = false;
          text = "";
        }
      }
    }
  }
  
  /*
   * Draws a transparent box with semi-transparent black outline around the text
  */
  private void drawBox() {
    rectMode(CORNER);
    stroke(0,80);
    noFill();
    strokeWeight(1);
    rect(x-10,y-10,textWidth(text)*0.6+size,textHeight+size);
  }
  
  /*
   * Checks for and processes input.
   * Backspace: Deletes the last character.
   * Enter: Adds a line break.
   * Tab: Adds 5 spaces (adding a tab character did nothing).
   * Escape: Exits out of the current text box.
   * Others (not coded): Adds the character to the text box. Makes it uppercase if shift is down.
  */
  private void checkKeys() {
    if (keyPressed && sinceLastPress > inputDelay/4) {
      sinceLastPress = 0;
      
      if (key == BACKSPACE) {
        if (text.length() > 0) text = text.substring(0,text.length()-1);
      }
      
      else if (key == ENTER || key == RETURN) {
        text += '\n';
        textHeight += size*1.5;
      }
      
      else if (key == TAB) {
        text += "     ";
      }
      
      else if (key == ESC) {
        drawing = false;
        text = "";
      }
      
      else if (key != DELETE && key != CODED) {
        if (shift) text += (new String("" + key)).toUpperCase();
        else text += key;
      }
      
      working.setText(text);
    }
  }
  
  public void setFont(Font font) {
    this.font = font;
  }
  
  public void shiftPressed(boolean down) {
    shift = down;
  }
}

public class Text extends Object {
  
  int size;
  String fontName;
  PFont font;
  String text;
  
  public Text(int x, int y, int fontSize, color fill, Font font, String text) {
    super();
    this.x = x;
    this.y = y;
    this.size = fontSize;
    this.fill = fill;
    
    switch (font) {
       case Serif:
         this.fontName = "TimesNewRoman.ttf";
         break;
       case Fun:
         this.fontName = "COMIC.TTF";
         break;
       case Cursive:
         this.fontName = "MrsSaintDelafield.ttf";
         break;
       default:
         this.fontName = "Arial.ttf";
         break;
    }
    
    this.font = createFont(fontName,fontSize);
    this.text = text;
  }
  
  public Text(int x, int y, int fontSize, color stroke, Font font) {
    this(x,y,fontSize,stroke,font,"");
  }
  
  public void drawShape() {
    prepColor();
    textSize(size);
    textFont(font);
    text(text,x,y);
  }
  
  public void setText(String text) {
    this.text = text;
  }
}
