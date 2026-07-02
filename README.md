# MusicKnowledge

MusicKnowledge is a platform for modelling knowledge about cultural objects.

The project does not merely store metadata. It models assertions about entities, including their origin, evidence, scope, and epistemic status.

## Repository 1.0

The repository is structured around a strict separation of concerns:

- `KnowledgeModel/` – What the system means.
- `Application/` – How the system is implemented.
- `Import/` – How external data enters the system.
- `Resources/` – Static resources used by the application.
- `Scripts/` – Automation and maintenance scripts.
- `Tests/` – Test infrastructure.
- `docs/` – User-facing and developer-facing documentation.

## Core Principle

Every piece of knowledge has exactly one canonical home.
