# MusicCurator Domain Model

Version: 0.9
Status: Draft
Author: Wolfgang Dufek & ChatGPT
Last Updated: 2026-07-11

---

# Philosophy

> The model is not invented. It is discovered.

MusicCurator does not start with files, albums or tags.

It starts with the real world of music.

The purpose of the model is to represent musical knowledge as faithfully as possible while remaining technically implementable and maintainable.

---

# ADR-000

## Everything is an Entity.
## Everything else is a Relationship.

This is the fundamental architectural decision of MusicCurator.

No concept shall be introduced unless it can be identified either as

- an Entity
- or a Relationship.

Everything else is derived from these two concepts.

---

# Core Principles

## Principle 1

MusicCurator models music, not files.

Files are technical carriers.

Music is represented by entities and their relationships.

---

## Principle 2

Entities have identity.

Relationships have meaning.

---

## Principle 3

Knowledge does not exist independently.

Knowledge emerges from relationships between entities.

---

## Principle 4

The conceptual model is intentionally more general than the implementation model.

The database may contain specialised tables such as

- Work
- Recording
- Person
- Release

while the conceptual model recognises them all simply as Entities.

---

# Entity

An Entity is anything that exists independently and can participate in relationships.

Examples include

- Work
- Work Part
- Recording
- Release
- File
- Person
- Ensemble
- Instrument
- Voice Type
- Category
- Collection
- Location
- Source
- Label
- Composer
- Lyricist

Every Entity

- has a stable identity
- may have multiple names
- may participate in any number of relationships
- may contain notes
- may be classified
- may be referenced by other entities

An Entity never derives its meaning from its storage representation.

---

# Relationship

A Relationship connects two entities.

Relationships are first-class citizens of the model.

They are not implementation details.

Every Relationship has

- source entity
- target entity
- relationship type
- optional direction
- optional confidence
- optional origin
- optional comment

Relationships are typed.

---

# Relationship Types

MusicCurator currently distinguishes three conceptual families.

## Identity Relationships

Identity Relationships answer the question

> "How do we know this is the same entity?"

Examples

- alternative title
- translated title
- catalogue number
- alias
- stage name
- historical spelling
- abbreviation
- sort name

Identity Relationships never change the meaning of an entity.

They merely identify it.

---

## Structural Relationships

Structural Relationships describe composition.

Examples

Work
contains
Work Part

Release
contains
Recording

Recording
contains
Credit

Collection
contains
Entity

Structural Relationships define organisation.

---

## Semantic Relationships

Semantic Relationships express meaning.

Examples

- influenced by
- similar mood
- related instrumentation
- same literary source
- continuation of
- contrast to
- recommended after
- personal association

Semantic Relationships are the foundation of the MusicCurator Knowledge Layer.

---

# Knowledge

Knowledge is not stored as an isolated object.

Knowledge is the network created by semantic relationships.

As more semantic relationships are added, the library becomes richer.

The system therefore evolves from a music catalogue into a music knowledge base.

---

# Design Goal

MusicCurator shall never ask

"What file is this?"

Instead it shall ask

"What entity is this?"

and

"How is it related to everything else?"

Everything beyond this point is a specialised view of these two questions.
