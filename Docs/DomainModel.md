# MusicCurator Domain Model v0.1

## Leitidee

MusicCurator modelliert nicht primär Dateien, sondern Musik in ihren Beziehungen.

Eine Datei ist nur die technische Speicherung einer Aufnahme. Die zentralen fachlichen Objekte sind Werk, Werkteil, Aufnahme, Album, Track, Datei, Personen/Ensembles, Mitwirkungen und Kategorien.

## Grundprinzipien

1. Das Modell ist relational.
2. Alles, was mehrfach vorkommen kann, wird als n:m-Beziehung modelliert.
3. Swinsian ist eine Datenquelle und ein Player, nicht das fachliche Zentrum.
4. MusicCurator führt eine eigene Kurationsdatenbank.
5. Änderungen erfolgen nur über Preview, Backup und kontrolliertes Apply.

## Zentrale Ebenen

### 1. Bibliothek

Die Bibliothek ist die Gesamtheit aller verwalteten Musikobjekte.

Enthält:
- Werke
- Aufnahmen
- Alben
- Tracks
- Dateien
- Personen und Ensembles
- Kategorien
- Regeln
- Quellen

### 2. Menschen und Ensembles

#### Person

Eine natürliche Person, z. B.:
- Johann Sebastian Bach
- Herbert von Karajan
- Anne-Sophie Mutter
- Dietrich Fischer-Dieskau

Personen können unterschiedliche Rollen haben:
- Komponist
- Dirigent
- Solist
- Sänger
- Interpret
- Arrangeur
- Textdichter

#### Ensemble

Eine musikalische Gruppe oder Institution, z. B.:
- Wiener Philharmoniker
- Berliner Philharmoniker
- Arnold Schoenberg Chor
- Emerson String Quartet

Ensembles können Rollen haben:
- Orchester
- Chor
- Kammerensemble
- Band
- Quartett

### 3. Musik

#### Work / Werk

Ein Werk ist die musikalische Komposition als abstrakte Einheit.

Beispiele:
- Matthäuspassion BWV 244
- Sinfonie Nr. 5 c-Moll op. 67
- Die Zauberflöte KV 620
- Kind of Blue

Ein Werk existiert unabhängig von Album, Aufnahme oder Datei.

Attribute:
- Titel
- Untertitel
- Werkverzeichnisnummer, z. B. BWV, KV, Hob., D, op.
- Komponist(en)
- Entstehungsjahr / Epoche
- Werktyp, z. B. Sinfonie, Oper, Konzert, Lied, Jazz-Album

#### WorkPart / Werkteil

Ein Werk kann Teile haben.

Beispiele:
- Satz I: Allegro con brio
- Arie: Erbarme dich
- Ouvertüre
- Rezitativ
- Track innerhalb eines Jazz-Albums

Wichtig: Ein Track soll möglichst nicht nur „Track 4“ sein, sondern einem Werkteil zugeordnet werden können.

#### Recording / Aufnahme

Eine konkrete Aufführung oder Studioproduktion eines Werkes oder Werkteils.

Beispiele:
- Beethoven 5, Karajan, Berliner Philharmoniker, 1963
- Matthäuspassion, Harnoncourt, Concentus Musicus Wien
- Kind of Blue, Miles Davis, 1959

Eine Aufnahme hat Mitwirkende, Datum, Ort, Label und technische Quelle.

#### Album

Ein Veröffentlichungs- oder Sammlungscontainer.

Beispiele:
- CD-Album
- Box Set
- Compilation
- Gesamtaufnahme
- Ausschnitte
- Sampler

Ein Album kann mehrere Werke enthalten. Ein Werk kann auf mehreren Alben vorkommen.

#### Track

Ein Track ist die konkrete Abspieleinheit innerhalb eines Albums oder einer Playlist.

Ein Track kann zu einem Werkteil gehören und verweist auf eine oder mehrere Dateien.

#### File / Datei

Eine Datei ist die technische Speicherform.

Attribute:
- Pfad
- Dateiname
- Format, z. B. MP3, AAC, ALAC, FLAC
- Größe
- Dauer
- Bitrate
- Prüfsumme
- Root-Pfad

## Mitwirkungen / Credits

Mitwirkungen werden nicht als starre Felder gespeichert, sondern als eigene Beziehung.

### Credit

Ein Credit verbindet eine Person oder ein Ensemble mit einem Werk, einer Aufnahme, einem Album oder einem Track.

Beispiele:
- Herbert von Karajan — Dirigent — Aufnahme
- Anne-Sophie Mutter — Solistin — Violine — Aufnahme
- Wiener Philharmoniker — Orchester — Aufnahme
- Christa Ludwig — Solistin — Mezzosopran — Aufnahme

### Role

Rollen beschreiben die Funktion:
- Komponist
- Dirigent
- Solist
- Sänger
- Orchester
- Chor
- Ensemble
- Interpret
- Arrangeur
- Textdichter

### Instrument

Instrumente sind eigene kontrollierte Werte:
- Violine
- Viola
- Violoncello
- Kontrabass
- Klavier
- Orgel
- Flöte
- Oboe
- Klarinette
- Fagott
- Trompete
- Horn

Kurzformen können als Aliase geführt werden:
- V → Violine
- cl → Klarinette
- ob → Oboe
- p → Klavier

### VoiceType / Stimmlage

Stimmlagen sind eigene kontrollierte Werte:
- Sopran
- Mezzosopran
- Alt
- Tenor
- Bariton
- Bass
- Countertenor

Kurzformen können als Aliase geführt werden:
- Sop → Sopran
- Mezzo → Mezzosopran
- Al → Alt
- Ten → Tenor
- Bar → Bariton
- Bas → Bass

## Kategorien

Kategorien sind bewusst nicht identisch mit Genre. Sie sind frei kombinierbare Attribute.

### CategoryType

Zunächst unterscheiden wir:

#### Musikbeschreibende Kategorien

Beispiele:
- Barock
- Klassik
- Romantik
- Oper
- Operette
- Oratorium
- Chor
- Jazz
- R&B
- Soul
- Rock
- Pop
- Filmmusik
- Weihnachtsmusik

#### Album-/Sammlungsbeschreibende Kategorien

Beispiele:
- Gesamtaufnahme
- Ausschnitte
- Compilation
- Liveaufnahme
- Studioaufnahme
- Historische Aufnahme
- Box Set
- Sampler
- Remaster

#### Weitere mögliche Kategoriearten

- Epoche
- Werktyp
- Besetzung
- Anlass
- Quelle
- Kurations-Tag
- Export-Tag

### Category Assignment

Kategorien können an verschiedenen Objekten hängen:
- Werk
- Werkteil
- Aufnahme
- Album
- Track

Beispiel:

Matthäuspassion:
- Musik: Barock, Oratorium, Chor, Passion
- Album: Gesamtaufnahme, Liveaufnahme

Best of Aretha Franklin:
- Musik: Soul, R&B
- Album: Compilation

## Relationen

Wichtige Beziehungen:

- Work 1:n WorkPart
- Work n:m Person über Credit mit Role = Komponist
- WorkPart n:m Track
- Recording n:m Work oder WorkPart
- Recording n:m Person/Ensemble über Credit
- Album n:m Track
- Track 1:n File oder meist 1:1 File
- Work/Recording/Album/Track n:m Category
- Person/Ensemble n:m Alias

## Swinsian-Import

Swinsian-Felder werden zunächst gelesen und auf MusicCurator-Objekte gemappt.

Mögliche Zuordnung:
- title → Track.title oder WorkPart.title
- album → Album.title
- artist → Credit / Interpret
- albumArtist → Album.primaryArtist oder Credit
- composer → Person + Credit(role: Komponist)
- conductor → Person + Credit(role: Dirigent)
- work → Work.title
- movement → WorkPart.number
- movementName → WorkPart.title
- genre → Category oder ImportTag
- location/path → File.path

Wichtig: Importdaten bleiben nachvollziehbar. MusicCurator soll zwischen Originaldaten und kuratierten Daten unterscheiden können.

## Export-Profile

MusicCurator soll später unterschiedliche Präsentationsformen erzeugen können.

Beispiele:
- Master Library
- Swinsian Sync
- Synology / Netzwerk
- USB Autoradio
- Apple / iPhone

Für einfache Player wie Autoradios kann eine redundante Exportstruktur erzeugt werden:
- sprechende Dateinamen
- flache Ordnerstruktur
- kompatible Tags
- Playlists

Die Master-Bibliothek bleibt dabei unverändert.

## Offene Fragen für v0.2

1. Ist ein „Work“ bei Jazz/Pop immer sinnvoll, oder brauchen wir dort flexiblere Werktypen?
2. Soll Album selbst als Werk gelten können, z. B. bei Konzeptalben?
3. Wie unterscheiden wir Aufnahme, Edition und Veröffentlichung genau?
4. Welche Kategoriearten brauchen wir von Anfang an?
5. Wie gehen wir mit unvollständigen Swinsian-Daten um?
6. Wie modellieren wir Mehrfachkomponisten und Bearbeitungen?
7. Wie streng soll die Trennung Person / Ensemble sein?

## Nächster Schritt

Dieses Modell wird fachlich geprüft. Danach erstellen wir daraus:
- DataModel.md
- erstes SQLite-Schema
- Swift Models
- Import-Mapping aus Swinsian
