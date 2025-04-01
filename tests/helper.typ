#import "@preview/cetz:0.3.4"
#import "/src/lib.typ" as venn

/// Test case canvas surrounded by a red border
#let test-case(body, ..canvas-args, args: none) = {
  if type(body) != function {
    body = _ => { body }
    args = (none,)
  } else {
    assert(type(args) == array and args.len() > 0,
      message: "Function body requires args set!")
  }

  for arg in args {
    block(stroke: 2pt + red,
      cetz.canvas(..canvas-args, {
        body(arg)
      })
    )
  }
}
