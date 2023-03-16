#!/bin/bash

# nome del file di output, modifica questo campo per avere un nome personalizzato
OUTPUT=

# se non viene inserito un nome, lo si recupera dal nome della cartella
if [ -z "$OUTPUT" ]
then
      OUTPUT=$(basename "$PWD") 
fi

# enviromnment variables
CHAPTERS_PATH=./chapters/
RESOURCES_PATH=./chapters/
ASSETS_PATH=./assets/

# crea la cartella per gli output
mkdir -p output


# verifica pandoc installato
if ! command -v pandoc -v &> /dev/null
then
    echo "Pandoc non risulta installato."
    exit
fi

# verifica latex installato
if ! command -v latex -v &> /dev/null
then
    echo "Latex non risulta installato."
    exit
fi

# [TODO] verificare pandoc-latex-environment installato

# controllo se il precedente non esiste
if [ ! -f "./assets/.previous.md" ]
then
    touch "./assets/.previous.md"
fi

# nomi dei file di output che verranno generati
PDFNAME="./output/${OUTPUT}.pdf"
WEBNAME="./output/${OUTPUT}.html"
EPUBNAME="./output/${OUTPUT}.epub"


# verifica python e pandoc latex environment

# crea un array con tutti i file contenuti in includes.txt
readarray -t files < includes.txt

# crea una stringa con tutti i file contenuti in includes.txt
str_files=""
for i in "${files[@]}"
do
   str_files+="${CHAPTERS_PATH}${i} "
done

# [TODO] stampa il nome del file con *

# stampa l'elenco dei file
for i in "${files[@]}"
do
  echo "${i}"
done
echo 

# creo il file unito attuale
pandoc -s ${str_files} -o "./assets/.actual.md" 

if [[ ! $(diff ./assets/.previous.md ./assets/.actual.md) ]]; then
  echo "Nessuna modifica riscontrata"
  exit 
fi

# esegue il comando di creazione
echo Creazione "${OUTPUT}.pdf" in corso...
pandoc --pdf-engine=xelatex -s ${str_files} -o "${PDFNAME}" --from markdown --template eisvogel.latex --listings --number-sections --top-level-division=chapter -V toc=true --resource-path="./output/" --standalone --metadata-file=config.yaml --filter pandoc-latex-environment --mathjax
echo Compilazione PDF terminata.
echo

# export per la visualizzazione web
echo Creazione "${OUTPUT}.html" in corso...
pandoc -s ${str_files} -o "${WEBNAME}" --template=./assets/theme.html --toc --standalone --resource-path="./output/" --metadata-file=config.yaml --mathjax 
echo Compilazione HTML terminata.
echo

# export per la visualizzazione epub
echo Creazione "${OUTPUT}.epub" in corso...
pandoc -s ${str_files} -o "${EPUBNAME}" --standalone --resource-path="./output/" --metadata-file=config.yaml --toc --css ./assets/epub.css
echo Compilazione EPUB terminata.
echo

# --resource-path="./output/" specifica a partire da quale path recuperare le risorse, lo rende coerente al md
# --standalone permette il funzionamento anche fuori dalla cartella

# aggiorno il file per il controllo del precedente
rm ./assets/.previous.md
mv ./assets/.actual.md ./assets/.previous.md

echo Esportazione terminata.