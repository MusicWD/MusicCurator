# MusicCurator Glossary

## Leitprinzip

MusicCurator models music, knowledge and relationships, not files.

Die Datei ist nur der technische Träger. Die zentrale Einheit ist die musikalische Information: Werk, Aufnahme, Mitwirkende, Kategorien und deren Beziehungen.

---

## Work / Werk

Ein Werk ist eine eigenständige musikalische Schöpfung.

Beispiele:
- Die Zauberflöte, KV 620
- Matthäuspassion, BWV 244
- Sinfonie Nr. 5 c-Moll, op. 67
- Goldberg-Variationen, BWV 988
Ein Werk wird beschrieben durch Titel, ggf.Verzeichnisnummer (KV620) ggf. Tonart und Bezeichnung durch den Komponisten/Musikologe... (z.B. Oratorium, für drei Solostimmen und Streichorchester,...) 


Ein Werk kann Teile enthalten:
- Akt
- Szene
- Satz
- Nummer
- Arie
- Rezitativ
- Variation

Ein Werk ist unabhängig von:
- einer bestimmten Aufnahme
- einem Album
- einer Datei
- einem Interpreten

---

## Work Part / Werkteil

Ein Werkteil ist ein identifizierbarer Bestandteil eines Werks.

Beispiele:
- Akt I
- Satz II: Andante
- Nr. 39: Erbarme dich
- Variation 13
- Ouvertüre

Ein Werkteil ersetzt nicht das Werk, sondern gehört zu ihm.

---

## Recording / Aufnahme

Eine Aufnahme ist eine konkrete musikalische Realisierung eines Werks oder Werkteils.

Sie wird bestimmt durch:
- Mitwirkende
- Dirigent
- Orchester
- Solisten
- Aufnahmejahr
- Ort
- Live/Studio
- ggf. Label/Produktion

Eine Aufnahme kann auf mehreren Veröffentlichungen und in mehreren Dateien existieren.

---

## Release / Veröffentlichung

Eine Veröffentlichung ist eine konkrete Ausgabe einer Aufnahme oder Sammlung.

Beispiele:
- CD-Ausgabe
- Box Set
- Download-Album
- Compilation
- Remaster
- Gesamtaufnahme
- Ausschnitte

---

## File / Datei

Eine Datei ist der technische Speicherort einer Aufnahme oder eines Teils davon.

Beispiele:
- MP3
- AAC
- ALAC
- FLAC
- AIFF

Eine Datei ist nicht die Musik selbst.

---

## Person

Eine Person ist ein realer Mensch.

Beispiele:
- Johann Sebastian Bach
- Herbert von Karajan
- Anne-Sophie Mutter
- Dietrich Fischer-Dieskau

Composer, Conductor, Artist, Soloist sind keine Personen, sondern Rollen.

---

## Ensemble

Ein Ensemble ist eine Gruppe von Mitwirkenden.

Beispiele:
- Wiener Philharmoniker
- Berliner Philharmoniker
- Arnold Schoenberg Chor
- Emerson String Quartet

---

## Credit / Mitwirkung

Ein Credit beschreibt die Beteiligung einer Person oder eines Ensembles an einer Aufnahme.

Beispiele:
- Herbert von Karajan – Dirigent
- Anne-Sophie Mutter – Solistin, Violine
- Dietrich Fischer-Dieskau – Solist, Bariton
- Wiener Philharmoniker – Orchester

---

## Role / Rolle

Eine Rolle beschreibt die Funktion eines Mitwirkenden.

Beispiele:
- Komponist
- Dirigent
- Solist
- Sänger
- Orchester
- Chor
- Arrangeur
- Bearbeiter
- Textdichter
---

## Instrument

Ein Instrument beschreibt, womit eine Person oder ein Ensemble musiziert.

Beispiele:
- Violine
- Klavier
- Oboe
- Klarinette
- Cello
- Orgel

---

## Voice Type / Stimmlage

Eine Stimmlage beschreibt eine vokale Funktion.

Beispiele:
- Sopran
- Mezzosopran
- Alt
- Tenor
- Bariton
- Bass

---

## Category / Kategorie

Eine Kategorie ist ein frei kombinierbares Attribut.

Beispiele:
- Barock
- Oper
- R&B
- Gesamtaufnahme
- Ausschnitte
- Compilation
- Liveaufnahme
- Studioaufnahme

Kategorien sind n:m-Beziehungen, nicht einfache Felder.

---

## Category Type / Kategorietyp

Ein Kategorietyp ordnet Kategorien fachlich.

Beispiele:
- Epoche
- Musikstil
- Gattung
- Besetzung
- Albumtyp
- Aufnahmeart
- Exportgruppe

---

## Grundregel

Alles, was mehrfach vorkommen kann, wird relational modelliert.

Nicht:

Track.genre = "Barock"

Sondern:

Track → CategoryAssignment → Category

---

## Work Relation / Werkbeziehung

Eine Werkbeziehung beschreibt eine fachliche, musikalische oder persönliche Beziehung zwischen zwei Werken.

Beispiele:
- verwandte Stimmung
- ähnliche Besetzung
- gleiche Epoche
- thematische Nähe
- musikalischer Kontrast
- passt gut danach
- persönliche Assoziation
- beeinflusst von
- erinnert an

Werkbeziehungen können objektiv oder subjektiv sein.

Eine Werkbeziehung kann benannt, kommentiert und später grafisch dargestellt werden.

Beispiel:

Mahler: Sinfonie Nr. 2  
→ verwandte Stimmung →  
Bruckner: Sinfonie Nr. 8

---

## Knowledge Layer / Wissensebene

Der Knowledge Layer enthält Informationen, die über reine Metadaten hinausgehen.

Dazu gehören:
- persönliche Assoziationen
- Werkbeziehungen
- Kommentare
- Hörnotizen
- Empfehlungen
- kuratierte Zusammenhänge
- thematische Pfade durch die Sammlung

Der Knowledge Layer macht MusicCurator zu mehr als einer Musikdatenbank: zu einer persönlichen Musik-Wissensbasis.
