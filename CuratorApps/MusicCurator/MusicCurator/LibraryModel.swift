import AppKit
import Combine
import Foundation
import UniformTypeIdentifiers

@MainActor
final class LibraryModel: ObservableObject {
    @Published private(set) var statistics = LibraryStatistics.empty
    @Published private(set) var tracks: [SwinsianTrack] = []
    @Published private(set) var databaseURL: URL?
    @Published private(set) var isLoading = false
    @Published var errorMessage: String?

    private let reader = SwinsianReader()

    var databaseDisplayName: String {
        databaseURL?.lastPathComponent ?? "Keine Datenbank ausgewählt"
    }

    func chooseDatabase() {
        let panel = NSOpenPanel()
        panel.title = "Swinsian Library.sqlite auswählen"
        panel.message = "MusicCurator öffnet die Datei ausschließlich im Nur-Lesen-Modus."
        panel.prompt = "Öffnen"
        panel.canChooseDirectories = false
        panel.canChooseFiles = true
        panel.allowsMultipleSelection = false
        panel.allowedContentTypes = [.database, .data]

        guard panel.runModal() == .OK, let url = panel.url else {
            return
        }

        loadDatabase(at: url)
    }

    func loadDatabase(at url: URL) {
        isLoading = true
        errorMessage = nil

        let didAccess = url.startAccessingSecurityScopedResource()
        defer {
            if didAccess {
                url.stopAccessingSecurityScopedResource()
            }
            isLoading = false
        }

        do {
            try reader.open(url: url)
            statistics = try reader.statistics()
            tracks = try reader.tracks()
            databaseURL = url
        } catch {
            reader.close()
            statistics = .empty
            tracks = []
            databaseURL = nil
            errorMessage = error.localizedDescription
        }
    }
}
