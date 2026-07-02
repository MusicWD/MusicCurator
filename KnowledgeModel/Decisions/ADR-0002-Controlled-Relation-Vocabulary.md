# ADR-0002 – Controlled Relation Vocabulary

Status: Draft  
Date: 2026-07-02

## Context

Relations such as alias_of, refers_to, based_on_same_text, and part_of require stable meaning.

Free-text relation labels would make the system inconsistent.

## Decision

Relation qualifiers will form a finite controlled vocabulary.

New qualifiers may be added only if no existing qualifier adequately models the case.

## Consequences

Each qualifier must have:
- definition
- direction
- examples
- counterexamples
- allowed source and target types
