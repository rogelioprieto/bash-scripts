#!/bin/bash
#author: Rogelio Prieto Alvarado
#date: june 2026
#objetive: install latex packages requried by pandoc, in Fedora 43

# Install latex packages required by the beamer template (slides template)
sudo dnf install texlive-pgf texlive-upquote texlive-ulem
# Install LaTeX package required by RPA report template
sudo dnf install 'tex(footnote.sty)'

echo -e "\n---------------------------------------------------------------------"
echo "---------------------------------------------------------------------"
echo -e "$(date)\nLaTeX was installed with this packages and settings:"
echo "1. texlive-latex-base"
echo "2. latexmk"
echo "3. texlive-lang-spanish"
echo "4. texlive-fonts-recommended"
echo "5. cm-super package"
echo "6. letter paper size set as default"
echo "7. The default ftp repository was updated"
echo "8. pgf package"
echo "9. upquote package"
echo "---------------------------------------------------------------------"
echo "---------------------------------------------------------------------"
echo -e "\n%%%%%%%%%%% IMPORTANT NOTE!!!! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "to install new TexLive (LaTeX) packages you use:"
echo -e "\n sudo dnf install texlive-mypackagename"
echo "just replace mypackagename with the package name you want to install."
echo "---------------------------------------------------------------------"

