#!/usr/bin/env bash

# Exit on error, undefined variables, and pipe failures
set -euo pipefail

# Install texlive
sudo dnf install texlive-scheme-basic

# Pandoc needs specific packages like lm (Latin Modern fonts) and ec (European Computer Modern fonts)
sudo dnf install 'tex(lm.sty)'

sudo dnf install latexmk

sudo dnf install texlive-collection-langspanish

# Set letter as default paper size
# install the missing TeX Live configuration package first:
sudo dnf install texlive-tetex
sudo dnf install texlive-texlive-scripts-extra
sudo texconfig-sys paper letter

