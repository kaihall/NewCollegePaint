import javax.swing.JFileChooser;
import javax.swing.filechooser.FileFilter;

public enum SaveType { PROJ, PNG, JPG, SVG, PDF }

public class FileTool extends Tool {
  
  JFileChooser fileChooser;
  ProjectFilter projFilter;
  
  public FileTool() {
    // stubbed
  }
  
  public void sketch() {
    // stubbed
  }
  
  public void load() {
    int returnVal = fileChooser.showOpenDialog(new Container());

    if (returnVal == JFileChooser.APPROVE_OPTION) {
        File file = fileChooser.getSelectedFile();
        
    }
  }
  
  public void save(SaveType st) {
    // stubbed
  }
  
  public void autosave() {
    // stubbed
  }
  
  private void decode(File proj) {
    // stubbed
  }
}



public class ProjectFilter extends FileFilter {
  
  public boolean accept(File f) {
    return false;
  }
  
  public String getDescription() {
    return "Project Files (.proj)";
  }
}
