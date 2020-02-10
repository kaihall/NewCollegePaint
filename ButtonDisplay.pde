public class ButtonDisplay{
  
  void displayButton(){
    
    // row 1
    
    ButtonThumbnails pencil = new ButtonThumbnails(loadImage("pencil.png"), width*3/4, width*0, width/12, height/10);
    pencil.show();
    ToolTip pencilTip = new ToolTip("Pencil tool", (width*3/4)+(width/12)/2, height/20, width/12, height/10);
    pencilTip.makeText();
    
    ButtonThumbnails line = new ButtonThumbnails(loadImage("line.png"), width*.838, width*0, width/12, height/10);
    line.show();
    
    ButtonThumbnails curve = new ButtonThumbnails(loadImage("curve.png"), width*.925, width*0, width/12, height/10);
    curve.show();
    
    // row 2
    
    ButtonThumbnails rect = new ButtonThumbnails(loadImage("rect.png"), width*3/4, height/10, width/12, height/10);
    rect.show();
    
    ButtonThumbnails circle = new ButtonThumbnails(loadImage("circle.png"), width*.838, height/10, width/12, height/10);
    circle.show();
    
    ButtonThumbnails polygon = new ButtonThumbnails(loadImage("polygon.png"), width*.925, height/10, width/12, height/10);
    polygon.show();
    
    // row 3
    
    
    ButtonThumbnails text = new ButtonThumbnails(loadImage("text.png"), width*3/4, height/5, width/12, height/10);
    text.show();
    
    ButtonThumbnails image = new ButtonThumbnails(loadImage("image.png"), width*.838, height/5, width/12, height/10);
    image.show();
    
    ButtonThumbnails comment = new ButtonThumbnails(loadImage("comments.png"), width*.925, height/5, width/12, height/10);
    comment.show();
    
    // row 4
        
    ButtonThumbnails select = new ButtonThumbnails(loadImage("select.png"), width*3/4, height*.30, width/12, height/10);
    select.show();
    
    ButtonThumbnails zoomin = new ButtonThumbnails(loadImage("zoomin.png"), width*.838, height*.30, width/12, height/10);
    zoomin.show();
    
    ButtonThumbnails pan = new ButtonThumbnails(loadImage("pan.png"), width*.925, height*.30, width/12, height/10);
    pan.show();
    
    // row 5
    
    ButtonThumbnails save = new ButtonThumbnails(loadImage("save.png"), width*3/4, height*.40, width/12, height/10);
    save.show();
    
    ButtonThumbnails upload = new ButtonThumbnails(loadImage("upload.png"), width*.838, height*.40, width/12, height/10);
    upload.show();
    
    ButtonThumbnails print = new ButtonThumbnails(loadImage("print.png"), width*.925, height*.40, width/12, height/10);
    print.show();  
    
  } 
}
