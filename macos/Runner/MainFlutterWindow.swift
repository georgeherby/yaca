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
    
  //      // Transparent view
  //  self.isOpaque = false
  //  self.backgroundColor = .clear
  //  // Add the blur layer
  //   let blurView = NSVisualEffectView()
  //   let view = contentViewController?.view.superview;
  //   blurView.frame = CGRect(x: 0, y: 0, width: 2000, height: 2000)
  //   view?.addSubview(blurView, positioned: NSWindow.OrderingMode.below, relativeTo: nil)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
