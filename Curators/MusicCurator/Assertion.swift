//
//  Assertion.swift
//  CuratorPlatform
//
//  An Assertion is a situated statement about an Entity.
//  The model stores assertions, not absolute truth.
//

import Foundation

public struct Assertion<Subject: Entity, Object>: Identifiable, Hashable where Object: Hashable {
    public let id: UUID
    public let subject: Subject
    public let predicate: String
    public let object: Object

    public init(
        id: UUID = UUID(),
        subject: Subject,
        predicate: String,
        object: Object
    ) {
        self.id = id
        self.subject = subject
        self.predicate = predicate
        self.object = object
    }
}
