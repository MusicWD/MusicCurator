# Repository Architecture

Status: Draft

## Nomenclature

### CuratorRepository

The Git repository and top-level project container.

### CuratorFramework

The shared framework used by all Curator applications.

Contains:

- KnowledgeModel
- SharedSource
- Import
- Research
- Resources
- Scripts
- Tests
- docs

### CuratorApps

Container for concrete applications.

Examples:

- MusicCurator
- DVDCurator
- BookCurator

## Target Structure

```text
CuratorRepository
├── CuratorFramework
│   ├── KnowledgeModel
│   ├── SharedSource
│   ├── Import
│   ├── Research
│   ├── Resources
│   ├── Scripts
│   ├── Tests
│   └── docs
│
├── CuratorApps
│   └── MusicCurator
│       ├── CuratorPlatform.xcodeproj
│       └── MusicCurator
│
├── README.md
├── REPOSITORY_RULES.md
└── COMMIT_STRATEGY.md
