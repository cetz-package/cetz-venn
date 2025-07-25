# Local Variables:
# mode: makefile
# End:
gallery_dir := "./gallery"

package target *options:
  ./scripts/package "{{target}}" {{options}}

install target="@local":
  ./scripts/package "{{target}}"

test *filter:
  tt run {{filter}}

update-test *filter:
  tt update {{filter}}

manual:
  typst c manual.typ manual.pdf

gallery:
  for f in "{{gallery_dir}}"/*.typ; do typst c "$f" "${f/typ/png}"; done
