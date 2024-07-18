#set page(width: auto, height: auto)
#import "/src/lib.typ": venn2, venn3
#import "/tests/helper.typ": *

// Import all supported cetz versions
#for ver in ("0.2.2",) {
  import ("@preview/cetz:" + ver)
  import cetz.draw: content, set-style

  test-case({
    venn2()
  })

  test-case({
    venn3()
  })
}
