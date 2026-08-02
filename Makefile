.PHONY: help venv docs html linkcheck serve clean lint reformat

VENV := .venv
PYTHON := $(VENV)/bin/python
SPHINXBUILD := $(VENV)/bin/sphinx-build
SOURCEDIR := docs
BUILDDIR := docs/_build

help:  ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2}'

venv:  ## Create the virtual environment and install documentation dependencies
	test -d $(VENV) || uv venv
	uv pip install -qU -e ".[docs]"

docs: html  ## Alias for html

html: venv  ## Build the HTML documentation
	$(SPHINXBUILD) -b html -W --keep-going $(SOURCEDIR) $(BUILDDIR)/html

linkcheck: venv  ## Check that all external links resolve
	$(SPHINXBUILD) -b linkcheck $(SOURCEDIR) $(BUILDDIR)/linkcheck

serve: html  ## Build and serve the documentation locally
	$(PYTHON) -m http.server --directory $(BUILDDIR)/html 8000

clean:  ## Remove build artifacts
	rm -rf $(BUILDDIR)

lint: venv  ## Lint the configuration sources
	uvx ruff check .

reformat:  ## Format the configuration sources
	uvx ruff format .
