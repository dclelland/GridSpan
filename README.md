GridSpan
========

`GridSpan` is a set of screen scale aware [typographic grid](https://en.wikipedia.org/wiki/Grid_(graphic_design)) layout helpers.

GridSpan allows you to specify a `Grid`, with defined columns and rows, a bounds and gutter. You can then use that grid to calculate `CGRect`s for use in layout.

The screen resolution is respected: For example, on a @2x retina screen, GridSpan endeavours to make all cells align to a 0.5pt grid. Generally gutter size is preserved while cells are stretched slightly (since gutters are usually small, the difference between a 2.0pt gutter and a 1.5pt gutter is noticeable, while the difference between a 50.0pt cell and a 50.5pt cell is not).

For example:

```swift

let grid = Grid(
    columns: 4,
    rows: 4,
    bounds: CGRect(
        x: 0.0,
        y: 0.0,
        width: 200.0,
        height: 200.0
    ),
    gutter: CGSize(
        width: 2.0,
        height: 2.0
    )
)
     
let firstCell = grid.bounds(for: 0)
// (0.0, 0.0, 48.5, 48.5)

let secondCell = grid.bounds(for: 1)
// (50.5, 0.0, 48.5, 48.5)

let centerCells = grid.bounds(for: Span(columns: 1...2, rows: 1...2))
// (50.5, 50.5, 99.0, 99.0)
```
