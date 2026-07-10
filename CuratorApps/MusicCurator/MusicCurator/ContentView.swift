import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var library: LibraryModel
    @State private var selection: SidebarItem? = .dashboard
    @State private var searchText = ""

    var body: some View {
        NavigationSplitView {
            List(SidebarItem.allCases, selection: $selection) { item in
                Label(item.title, systemImage: item.systemImage)
                    .tag(item)
            }
            .navigationTitle("MusicCurator")
        } detail: {
            Group {
                switch selection ?? .dashboard {
                case .dashboard:
                    DashboardView()
                case .library:
                    LibraryView(searchText: $searchText)
                case .works:
                    PlaceholderView(
                        title: "Werke",
                        subtitle: "Die Werkansicht folgt nach dem read-only Swinsian-Import.",
                        systemImage: "music.quarternote.3"
                    )
                case .people:
                    PlaceholderView(
                        title: "Mitwirkende",
                        subtitle: "Personen und Ensembles folgen im nächsten Ausbauschritt.",
                        systemImage: "person.3"
                    )
                case .relationships:
                    RelationshipsView()
                case .categories:
                    CategoriesView()
                case .doctor:
                    PlaceholderView(
                        title: "Library Doctor",
                        subtitle: "Die Integritätsprüfung wird auf den importierten Daten aufbauen.",
                        systemImage: "stethoscope"
                    )
                case .migration:
                    PlaceholderView(
                        title: "Root Manager",
                        subtitle: "Pfadänderungen bleiben bis zur Safe-Apply-Version deaktiviert.",
                        systemImage: "externaldrive.badge.timemachine"
                    )
                case .settings:
                    SettingsView()
                }
            }
            .toolbar {
                ToolbarItemGroup {
                    if selection == .library {
                        TextField("Bibliothek durchsuchen", text: $searchText)
                            .textFieldStyle(.roundedBorder)
                            .frame(width: 300)
                    }

                    Button {
                        library.chooseDatabase()
                    } label: {
                        Label("Datenbank öffnen", systemImage: "externaldrive.badge.plus")
                    }
                }
            }
            .alert(
                "Datenbankfehler",
                isPresented: Binding(
                    get: { library.errorMessage != nil },
                    set: { if !$0 { library.errorMessage = nil } }
                )
            ) {
                Button("OK", role: .cancel) {
                    library.errorMessage = nil
                }
            } message: {
                Text(library.errorMessage ?? "")
            }
        }
    }
}

enum SidebarItem: String, CaseIterable, Identifiable {
    case dashboard, library, works, people, relationships, categories, doctor, migration, settings
    var id: String { rawValue }

    var title: String {
        switch self {
        case .dashboard: return "Dashboard"
        case .library: return "Bibliothek"
        case .works: return "Werke"
        case .people: return "Mitwirkende"
        case .relationships: return "Beziehungen"
        case .categories: return "Kategorien"
        case .doctor: return "Library Doctor"
        case .migration: return "Root Manager"
        case .settings: return "Einstellungen"
        }
    }

    var systemImage: String {
        switch self {
        case .dashboard: return "rectangle.3.group"
        case .library: return "books.vertical"
        case .works: return "music.quarternote.3"
        case .people: return "person.3"
        case .relationships: return "point.3.connected.trianglepath.dotted"
        case .categories: return "tag"
        case .doctor: return "stethoscope"
        case .migration: return "externaldrive.badge.timemachine"
        case .settings: return "gearshape"
        }
    }
}

struct DashboardView: View {
    @EnvironmentObject private var library: LibraryModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Dashboard")
                            .font(.largeTitle.bold())
                        Text("Nur-Lesen-Zugriff auf deine Swinsian-Bibliothek")
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    if library.isLoading {
                        ProgressView()
                    }
                }

                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 220), spacing: 16)],
                    spacing: 16
                ) {
                    StatisticCard(
                        title: "Titel",
                        value: library.statistics.trackCount,
                        systemImage: "music.note"
                    )
                    StatisticCard(
                        title: "Alben / Releases",
                        value: library.statistics.albumCount,
                        systemImage: "opticaldisc"
                    )
                    StatisticCard(
                        title: "Komponisten-Einträge",
                        value: library.statistics.composerCount,
                        systemImage: "person.crop.square"
                    )
                    StatisticCard(
                        title: "Genres / Kategorien",
                        value: library.statistics.genreCount,
                        systemImage: "tag"
                    )
                }

                GroupBox("Datenquelle") {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(library.databaseDisplayName)
                                .font(.headline)
                            Text(library.databaseURL?.path ?? "Noch keine Swinsian-Datenbank geöffnet.")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .textSelection(.enabled)
                        }
                        Spacer()
                        Button("Library.sqlite öffnen …") {
                            library.chooseDatabase()
                        }
                    }
                    .padding(8)
                }

                GroupBox("Sicherheit") {
                    Label(
                        "Die Datenbank wird mit SQLITE_OPEN_READONLY geöffnet. MusicCurator schreibt derzeit weder in Swinsian noch in Audiodateien.",
                        systemImage: "lock.shield"
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
                }
            }
            .padding(28)
        }
        .navigationTitle("Dashboard")
    }
}

struct StatisticCard: View {
    let title: String
    let value: Int
    let systemImage: String

    private var formattedValue: String {
        value.formatted(.number.grouping(.automatic))
    }

    var body: some View {
        GroupBox {
            HStack(spacing: 14) {
                Image(systemName: systemImage)
                    .font(.title2)
                    .frame(width: 32)
                VStack(alignment: .leading, spacing: 2) {
                    Text(formattedValue)
                        .font(.title2.bold())
                    Text(title)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding(8)
        }
    }
}

struct LibraryView: View {
    @EnvironmentObject private var library: LibraryModel
    @Binding var searchText: String

    private var filteredTracks: [SwinsianTrack] {
        let text = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return library.tracks }

        return library.tracks.filter {
            $0.title.localizedCaseInsensitiveContains(text)
            || $0.artist.localizedCaseInsensitiveContains(text)
            || $0.album.localizedCaseInsensitiveContains(text)
            || $0.composer.localizedCaseInsensitiveContains(text)
            || $0.work.localizedCaseInsensitiveContains(text)
            || $0.genre.localizedCaseInsensitiveContains(text)
        }
    }

    var body: some View {
        Group {
            if library.databaseURL == nil {
                ContentUnavailableView(
                    "Keine Bibliothek geöffnet",
                    systemImage: "externaldrive.badge.plus",
                    description: Text("Öffne zuerst deine Kopie der Swinsian Library.sqlite.")
                )
            } else {
                Table(filteredTracks) {
                    TableColumn("Nr.") { track in
                        Text(trackNumber(track))
                            .monospacedDigit()
                    }
                    .width(min: 44, ideal: 55)

                    TableColumn("Titel", value: \.title)
                        .width(min: 180, ideal: 280)

                    TableColumn("Werk") { track in
                        Text(track.work.isEmpty ? track.movementName : track.work)
                    }
                    .width(min: 160, ideal: 240)

                    TableColumn("Komponist", value: \.composer)
                        .width(min: 150, ideal: 210)

                    TableColumn("Interpret", value: \.artist)
                        .width(min: 150, ideal: 210)

                    TableColumn("Album", value: \.album)
                        .width(min: 160, ideal: 240)
                }
            }
        }
        .navigationTitle("Bibliothek")
    }

    private func trackNumber(_ track: SwinsianTrack) -> String {
        if track.discNumber > 0 {
            return "\(track.discNumber).\(track.trackNumber)"
        }
        return track.trackNumber > 0 ? "\(track.trackNumber)" : ""
    }
}

struct RelationshipsView: View {
    var body: some View {
        ContentUnavailableView(
            "Beziehungen",
            systemImage: "point.3.connected.trianglepath.dotted",
            description: Text("Identity-, Structural- und Semantic-Relationships folgen auf Basis der importierten Entitäten.")
        )
    }
}

struct CategoriesView: View {
    var body: some View {
        ContentUnavailableView(
            "Kategorien",
            systemImage: "tag",
            description: Text("Kategorien werden später als relationale Zuordnungen aufgebaut.")
        )
    }
}

struct SettingsView: View {
    @EnvironmentObject private var library: LibraryModel

    var body: some View {
        Form {
            Section("Datenquelle") {
                LabeledContent("Datei", value: library.databaseDisplayName)
                Button("Library.sqlite auswählen …") {
                    library.chooseDatabase()
                }
            }

            Section("Sicherheit") {
                LabeledContent("Zugriffsmodus", value: "Nur Lesen")
                Text("SQLite wird ausschließlich mit SQLITE_OPEN_READONLY geöffnet.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .formStyle(.grouped)
        .padding()
        .navigationTitle("Einstellungen")
    }
}

struct PlaceholderView: View {
    let title: String
    let subtitle: String
    let systemImage: String

    var body: some View {
        ContentUnavailableView(
            title,
            systemImage: systemImage,
            description: Text(subtitle)
        )
        .navigationTitle(title)
    }
}

#Preview {
    ContentView()
        .environmentObject(LibraryModel())
        .frame(width: 1_150, height: 760)
}

