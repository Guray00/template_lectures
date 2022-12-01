#!/bin/sh

# scritta iniziale
echo Benvenuto nell'installer del template
echo verra' installato, in ordine:
echo - latex
echo - pandoc
echo - template per PDF
echo - template per WEB
echo

# INSTALLAZIONE LATEX
sudo apt install texlive 
sudo apt-get install texlive-generic-extra
sudo apt-get install texlive-extra
sudo apt-get install texlive-fonts-recommended texlive-fonts-extra

echo latex installato.
echo 

# INSTALLAZIONE PANDOC
sudo apt install pandoc
echo pandoc installato.
echo 

echo Sto copiando i template...
# creo il path per i template
mkdir -p ~/.pandoc/templates
touch ~/.pandoc/templates/eisvogel.latex
touch ~/.pandoc/templates/elegant_bootstrap_menu.html

# scarico template latex
curl 'https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex' > ~/.pandoc/templates/eisvogel.latex


# scarico template web
curl 'https://raw.githubusercontent.com/ryangrose/easy-pandoc-templates/master/html/elegant_bootstrap_menu.html' > ~/.pandoc/templates/elegant_bootstrap_menu.html
echo template copiati.
echo

echo Installazione terminata.