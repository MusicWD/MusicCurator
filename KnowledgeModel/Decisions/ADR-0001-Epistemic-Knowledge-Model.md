# ADR-0001 – Epistemic Knowledge Model

Status: Accepted  
Date: 2026-07-02

## Context

The project began as a model for managing a music collection. During modelling of relations, aliases, works, tracks, and semantic references, it became clear that a classical metadata model is insufficient.

The system must be able to represent conflicting, incomplete, contextual, and sourced knowledge.

## Decision

The project will use an epistemic knowledge model.

The fundamental concepts are:

- Entity
- Relation
- Assertion
- Evidence
- Agent

The model does not store absolute truth.  
It stores assertions made by agents, supported by evidence, within a scope and context.

## Consequences

- Traditional attributes become assertions.
- Assertions require provenance where possible.
- Relations are first-class objects.
- Missing assertions are not interpreted as negative assertions.
- The system may explicitly remain silent where no justified assertion exists.
