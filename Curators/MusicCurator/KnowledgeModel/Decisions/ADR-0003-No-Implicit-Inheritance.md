# ADR-0003 – No Implicit Inheritance

Status: Accepted  
Date: 2026-07-02

## Context

Albums, works, tracks, movements, numbers, and other structural subentities may carry different descriptions.

An album can have one set of assertions while its tracks carry different assertions.

## Decision

Structural containment never implies semantic inheritance.

## Consequences

- Track part_of Album does not imply that album assertions apply to the track.
- Assertions belong only to their explicit subject.
- Any inheritance-like behaviour must be explicitly modelled.
