import SwiftUI

@main
struct MyApp: App {
    @StateObject var badgeModel = BadgeModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                GridView()
            }
            .environmentObject(badgeModel)
            .navigationViewStyle(.stack)
        }
    }
}
