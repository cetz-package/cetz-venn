#set page(width: auto, height: auto)
#import "/src/lib.typ": venn2, venn3
#import "/tests/helper.typ": *

// Import the minimum supported cetz version
#import "@preview/cetz:0.2.0"

#import cetz.draw: content, set-style

#test-case({
  venn2()
})

#test-case({
  venn3()
})
