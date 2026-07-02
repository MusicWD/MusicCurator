# Repository Rules

## Single Source of Truth

Every concept has exactly one canonical home.

## Canonical locations

| Concept | Location |
|---|---|
| Epistemic foundations | KnowledgeModel/Foundations |
| Relation vocabulary | KnowledgeModel/Vocabulary |
| Architecture decisions | KnowledgeModel/Decisions |
| Swift implementation | Application |
| User/developer docs | docs |
| Import source notes | Import/Sources |

## Prohibitions

- No relation qualifier without vocabulary entry.
- No implicit inheritance.
- No Swift concept without KnowledgeModel grounding.
- No foundational model decisions hidden inside UI or persistence code.
