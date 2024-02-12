import SwiftUI

@main
struct MyApp: App {
    @StateObject var dataModel = DataModel()
    @StateObject var badgeModel = BadgeModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                GridView()
            }
            .environmentObject(dataModel)
            .environmentObject(badgeModel)
            .navigationViewStyle(.stack)
        }
    }
}
