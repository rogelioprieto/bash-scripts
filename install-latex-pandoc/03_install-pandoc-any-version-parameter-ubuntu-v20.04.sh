# author: Rogelio Prieto Alvarado
# date: january 2021
# note: execute this script using sudo.

#install latest pandoc version
echo "se utilizará el archivo:$1"
tar xvzf $1 --strip-components 1 -C /usr/local
echo  "\n\n---------------------------------------------------------------------"
##echo "The lastest pandoc version (january 2021) was installed."
echo "$1 was installed."
echo "---------------------------------------------------------------------"
