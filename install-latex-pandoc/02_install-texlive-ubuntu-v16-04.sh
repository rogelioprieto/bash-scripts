#author: Rogelio Prieto Alvarado
#date: june 2017

sudo apt-get -y install texlive-latex-base
pdflatex myfile.tex
sudo apt-get -y install latexmk
latexmk -pdf myfile.tex
 
sudo apt-get -y install texlive-lang-spanish
sudo apt-get -y install texlive-fonts-recommended
 
sudo apt-get -y install cm-super
cd ~
mkdir texmf
tlmgr init-usertree
sudo tlmgr paper letter
 
sudo apt-get -y install xzdec
tlmgr repository add ftp://tug.org/historic/systems/texlive/2015/tlnet-final/
tlmgr repository list
tlmgr repository remove http://mirror.ctan.org/systems/texlive/tlnet
tlmgr option repository ftp://tug.org/historic/systems/texlive/2015/tlnet-final/

rm myfile.aux  myfile.fdb_latexmk  myfile.fls  myfile.log

echo "---------------------------------------------------------------------"
echo " LaTeX was installed with this packages and settings:"
echo "1. texlive-latex-base"
echo "2. latexmk"
echo "3. texlive-lang-spanish"
echo "4. texlive-fonts-recommended"
echo "5. cm-super"
echo "6. letter paper size set as default"
echo "7. update the default ftp repository"
echo "---------------------------------------------------------------------"