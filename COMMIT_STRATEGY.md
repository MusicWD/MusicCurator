# Commit Strategy

## Principle

Commits should describe decisions and implementation separately.

## Examples

Good:

```text
ADR-0001 define epistemic knowledge model
ADR-0002 introduce controlled relation vocabulary
Implement Entity and Assertion domain types
```

Avoid:

```text
stuff
updates
more files
```

## Rule

A foundational model change should be committed before its implementation.
