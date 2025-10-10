#!/bin/bash
#Rogelio Prieto
#date: 9/oct/2025

# Convert md to html using pandoc and
# the templates from:
# https://github.com/ryangrose/easy-pandoc-templates

pandoc slides.md -o slides-bootstrap_menu.html --template=bootstrap_menu.html --toc

pandoc slides.md -o slides-clean_menu.html --template=clean_menu.html --toc

pandoc slides.md -o slides-elegant_bootstrap_menu.html --template=elegant_bootstrap_menu.html --toc

pandoc slides.md -o slides-uikit.html --template=uikit.html --toc

