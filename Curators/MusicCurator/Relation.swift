//
//  Relation.swift
//  CuratorPlatform
//
//  A Relation connects two Entities.
//  It creates context, not inherited truth.
//

import Foundation

public struct Relation<Source: Entity, Target: Entity>: Identifiable, Hashable {
    public let id: UUID
    public let source: Source
    public let target: Target
    public let qualifier: String

    public init(
        id: UUID = UUID(),
        source: Source,
        target: Target,
        qualifier: String
    ) {
        self.id = id
        self.source = source
        self.target = target
        self.qualifier = qualifier
    }
}
