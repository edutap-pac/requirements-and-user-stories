"""Sphinx configuration for the eduTAP PAC requirements documentation."""

project = "eduTAP PAC"
project_copyright = "2026, the eduTAP PAC contributors"
author = "eduTAP PAC contributors"

extensions = [
    "myst_parser",
    "sphinx_copybutton",
    "sphinx_design",
    "sphinxcontrib.mermaid",
]

myst_enable_extensions = [
    "attrs_block",
    "colon_fence",
    "deflist",
    "linkify",
    "substitution",
]

myst_heading_anchors = 3

templates_path = ["_templates"]
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]

html_theme = "furo"
html_static_path = ["_static"]
html_title = "eduTAP PAC"

_REPOSITORY = "https://github.com/edutap-pac/requirements-and-user-stories/"

html_theme_options = {
    "source_repository": _REPOSITORY,
    "source_branch": "main",
    "source_directory": "docs/",
    "navigation_with_keys": True,
}

# The OSDP specification is distributed by the Security Industry
# Association and is not reachable without accepting their terms,
# so linkcheck must not follow it.
linkcheck_ignore = [
    r"https://www\.securityindustry\.org/.*",
]
