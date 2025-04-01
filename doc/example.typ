#import "/src/lib.typ"
#import "@preview/cetz:0.3.4"

// String that gets prefixed to every example code
// for compilation only!
#let example-preamble = ""
#let example-scope = (cetz-venn: lib, cetz: cetz)


/// Render an example from a string
#let example(
  /// Example source code -> string | raw
  source,
  /// Arguments passed down to the canvas -> arguments
  ..args,
  /// If true, show the code below the canvas -> boolean
  vertical: false) = {
  if type(source) == content {
    source = source.text
  }

  let radius = .25cm
  let border = 1pt + gray
  let canvas-background = yellow.lighten(95%)

  let picture = eval(example-preamble + source, scope: example-scope)
  let source = box(
    raw(
      source,
      lang: "typc"
    ),
    width: 100%
  )

  block(
    if vertical {
      align(
        center,
        stack(
          dir: ttb,
          spacing: 1em,
          block(
            width: 100%,
            clip: true,
            radius: radius,
            stroke: border,
            table(
              columns: 1,
              stroke: none,
              fill: (c,r) => (canvas-background, white).at(r),
              picture,
              align(left, source)
            )
          ),
        )
      )
    } else {
      block(
        table(
          columns: 2,
          stroke: none,
          fill: (canvas-background, white),
          align: (center + horizon, left),
          picture,
          source
        ),
        width: 100%,
        radius: radius,
        clip: true,
        stroke: border
      )
  }, breakable: false)
}
