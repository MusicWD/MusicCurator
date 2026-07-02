# 070 – Inheritance and Scope

Status: Accepted  
Version: 0.1

## Core Rule

Containment is not inheritance.

Structural containment creates navigability and context, but no automatic semantic transfer.

## Example

```text
Track part_of Album
```

does not imply:

```text
Track has same genre as Album
Track has same performer as Album
Track has same concept as Album
```

## Default

```text
inheritancePolicy = none
```

Any inheritance-like behaviour must be explicit, local, documented, and reversible.
