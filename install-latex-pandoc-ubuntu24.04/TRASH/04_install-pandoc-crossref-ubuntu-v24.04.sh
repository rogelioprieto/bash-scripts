# author: Rogelio Prieto Alvarado
# date: sept 2024
# note: execute this script using sudo.

#install latest pandoc version
sudo tar xvf pandoc-crossref-Linux.tar.xz -C /usr/local/bin
sudo mv /usr/local/bin/pandoc-crossref.1 /usr/local/man/man1
echo -e  "\n\n---------------------------------------------------------------------"
echo "The lastest pandoc-crossref version v0.3.18.0 (sept 2024) was installed."
echo "pandoc-crossref-Linux.tar.xz"
echo "---------------------------------------------------------------------"
echo "pandoc-crossref --version"
echo ""
pandoc-crossref --version
