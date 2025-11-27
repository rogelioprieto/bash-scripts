# author: Rogelio Prieto Alvarado
# date: oct 2024
# note: execute this script using sudo.

#download pandoc
MYFILE=pandoc-3.8.2.1-linux-amd64.tar.gz
VERSION=3.8.2.1
wget https://github.com/jgm/pandoc/releases/download/${VERSION}/${MYFILE}
#install latest pandoc version
tar xvzf $MYFILE --strip-components 1 -C /usr/local
echo  "\n\n---------------------------------------------------------------------"
echo "The lastest pandoc version (oct 2025) was installed."
echo $MYFILE
echo "---------------------------------------------------------------------"
