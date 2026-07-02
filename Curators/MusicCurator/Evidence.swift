//
//  Evidence.swift
//  CuratorPlatform
//
//  Evidence describes why an assertion or relation is believed,
//  where it came from, or how it was observed.
//

import Foundation

public struct Evidence: Identifiable, Hashable {
    public let id: UUID
    public let source: String
    public let note: String?

    public init(
        id: UUID = UUID(),
        source: String,
        note: String? = nil
    ) {
        self.id = id
        self.source = source
        self.note = note
    }
}
