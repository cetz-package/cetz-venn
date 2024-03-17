#set page(width: auto, height: auto)
#import "/src/lib.typ": venn3
#import "/tests/helper.typ": *

#import cetz.draw: content, set-style, scale

#test-case({
  venn3(name: "v")
  content("v.a",  [A])
  content("v.b",  [B])
  content("v.c",  [C])
  content("v.ab", [AB])
  content("v.bc", [BC])
  content("v.ac", [AC])
  content("v.abc", [\*])
  content("v.not-abc", [not ABC], anchor: "south-west")
})

#test-case({
  venn3(a-fill: red)
})

#test-case({
  venn3(b-fill: red)
})

#test-case({
  venn3(c-fill: red)
})

#test-case({
  venn3(ab-fill: red)
})

#test-case({
  venn3(bc-fill: red)
})

#test-case({
  venn3(ac-fill: red)
})

#test-case({
  venn3(abc-fill: red)
})

#test-case({
  venn3(not-abc-fill: red)
})

#test-case({
  set-style(venn: (stroke: blue, fill: gray))
  venn3(name: "v", a-stroke: black, ab-fill: green)
})
