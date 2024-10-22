# author: Rogelio Prieto Alvarado
# date: oct 2024
# note: execute this script using sudo.

#download pandoc
MYFILE=pandoc-3.5-linux-amd64.tar.gz
wget https://github.com/jgm/pandoc/releases/download/3.5/$MYFILE
#install latest pandoc version
tar xvzf $MYFILE --strip-components 1 -C /usr/local
echo  "\n\n---------------------------------------------------------------------"
echo "The lastest pandoc version (sept 2024) was installed."
echo $MYFILE
echo "---------------------------------------------------------------------"
