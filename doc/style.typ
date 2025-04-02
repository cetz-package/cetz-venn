#import "example.typ": example
#import "/src/lib.typ"

#import "@preview/tidy:0.4.2"

#let show-parameter-block(name, types, content, show-default: true, default: none, in-tidy: false, ..a) = {
  if type(types) != array {
    types = (types,)
  }
  stack(dir: ttb, spacing: 1em,
    // name <type>     Default: <default>
    block(breakable: false, width: 100%, stack(dir: ltr,
      [#text(weight: "bold", name + [:]) #types.map(tidy.styles.minimal.show-type).join(" or ")],
      if show-default {
        align(right)[
          Default: #raw(
            lang: "typc",
            // Tidy gives defaults as strings but outside of tidy we pass defaults as the actual values
            if in-tidy { default } else { repr(default) }
          )
        ]
      }
      )),
    // text
    block(inset: (left: .4cm), content)
  )
}

#let parse-show-module(path) = {
  tidy.show-module(
    tidy.parse-module(
      read(path),
      scope: (
        example: example,
      )
    ),
    show-outline: false,
    sort-functions: none,
    style: tidy.styles.default
  )
}
