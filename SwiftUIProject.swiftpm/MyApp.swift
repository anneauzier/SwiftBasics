import SwiftUI

@main
struct MyApp: App {
    
    init() {
        FontsManager.shared.registerFont(name: "RubikBubbles-Regular", withExtension: "ttf")
    }
    
    var body: some Scene {
        WindowGroup {
            InitialView()
        }
    }
}
