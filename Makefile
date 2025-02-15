
build:
	@dune build @all @install

doc:
	@dune build @doc

all: build doc

clean:
	@dune clean

test: all
	@dune runtest --no-buffer -f

WATCH?= @all
watch:
	@dune build $(WATCH) -w

install: build
	@dune install

uninstall:
	@dune uninstall

reindent:
	@find src '(' -name '*.ml' -or -name '*.mli' ')' -print0 | xargs -0 echo "reindenting: "
	@find src '(' -name '*.ml' -or -name '*.mli' ')' -print0 | xargs -0 sed -i 's/[[:space:]]*$$//'
	@find src '(' -name '*.ml' -or -name '*.mli' ')' -print0 | xargs -0 ocp-indent -i

opam-deps:
	opam install . --deps-only

.PHONY: build doc all clean test watch install uninstall reindent opam-deps
