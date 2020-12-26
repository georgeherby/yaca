import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  
  override func awakeFromNib() {

    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    
    let customToolbar = NSToolbar()
    customToolbar.showsBaselineSeparator = false
    self.titlebarAppearsTransparent = true
    self.titleVisibility = .hidden
    self.toolbar = customToolbar

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
