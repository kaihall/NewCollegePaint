public class ButtonDisplay{
  
  private float wid = width/12;
  private float hite = height/10;
  
  void displayButton(){
    
    // row 1
    
    ButtonThumbnails pencil = new ButtonThumbnails(loadImage("pencil.png"), width*3/4, width*0, wid, hite);
    pencil.show();
    ToolTip pencilTip = new ToolTip("Pencil tool", (width*3/4)+(wid)/2, height/20, wid, hite);
    pencilTip.makeText();
    HitBox pencilBox = new HitBox((width*3/4)+(wid)/2, height/20, wid, hite, width*3/4, width*0);
    pencilBox.makeHitBox();
    
    ButtonThumbnails line = new ButtonThumbnails(loadImage("line.png"), width*.838, width*0, wid, hite);
    line.show();
    ToolTip lineTip = new ToolTip("Line tool", (width*.838)+(wid)/2, height/20, wid, hite);
    lineTip.makeText();
    HitBox lineBox = new HitBox((width*.838)+(wid)/2, height/20, wid, hite, width*.838, width*0);
    lineBox.makeHitBox();
    
    ButtonThumbnails curve = new ButtonThumbnails(loadImage("curve.png"), width*.925, width*0, wid, hite);
    curve.show();
    ToolTip curveTip = new ToolTip("Curve tool", (width*.925)+(wid)/2, height/20, wid, hite);
    curveTip.makeText();
    HitBox curveBox = new HitBox((width*.925)+(wid)/2, height/20, wid, hite, width*.925, width*0);
    curveBox.makeHitBox();
    
    // row 2
    
    ButtonThumbnails rect = new ButtonThumbnails(loadImage("rect.png"), width*3/4, hite, wid, hite);
    rect.show();
    ToolTip rectTip = new ToolTip("Rectangle", (width*3/4)+(wid)/2, height*.15, wid, hite);
    rectTip.makeText();
    HitBox rectBox = new HitBox((width*3/4)+(wid)/2, height*.15, wid, hite, width*3/4, hite);
    rectBox.makeHitBox();
    
    ButtonThumbnails circle = new ButtonThumbnails(loadImage("circle.png"), width*.838, hite, wid, hite);
    circle.show();
    ToolTip circleTip = new ToolTip("Circle tool", (width*.838)+(wid)/2, height*.15, wid, hite);
    circleTip.makeText();
    HitBox circleBox = new HitBox((width*.838)+(wid)/2, height*.15, wid, hite, width*.838, hite);
    circleBox.makeHitBox();
    
    ButtonThumbnails polygon = new ButtonThumbnails(loadImage("polygon.png"), width*.925, hite, wid, hite);
    polygon.show();
    ToolTip polygonTip = new ToolTip("Polygon tool", (width*.925)+(wid)/2, height*.15, wid, hite);
    polygonTip.makeText();
    HitBox polygonBox = new HitBox((width*.925)+(wid)/2, height*.15, wid, hite, width*.925, hite);
    polygonBox.makeHitBox();
    
    // row 3
    
    
    ButtonThumbnails text = new ButtonThumbnails(loadImage("text.png"), width*3/4, height/5, wid, hite);
    text.show();
    ToolTip textTip = new ToolTip("Text tool", (width*3/4)+(wid)/2, height*.25, wid, hite);
    textTip.makeText();
    HitBox textBox = new HitBox((width*3/4)+(wid)/2, height*.25, wid, hite, width*3/4, height/5);
    textBox.makeHitBox();
    
    ButtonThumbnails image = new ButtonThumbnails(loadImage("image.png"), width*.838, height/5, wid, hite);
    image.show();
    ToolTip imageTip = new ToolTip("Image tool", (width*.838)+(wid)/2, height*.25, wid, hite);
    imageTip.makeText();
    HitBox imageBox = new HitBox((width*.838)+(wid)/2, height*.25, wid, hite, width*.838, height/5);
    imageBox.makeHitBox();
    
    ButtonThumbnails comment = new ButtonThumbnails(loadImage("comments.png"), width*.925, height/5, wid, hite);
    comment.show();
    ToolTip commentTip = new ToolTip("Comment tool", (width*.925)+(wid)/2, height*.25, wid, hite);
    commentTip.makeText();
    HitBox commentBox = new HitBox((width*.925)+(wid)/2, height*.25, wid, hite, width*.925, height/5);
    commentBox.makeHitBox();
    
    // row 4
        
    ButtonThumbnails select = new ButtonThumbnails(loadImage("select.png"), width*3/4, height*.30, wid, hite);
    select.show();
    ToolTip selectTip = new ToolTip("Select tool", (width*3/4)+(wid)/2, height*.35, wid, hite);
    selectTip.makeText();
    HitBox selectBox = new HitBox((width*3/4)+(wid)/2, height*.35, wid, hite, width*3/4, height*.30);
    selectBox.makeHitBox();
    
    
    ButtonThumbnails grid = new ButtonThumbnails(loadImage("grid.png"), width*.838, height*.30, wid, hite);
    grid.show();
    ToolTip gridTip = new ToolTip("grid tool", (width*.838)+(wid)/2, height*.35, wid, hite);
    gridTip.makeText();
    HitBox gridBox = new HitBox((width*.838)+(wid)/2, height*.35, wid, hite, width*.838, height*.30);
    gridBox.makeHitBox();
    
    ButtonThumbnails pan = new ButtonThumbnails(loadImage("pan.png"), width*.925, height*.30, wid, hite);
    pan.show();
    ToolTip panTip = new ToolTip("Pan tool", (width*.929)+(wid)/2, height*.35, wid, hite);
    panTip.makeText();
    HitBox panBox = new HitBox((width*.925)+(wid)/2, height*.35, wid, hite, width*.925, height*.30);
    panBox.makeHitBox();
    
    // row 5
    
    ButtonThumbnails save = new ButtonThumbnails(loadImage("save.png"), width*3/4, height*.40, wid, hite);
    save.show();
    ToolTip saveTip = new ToolTip("Save tool", (width*3/4)+(wid)/2, height*.45, wid, hite);
    saveTip.makeText();
    HitBox saveBox = new HitBox((width*3/4)+(wid)/2, height*.45, wid, hite, width*3/4, height*.40);
    saveBox.makeHitBox();
    
    
    ButtonThumbnails upload = new ButtonThumbnails(loadImage("upload.png"), width*.838, height*.40, wid, hite);
    upload.show();
    ToolTip uploadTip = new ToolTip("Upload tool", (width*.838)+(wid)/2, height*.45, wid, hite);
    uploadTip.makeText();
    HitBox uploadBox = new HitBox((width*.838)+(wid)/2, height*.45, wid, hite, width*.838, height*.40);
    uploadBox.makeHitBox();
    
    
    ButtonThumbnails print = new ButtonThumbnails(loadImage("print.png"), width*.925, height*.40, wid, hite);
    print.show();
    ToolTip printTip = new ToolTip("Print tool", (width*.929)+(wid)/2, height*.45, wid, hite);
    printTip.makeText();
    HitBox printBox = new HitBox((width*.925)+(wid)/2, height*.45, wid, hite, width*.925, height*.40);
    printBox.makeHitBox();
    
    
  } 
}
