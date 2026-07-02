# Example – Album and Track without Inheritance

## Case

An album is described as Jazz.

A track on that album is described as Free Improvisation.

## Model

```text
AlbumA hasGenre Jazz
Track3 hasGenre FreeImprovisation
Track3 part_of AlbumA
```

## Interpretation

The structural relation creates containment and navigability.

It does not transfer the album genre to the track.
