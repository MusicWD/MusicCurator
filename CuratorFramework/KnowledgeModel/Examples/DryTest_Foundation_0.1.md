# DryTest – Domain Foundation 0.1

Status: Draft  
Purpose: Test whether Domain Foundation 0.1 can explain real import and knowledge situations.

---

## Test 1 – Technical File Import

### Input

`ABCDE.mp3`

### Observation

The technical system observes a file in the filesystem.

### Initial Assertion

Agent: ImportSystem  
Assertion: `ABCDE.mp3 isFile`  
Evidence: filesystem observation  
Context: technical import

### Result

The file becomes an Entity within CuratorPlatform.

The ReferencePoint remains conceptual. It explains the moment before the first Assertion, but is not implemented as a persistent object.

### Expected Outcome

Pass.

The model can explain how an imported technical object becomes an Entity without requiring prior semantic knowledge.

---

## Test 2 – Filename Interpretation

### Input

`Beethoven Klavierkonzert Nr 5 Satz 1.mp3`

### Existing Entity

The file entity already exists through technical import.

### Suggested Assertions

Agent: SuggestionSystem  
Evidence: filename parsing  
Context: musical interpretation

Suggested Assertions:

- file mayReferTo Beethoven
- file mayReferTo Klavierkonzert Nr. 5
- file mayReferTo Satz 1
- Klavierkonzert Nr. 5 mayBeWork
- Satz 1 mayBePartOf Klavierkonzert Nr. 5
- Klavierkonzert Nr. 5 mayHaveInstrument Klavier
- Klavierkonzert Nr. 5 mayHaveForm Solokonzert
- performance mayRequireRole Solist
- performance mayRequireRole Orchester
- performance mayRequireRole Dirigent

### Result

No truth is asserted automatically.

All semantic enrichments remain suggested Assertions until accepted by an Agent.

### Expected Outcome

Pass.

The model supports associative enrichment without confusing suggestions with facts.

---

## Test 3 – Conflicting Sources

### Input

Two sources assign different works to the same file.

### Assertion A

Agent: MusicBrainzImport  
Assertion: file represents Work A  
Evidence: MusicBrainz record  
Context: external metadata import  
Confidence: 0.75

### Assertion B

Agent: User  
Assertion: file represents Work B  
Evidence: manual correction  
Context: user curation  
Confidence: 0.95

### Result

Both Assertions may coexist.

The system does not overwrite Assertion A with Assertion B.

It records conflict, provenance, confidence and context.

### Expected Outcome

Pass.

The model supports contradiction without data loss.

### Surface Resolution

Assertion B becomes dominant for the current user-facing view because:

- Agent: User
- Confidence: 0.95
- Context: user curation

Assertion A remains preserved.

### Learning Consequence

The system can later learn that manual user corrections are often more reliable than imported metadata for this source/context combination.

---

## DryTest Conclusion

Domain Foundation 0.1 passes the initial dry tests.

The model supports:

- technical import
- emergence of Entities through Assertions
- semantic suggestion
- non-forced knowledge
- contextual identity
- conflicting Assertions
- evidence-based curation

## Dominant Assertion

Conflicting Assertions are not deleted.

At any given time, one Assertion may become the dominant Assertion for a defined surface context.

The dominant Assertion is the one shown in the user interface and used for default interpretation.

Other Assertions remain stored and available for:

- provenance
- review
- conflict analysis
- learning
- future re-evaluation

Dominance is not truth.

Dominance is a temporary, contextual selection among competing Assertions.


suggested
→ accepted
→ dominant
→ revised
→ superseded
→ retained for learning
