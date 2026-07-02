# 000 – Epistemic Model

Status: Accepted  
Version: 0.1

## Core Idea

The system does not primarily model objects. It models assertions about objects.

The model therefore distinguishes:

- Entity
- Relation
- Assertion
- Evidence
- Agent

## Entity

An entity is something that may be spoken about.

Examples:
- Person
- Work
- Expression
- Manifestation
- Place
- Event
- Collection
- Organisation
- Concept
- Object
- TimeSpan

## Assertion

An assertion is a statement made about an entity.

Assertions replace classical attributes.

Instead of:

```text
Album.genre = Jazz
```

the model uses:

```text
Assertion
Subject: Album
Predicate: hasGenre
Object: Jazz
```

## Evidence

Evidence describes why an assertion is believed or where it comes from.

## Agent

An agent is the actor who makes, imports, creates, confirms, or records an assertion.

## Epistemic Position

The system does not store absolute truth.  
It stores situated, contextualised, evidenced assertions.
