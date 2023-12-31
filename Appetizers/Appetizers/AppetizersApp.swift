//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order() /// we created an Order
    
    var body: some Scene {  // body of the App returns Scene (which is the Window of our app)
        WindowGroup {
            /// we are injecting "environmentObject" at the very top level of TabView which is here in AppLifeCycle
            AppetizerTabView().environmentObject(order)
            /// Anytime we open the AppetizersApp (macos - with multiple windows, or iPad) every window is initialized with AppetizerTabView()
        }
    }
    
    /*
     App: - The type of scene representing the content of the app.
    @main - @main - keyword acts as the entry point of our program. So here the function has to be ran because its @main function and the function is hidden and we can see by conforming to App protocol

     scene - window of our app (scene has multiple windows) - scene introduced in iOS 13

     public protocol App {

         /// The type of scene representing the content of the app.
         ///
         /// When you create a custom app, Swift infers this type from your
         /// implementation of the required ``SwiftUI/App/body-swift.property``
         /// property.
         
        associatedtype Body : Scene
      
        // body of the App returns Scene (its like body of the view returns some View)

     
     
     extension App {
         @MainActor public static func main()   // App has func main()
     }
     */

}


/* *******  Important Notes: -
 
brandPrimary (Assets color) - HexCode - #00633D

 */
