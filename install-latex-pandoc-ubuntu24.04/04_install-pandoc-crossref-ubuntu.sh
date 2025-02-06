# author: Rogelio Prieto Alvarado
# date: may 2021
# note: execute this script using sudo.

#install latest pandoc version
sudo tar xvf pandoc-crossref-Linux-X64.tar.xz -C /usr/local/bin
sudo mv /usr/local/bin/pandoc-crossref.1 /usr/local/man/man1
echo -e  "\n\n---------------------------------------------------------------------"
echo "The lastest pandoc-crossref version v0.3.11.0a (june 2021) was installed."
echo "pandoc-crossref-Linux.tar.xz"
echo "---------------------------------------------------------------------"
echo "pandoc-crossref --version"
pandoc-crossref --version
