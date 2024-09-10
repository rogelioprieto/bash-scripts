#!/bin/bash
#author: Rogelio Prieto Alvarado
#date: july 2024

function debug {
  echo " "
  echo "################"
  echo "$BASH_COMMAND"
  echo "################"
  echo " "
}

#to print every command
trap debug DEBUG


sudo apt-get -y install texlive-latex-base
pdflatex myfile.tex
sudo apt-get -y install latexmk

#compile an example file
latexmk -pdf myfile.tex
#delete temporary files
rm myfile.aux  myfile.fdb_latexmk  myfile.fls  myfile.log

sudo apt-get -y install texlive-lang-spanish
sudo apt-get -y install texlive-fonts-recommended


sudo apt-get -y install cm-super

#Change to letter paper size  (option 1)
#cd ~
#mkdir texmf
#tlmgr init-usertree
#sudo tlmgr paper letter
 
#Change to letter paper size  (option 2) 
#note this option doesn't work in ubuntu 20.04 because is not install libpaper package
sudo dpkg-reconfigure libpaper1
 
# Change to letter paper size  (option 3)
#note: this option doesn't work in Ubuntu because is You are using tlmgr as shipped with Debian. In Debian tlmgr always runs in user mode as clearly indicated in the output.
#sudo tlmgr init-usertree
#sudo tlmgr paper letter

# Change to letter paper size  (option 4)
#note: it works for ubuntu. Tested in Ubuntu 20.04
#sudo paperconfig --paper letter

#package required for the tlmgr (package manager)
sudo apt-get -y install xzdec

#end instruction to print every executed command
trap - DEBUG


