#set page(width: auto, height: auto)
#import "/src/lib.typ": venn2
#import "/tests/helper.typ": *

#import cetz.draw: content, set-style

#test-case({
  venn2(name: "v")
  content("v.a",  [A])
  content("v.b",  [B])
  content("v.ab", [AB])
  content("v.not-ab", [not AB], anchor: "south-west")
})

#test-case({
  venn2(a-fill: red)
})

#test-case({
  venn2(b-fill: red)
})

#test-case({
  venn2(ab-fill: red)
})

#test-case({
  venn2(not-ab-fill: red)
})

#test-case({
  set-style(venn: (stroke: blue, fill: gray))
  venn2(name: "v", a-stroke: black, b-fill: green)
})
