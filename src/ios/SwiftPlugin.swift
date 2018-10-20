@objc(ModusEchoSwift) class ModusEchoSwift : CDVPlugin {
  
  func coolMethod(command: CDVInvokedUrlCommand) {
      print("hello, this time from native Swift")

    var pluginResult = CDVPluginResult(
      status: CDVCommandStatus_ERROR
    )

    let msg = command.arguments[0] as? String ?? ""
    print("here is the argument that was recived:  \(msg)")

    if msg.characters.count > 0 {


        
        pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAs: msg
        )

      
      
    }

    self.commandDelegate!.send(
      pluginResult, 
      callbackId: command.callbackId
    )
  }
}