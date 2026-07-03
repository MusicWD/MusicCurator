
# 080 – Domain Foundation 0.1

Status: Draft  
Sprint: 1  
Scope: CuratorPlatform Core Model

## Purpose

This document defines the foundational concepts of the CuratorPlatform domain model.

Sprint 1 is complete when the following concepts are defined well enough to guide implementation:

- Entity
- Assertion
- Predicate
- Evidence
- Agent
- Context
- Identity

## Axiom 1 – Reference Points and Entities

The world initially presents reference points.

A Reference Point is anything that can be referred to, observed, imported, or become the subject of future assertions.

A Reference Point becomes an Entity as soon as at least one Assertion refers to it.

The first Assertion is frequently generated automatically by the technical system.

Example:

Reference Point:
    ABCDE.mp3

Assertion:
    "ABCDE.mp3 is a file"

Agent:
    Import System

Evidence:
    File system observation

Context:
    Technical Import

From this moment on, ABCDE.mp3 exists as an Entity within CuratorPlatform.

Later Assertions enrich this Entity but never replace its original technical identity.

## Axiom 2 – Knowledge consists of Assertions

The system does not primarily store facts.

It stores assertions made by agents within contexts and supported by evidence.

## Axiom 3 – Relations are Assertions

A relation is not a separate primitive.

A relation is an Assertion whose predicate connects a subject and an object.

## Axiom 4 – Identity is contextual

Identity is not absolute.

Two things may be identical in one context and different in another.

Examples:

- same file
- same recording
- same work
- same name
- same text
- same manifestation

## Axiom 5 – No implicit inheritance

Structural containment creates context and navigability.

It does not create semantic inheritance.

## Axiom 6 – Absence of assertion is not assertion

If no assertion exists, the system does not infer falsity, absence, or irrelevance.

It remains silent.

## Core Concepts

### Entity

An Entity is the stable identity that emerges from one or more Assertions referring to the same Reference Point within a defined context.

Entities are not primary objects.

They are the persistent focal points around which knowledge accumulates during the lifecycle of the system.

### Assertion

A statement made by an agent about a subject and an object through a predicate, within a context.

### Predicate

The qualified meaning of an assertion.

Predicates belong to controlled vocabularies.

### Evidence

The basis, source, observation, or justification supporting an assertion.

### Agent

The actor or source responsible for making, importing, confirming, rejecting, or modifying an assertion.

### Context

The frame within which an assertion is meaningful.

Examples:

- technical file identity
- musical work identity
- naming identity
- recording identity
- cataloguing context
- user interpretation

### Identity

Identity is not a property.

Identity is a context-bound assertion that two reference points should be treated as the same for a defined purpose.

## Implementation Consequence

The first Swift implementation must not start with Album, Track, Artist, or File.

It must start with:

- Entity
- Assertion
- Predicate
- Evidence
- Agent
- Context
- Identity
## Lifecycle

Reference Point (Note:ReferencePoint is a conceptual notion used to explain the emergence of Entities. It is not necessarily represented as a persistent runtime object.)

↓

first technical Assertion

↓

Entity

↓

additional Assertions

↓

growing knowledge
Reference Point (Note:ReferencePoint is a conceptual notion used to explain the emergence of Entities. It is not necessarily represented as a persistent runtime object.)
        │
        ▼
Technical Assertion
        │
        ▼
      Entity
        │
        ├── technical assertions
        ├── semantic assertions
        ├── contextual assertions
        ├── suggested assertions
        └── accepted assertions
