import PlaceFramework

@objc(ObjcPlugin) class ObjcPlugin : CDVPlugin {
  
   func coolMethod(_ command: CDVInvokedUrlCommand) {
      print("hello, this time from native Swift")

    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )
   
    print("did something came?: \((command.arguments[0] as! [Any])[0])")
    
    let msg = (command.arguments[0] as! [Any])[0] as? String ?? ""
    print("here is the argument that was recived:  \(msg)")

    if msg.characters.count > 0 {
        
        Place.presentTheBlueScreen(callingViewController: self.viewController)

        pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAs: msg + "also hello from Xcode"
        )

    }

    self.commandDelegate!.send(
      pluginResult, 
      callbackId: command.callbackId
    )
  }
}

