import Foundation

struct LibraryStatistics: Equatable {
    let trackCount: Int
    let albumCount: Int
    let composerCount: Int
    let genreCount: Int

    static let empty = LibraryStatistics(
        trackCount: 0,
        albumCount: 0,
        composerCount: 0,
        genreCount: 0
    )
}

struct SwinsianTrack: Identifiable, Equatable {
    let id: Int64
    let title: String
    let artist: String
    let album: String
    let albumArtist: String
    let composer: String
    let genre: String
    let conductor: String
    let work: String
    let movementName: String
    let year: Int
    let trackNumber: Int
    let discNumber: Int
    let path: String
    let filename: String
}
