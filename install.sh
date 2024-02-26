#!/bin/sh
function check_distro() {
    echo "Checking distribution..."

    os_release=$(cat /etc/os-release)
    distribution=$(echo "$os_release" | grep -oP 'ID_LIKE=".*?"' | cut -d'"' -f2)

    # Assign the value directly without return
    distro="$distribution"
}

# scritta iniziale
echo Benvenuto nell'installer del template
echo verra' installato, in ordine:
echo - latex
echo - pandoc
echo - template per PDF
echo - template per WEB
echo

# controllo la distribuzione
check_distro

# INSTALLAZIONE LATEX

if [ "$distro" = "Ubuntu" ] || [ "$distro" = "ubuntu" ]; then
    # Installa TeX Live su Ubuntu
    echo "Installazione di TeX Live"
    sudo apt install texlive
    sudo apt-get install texlive-generic-extra
    sudo apt-get install texlive-extra
    sudo apt-get install texlive-fonts-recommended texlive-fonts-extra

    echo "TeX Live installato correttamente!"

    # Installa Pandoc su Ubuntu
    echo "Installazione di Pandoc"
    sudo apt-get install pandoc
    echo pandoc installato.

elif [ "$dis" = "Arch" ] || [ "$distro" = "arch" ]; then
    # Installa TeX Live su Arch
    echo "Installazione di TeX Live"
    sudo pacman -S --needed  texlive

    echo "TeX Live installato correttamente!"

    # Installa Pandoc su Arch
    echo "Installazione di Pandoc"

    sudo pacman -S --needed pandoc
    echo pandoc installato.

    pip install pandoc-latex-environment --break-system
    echo pandoc-latex-environment installato.

fi

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