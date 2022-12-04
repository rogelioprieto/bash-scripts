#author: Rogelio Prieto Alvarado
#date: january 2021

sudo apt-get -y remove texlive-latex-base
sudo apt-get -y purge texlive-latex-base

sudo apt-get -y remove latexmk
sudo apt-get -y purge latexmk

 
sudo apt-get -y remove texlive-lang-spanish
sudo apt-get -y purge texlive-lang-spanish
sudo apt-get -y purge texlive-fonts-recommended

sudo apt-get -y remove cm-super
sudo apt-get -y purge cm-super


#follow these steps, url:
#https://tex.stackexchange.com/questions/95483/how-to-remove-everything-related-to-tex-live-for-fresh-install-on-ubuntu
#---------------------------------------------
sudo apt-get purge texlive*
sudo rm -rf /usr/local/texlive/* and rm -rf ~/.texlive*
sudo rm -rf /usr/local/share/texmf
sudo rm -rf /var/lib/texmf
sudo rm -rf /etc/texmf
sudo apt-get remove tex-common --purge
rm -rf ~/.texlive
find -L /usr/local/bin/ -lname /usr/local/texlive/*/bin/* | xargs -r rm
#---------------------------------------------


#additionally 5B step
sudo apt autoremove --purge texlive tex-common
