# Development Method

Status: Living Document

---

# Purpose

This document defines the working principles used for the development of the Curator Repository.

It is intentionally independent of programming language, implementation details or tools.

Its purpose is to ensure architectural consistency, reproducibility and long-term maintainability.

---

# Motto

> *Quidquid agis, prudenter agas et respice finem.*

*"Whatever you do, do it wisely and always keep the final objective in mind."*

Every modification shall bring the repository closer to its intended architecture.

No change shall be performed merely because it appears technically convenient.

---

# Principle 1
## Architecture precedes implementation.

The architecture is always designed before implementation begins.

Programming is the expression of architectural decisions.

It never defines the architecture.

---

# Principle 2
## Definition precedes action.

Every modification begins with a clearly described target state.

The following questions must be answered before implementation begins:

- Where are we?
- Where do we want to arrive?
- Why is this change necessary?

Only after consensus has been reached shall implementation begin.

---

# Principle 3
## There is only one truth.

For every concept there exists exactly one authoritative representation.

Redundant structures are considered architectural defects unless explicitly justified.

---

# Principle 4
## Solve causes instead of symptoms.

Unexpected behaviour shall never be corrected immediately.

The underlying cause must first be identified.

Only then shall corrective actions be performed.

---

# Principle 5
## Work in complete operations.

Every architectural modification follows the same sequence.

Definition

↓

Implementation

↓

Review

↓

Correction

↓

Commit

↓

Documentation

No implementation step shall skip the review phase.

---

# Principle 6
## Small operations.

Large architectural changes are decomposed into independent, reviewable steps.

Each step shall be understandable without requiring knowledge of subsequent steps.

---

# Principle 7
## Reviews are mandatory.

Every review answers three questions.

1. Has the intended goal been reached?

2. Has anything unintended appeared?

3. Is the repository in a stable state suitable for committing?

---

# Principle 8
## Code follows the model.

The conceptual model defines the implementation.

Implementation shall never redefine the conceptual model.

If implementation and model diverge, implementation is reconsidered before the model.

---

# Principle 9
## Documentation accompanies decisions.

Architectural decisions are documented together with their rationale.

Future understanding is considered more important than present memory.

---

# Principle 10
## Stability before speed.

A slower but understandable solution is preferable to a faster but unclear solution.

Temporary shortcuts become permanent complexity.

---

# Principle 11
## One level higher.

Whenever uncertainty arises, move one abstraction level upwards.

Architectural clarity is achieved by understanding context rather than accumulating implementation details.

---

# Principle 12
## Knowledge before software.

The Curator Repository is not primarily a software project.

It is the formalisation of a knowledge model.

Software exists to express this model.

The model does not exist to satisfy the software.

---

# Principle 13
## Shared understanding.

Development is a dialogue.

Ideas are discussed before they are implemented.

Agreement precedes execution.

---

# Principle 14
## Commits document completed thoughts.

A commit represents the completion of a coherent architectural or functional idea.

Commits shall never describe intermediate experiments.

---

# Principle 15
## Respect the future.

Every design decision shall be evaluated not only for the present implementation but also for its consequences for future Curator applications.

The repository is intended to host multiple applications sharing a common framework.

Architecture therefore serves longevity rather than immediacy.

---

# Closing Statement

The Curator Repository is intended to evolve over many years.

Its architecture shall therefore remain understandable, explainable and teachable.

Every contributor is encouraged to improve the repository.

Every improvement shall respect these principles.

The ultimate objective is not merely working software.

The objective is an architecture capable of representing and evolving knowledge.
