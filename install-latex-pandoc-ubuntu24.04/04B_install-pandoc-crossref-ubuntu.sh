# author: Rogelio Prieto Alvarado
# date: nov 2025
# note: execute this script using sudo.

#install latest pandoc version
FILE=pandoc-crossref-Linux-X64--v0.3.22a.tar.xz
sudo tar xvf ${FILE} -C /usr/local/bin
sudo mv /usr/local/bin/pandoc-crossref.1 /usr/local/man/man1
echo -e  "\n\n---------------------------------------------------------------------"
echo "The lastest pandoc-crossref version v0.3.22a (oct 2025) was installed."
echo ${FILE}
echo "---------------------------------------------------------------------"
echo "pandoc-crossref --version"
pandoc-crossref --version
