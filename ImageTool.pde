import javax.swing.JFileChooser;
import javax.swing.filechooser.FileFilter;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

public class ImageTool extends Tool {
  
  JFileChooser fileChooser;
  ImageFilter imageFilter;
  boolean success;
  String fileName;
  
  public ImageTool() {
    fileChooser = new JFileChooser();
    imageFilter = new ImageFilter();
    fileChooser.setFileFilter(imageFilter);
    fileName = "";
    success = false;
  }
  
  public void sketch() {}
  
  public void uploadImage() {
    int returnVal = fileChooser.showOpenDialog(new Container());

    if (returnVal == JFileChooser.APPROVE_OPTION) {
        File file = fileChooser.getSelectedFile();
        fileName = file.getName().substring(0,file.getName().lastIndexOf(".")-1) + random(0,999999) + "." + imageFilter.getExtension(file);
        addToDirectory(file);
        if (success) {
          thingsToDraw.add(new image(fileName, 0, 0));
          success = false;
        }
    }
    
    else System.out.println("Load cancelled.");
  }
  
  private void addToDirectory(File f) {
    BufferedImage image = null;

    //read image
    try{
      //image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
      image = ImageIO.read(f);
      System.out.println("Reading complete.");
    }catch(IOException e){
      System.out.println("Error: "+e);
    }
    
    //write image
    try{
      f = new File(dataPath("") + "//" + fileName);  //output file path
      System.out.println(f.getPath());

      f = new File(dataPath("") + "\\" + fileName);  //output file path
      
      if (image != null) {
        ImageIO.write(image, imageFilter.getExtension(f), f);
        success = true;
      }
      
      else System.out.println("Load Failed!");
      
      System.out.println("Writing complete.");
    }catch(IOException e){
      System.out.println("Error: "+e);
    }
  }
}



public class image extends Object {
  
  PImage image;
  int w, h;
  
  public image (String fileName, int x, int y) {
    super();
    this.image = loadImage(fileName);
    this.x = x;
    this.y = y;
    this.w = image.width;
    this.h = image.height;
    
    while (this.w + this.x > width*0.75 || this.h + this.y > height) {
      w *= 0.9;
      h *= 0.9;
    }
    
    minX = x;
    maxX = x + w*scale;
    minY = y;
    minY = y + h*scale;
  }
  
  public void drawShape() {    
    imageMode(CORNER);
    image(image,x,y,w,h);
    //minX = x;
    //maxX = x + w*scale;
    //minY = y;
    //minY = y + h*scale;
  }
  
}



public class ImageFilter extends FileFilter {
  
  public boolean accept(File f) {
     String extension = getExtension(f);
      if (extension != null) {
          if (extension.equals("png") ||
              extension.equals("gif") ||
              extension.equals("jpeg") ||
              extension.equals("jpg")) {
                  return true;
          } else {
              return false;
          }
      }

      return false;
  }
  
  public String getDescription() {
    return "PNG, JPG, and GIF images";
  }
  
  /*
   * Get the extension of a file.
   */
  public String getExtension(File f) {
      String ext = null;
      String s = f.getName();
      int i = s.lastIndexOf('.');

      if (i > 0 &&  i < s.length() - 1) {
          ext = s.substring(i+1).toLowerCase();
      }
      return ext;
  }
}
