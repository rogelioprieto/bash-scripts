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



#setup tlmgr (package manager) in user mode
tlmgr init-usertree
#tlmgr repository add ftp://tug.org/historic/systems/texlive/2021/tlnet-final
#tlmgr repository list
#tlmgr repository remove http://mirror.ctan.org/systems/texlive/tlnet
#tlmgr option repository ftp://tug.org/historic/systems/texlive/2021/tlnet-final
#tlmgr option repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2021/tlnet-final/
tlmgr option repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2023/tlnet-final/


#install latex packages required by the beamer template (slides template)
#tlmgr --verify-repo=none install mypackagename
tlmgr --verify-repo=none install pgf
tlmgr --verify-repo=none install upquote
tlmgr --verify-repo=none install ulem

#end instruction to print every executed command
trap - DEBUG



#Message/information for the user:
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
echo "to install new TexLive (LaTeX) packages you should add the "
echo "parameter --verify-repo=none to this command line:"
echo -e "\n tlmgr --verify-repo=none install mypackagename\n"
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





