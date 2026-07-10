import SwiftUI

@main
struct MusicCuratorApp: App {
    @StateObject private var library = LibraryModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(library)
                .frame(minWidth: 1_050, minHeight: 680)
        }
    }
}

