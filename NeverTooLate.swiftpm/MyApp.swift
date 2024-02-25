import SwiftUI

@main
struct MyApp: App {
    @StateObject var badgeModel = BadgeModel()

    init() {
        CustomFont.registerFonts(fontName: "Cinzel-Bold")
        CustomFont.registerFonts(fontName: "Cinzel-Medium")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environmentObject(badgeModel)
            .navigationViewStyle(.stack)
        }
    }
}
