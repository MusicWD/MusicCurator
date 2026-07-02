//
//  Entity.swift
//  CuratorPlatform
//
//  An Entity is anything that may become the subject of assertions.
//  It is not yet an Album, Track, Person, Work, Place, or Concept.
//  Those are later specialisations.
//

import Foundation

public protocol Entity: Identifiable, Hashable {
    var id: UUID { get }
}
