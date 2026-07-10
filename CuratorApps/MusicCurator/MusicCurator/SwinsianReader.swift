import Foundation
import SQLite3

enum SwinsianReaderError: LocalizedError {
    case cannotOpenDatabase(String)
    case invalidSwinsianDatabase
    case queryFailed(String)

    var errorDescription: String? {
        switch self {
        case .cannotOpenDatabase(let message):
            return "Die Datenbank konnte nicht geöffnet werden: \(message)"
        case .invalidSwinsianDatabase:
            return "Die gewählte Datei enthält keine lesbare Swinsian-Tabelle „track“."
        case .queryFailed(let message):
            return "Die Datenbankabfrage ist fehlgeschlagen: \(message)"
        }
    }
}

final class SwinsianReader {
    private var database: OpaquePointer?

    deinit {
        close()
    }

    func open(url: URL) throws {
        close()

        var db: OpaquePointer?
        let result = sqlite3_open_v2(
            url.path,
            &db,
            SQLITE_OPEN_READONLY | SQLITE_OPEN_FULLMUTEX,
            nil
        )

        guard result == SQLITE_OK, let db else {
            let message = db.flatMap { String(cString: sqlite3_errmsg($0)) }
                ?? "Unbekannter SQLite-Fehler"
            if let db {
                sqlite3_close(db)
            }
            throw SwinsianReaderError.cannotOpenDatabase(message)
        }

        database = db

        guard try hasTrackTable() else {
            close()
            throw SwinsianReaderError.invalidSwinsianDatabase
        }
    }

    func close() {
        if let database {
            sqlite3_close(database)
            self.database = nil
        }
    }

    func statistics() throws -> LibraryStatistics {
        LibraryStatistics(
            trackCount: try scalarInt("SELECT COUNT(*) FROM track"),
            albumCount: try scalarInt(
                """
                SELECT COUNT(DISTINCT album)
                FROM track
                WHERE TRIM(COALESCE(album, '')) <> ''
                """
            ),
            composerCount: try scalarInt(
                """
                SELECT COUNT(DISTINCT composer)
                FROM track
                WHERE TRIM(COALESCE(composer, '')) <> ''
                """
            ),
            genreCount: try scalarInt(
                """
                SELECT COUNT(DISTINCT genre)
                FROM track
                WHERE TRIM(COALESCE(genre, '')) <> ''
                """
            )
        )
    }

    func tracks(limit: Int = 2_000) throws -> [SwinsianTrack] {
        guard let database else {
            throw SwinsianReaderError.cannotOpenDatabase("Keine Datenbank geöffnet.")
        }

        let safeLimit = max(1, min(limit, 25_000))
        let sql = """
        SELECT
            track_id,
            COALESCE(title, ''),
            COALESCE(artist, ''),
            COALESCE(album, ''),
            COALESCE(albumartist, ''),
            COALESCE(composer, ''),
            COALESCE(genre, ''),
            COALESCE(conductor, ''),
            COALESCE(work, ''),
            COALESCE(movementname, ''),
            COALESCE(year, 0),
            COALESCE(tracknumber, 0),
            COALESCE(discnumber, 0),
            COALESCE(path, ''),
            COALESCE(filename, '')
        FROM track
        ORDER BY
            CASE WHEN TRIM(COALESCE(composer, '')) = '' THEN 1 ELSE 0 END,
            composer COLLATE NOCASE,
            album COLLATE NOCASE,
            discnumber,
            tracknumber,
            title COLLATE NOCASE
        LIMIT ?
        """

        var statement: OpaquePointer?
        guard sqlite3_prepare_v2(database, sql, -1, &statement, nil) == SQLITE_OK,
              let statement else {
            throw queryError(database)
        }
        defer { sqlite3_finalize(statement) }

        sqlite3_bind_int(statement, 1, Int32(safeLimit))

        var result: [SwinsianTrack] = []
        result.reserveCapacity(safeLimit)

        while true {
            let step = sqlite3_step(statement)
            if step == SQLITE_DONE {
                break
            }
            guard step == SQLITE_ROW else {
                throw queryError(database)
            }

            result.append(
                SwinsianTrack(
                    id: sqlite3_column_int64(statement, 0),
                    title: text(statement, 1),
                    artist: text(statement, 2),
                    album: text(statement, 3),
                    albumArtist: text(statement, 4),
                    composer: text(statement, 5),
                    genre: text(statement, 6),
                    conductor: text(statement, 7),
                    work: text(statement, 8),
                    movementName: text(statement, 9),
                    year: Int(sqlite3_column_int(statement, 10)),
                    trackNumber: Int(sqlite3_column_int(statement, 11)),
                    discNumber: Int(sqlite3_column_int(statement, 12)),
                    path: text(statement, 13),
                    filename: text(statement, 14)
                )
            )
        }

        return result
    }

    private func hasTrackTable() throws -> Bool {
        let count = try scalarInt(
            """
            SELECT COUNT(*)
            FROM sqlite_master
            WHERE type = 'table' AND name = 'track'
            """
        )
        return count == 1
    }

    private func scalarInt(_ sql: String) throws -> Int {
        guard let database else {
            throw SwinsianReaderError.cannotOpenDatabase("Keine Datenbank geöffnet.")
        }

        var statement: OpaquePointer?
        guard sqlite3_prepare_v2(database, sql, -1, &statement, nil) == SQLITE_OK,
              let statement else {
            throw queryError(database)
        }
        defer { sqlite3_finalize(statement) }

        guard sqlite3_step(statement) == SQLITE_ROW else {
            throw queryError(database)
        }

        return Int(sqlite3_column_int64(statement, 0))
    }

    private func text(_ statement: OpaquePointer, _ column: Int32) -> String {
        guard let pointer = sqlite3_column_text(statement, column) else {
            return ""
        }
        return String(cString: pointer)
    }

    private func queryError(_ database: OpaquePointer) -> SwinsianReaderError {
        SwinsianReaderError.queryFailed(String(cString: sqlite3_errmsg(database)))
    }
}
