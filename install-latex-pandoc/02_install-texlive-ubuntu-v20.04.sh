#author: Rogelio Prieto Alvarado
#date: january 2021

sudo apt-get -y install texlive-latex-base
pdflatex myfile.tex
sudo apt-get -y install latexmk
latexmk -pdf myfile.tex
 
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


#setup tlmgr (package manager) in user mode
tlmgr init-usertree
sudo apt-get -y install xzdec
tlmgr repository add ftp://tug.org/historic/systems/texlive/2019/tlnet-final
tlmgr repository list
tlmgr repository remove http://mirror.ctan.org/systems/texlive/tlnet
tlmgr option repository ftp://tug.org/historic/systems/texlive/2019/tlnet-final

rm myfile.aux  myfile.fdb_latexmk  myfile.fls  myfile.log
echo "---------------------------------------------------------------------"
echo "---------------------------------------------------------------------"
echo " LaTeX was installed with this packages and settings:"
echo "1. texlive-latex-base"
echo "2. latexmk"
echo "3. texlive-lang-spanish"
echo "4. texlive-fonts-recommended"
echo "5. cm-super package"
echo "6. letter paper size set as default"
echo "7. The default ftp repository was updated"
echo "---------------------------------------------------------------------"
echo "---------------------------------------------------------------------"
echo "%%%%%%%%%%% IMPORTANT NOTE!!!! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "to install new TexLive (LaTeX) packages you should add the "
echo "parameter --verify-repo=none to this command line:"
echo "tlmgr --verify-repo=none install mypackagename"
echo " "
echo "just replace mypackagename with the package name you want to install."
echo "Use the parameter is necessary because the keys of the main TeX Live 2019"
echo "repo have also expired as of April 7, 2020. And if you omited the "
echo "parameter you 'll get this error:  "
echo "tlmgr: unexpected return value from verify_checksum: -5 for main repository"
echo "You can read this post: "
echo "https://tex.stackexchange.com/questions/537376/tlmgr-unexpected-return-value-from-verify-checksum-5-for-main-repository/537379#537379"
echo "---------------------------------------------------------------------"


#Package required by pandoc 2.14 to convert to pdf
#tlmgr --verify-repo=none install letltxmacro
