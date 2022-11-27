# Lectures Template

Template per gli appunti delle lezioni. Questo template automatizza la creazione di epub, pdf e html da file markdown attraverso il tool [Pandoc](https://pandoc.org/).

## Utilizzo

### Inclusione file

Inserisci nel file `includes.txt` i file da includere, uno per riga. I file con le immagini devono essere inseriti nella cartella `images` mentre i capitoli devono essere inseriti nella cartella `chapters`.

_nota: nel file includes non bisogna specificare `./chapters/`, quindi il file in `./chapters/capitolo1.md` verrà indicato con `capitolo1.md`_

### Configurazione

La configurazione contenente titolo, autore ecc è contenuta nel file `config.yaml`.
Le impostazioni che possono essere apportate sono:

- `title`: Titolo del documento.
- `subtitle`: Sottotitolo del documento.
- `author`: Autore del documento.
- `keywords`: Parole chiave del documento.
- `book`: modalità di visualizzazione a libro.
- `date`: data del documento. Di default val `"\\today"` in modo che la data sia recuperata in modo automatico.
- `titlepage`: mostra la copertina.
- `titlepage-color`: colore della copertina.
- `titlepage-text-color`: colore del testo della copertina (inserire hex senza `#`).
- `titlepage-background`: immagine di sfondo della copertina.
- `titlepage-rule-height`: mostra una linea in alto a destra della copertina, solitamente disabilitato.
- `toc-own-page`: mostra la tabella dei contenuti su una pagina a parte.
- `first-chapter`: Il numero da cui far partire la numerazione dei capitoli.

### Immagine di copertina

Sono disponibili nella cartella `assets` le copertine per il _Politecnico di Torino_ e l'_Università di Pisa_. Per adoperarle è sufficiente rinominare il file desiderato in `background.pdf`. E' inoltre presente il template `background.svg` in formato vettoriale come riferimento per eseguire le modifiche.  

## Compilazione

Per compilare il progetto sia in formato pdf che html è sufficiente avviare lo script `compile.bat`, automaticamente verrà generato il file pdf, html ed epub all'interno della cartella `output`, con il nome della **cartella** (può essere modificato nel file `compile.bat`).


## Installazione

Per utilizzare il template è necessario installare le seguenti dipendenze:

- [Pandoc Latex Template](https://github.com/Wandmalfarbe/pandoc-latex-template)
- [Easy Pandoc Templates](https://github.com/ryangrose/easy-pandoc-templates)
- [Latex](https://miktex.org/download)
- [Pandoc](https://pandoc.org/installing.html)

### 1. Download repository

Scarica questa repository di esempio:

```bash
git clone https://github.com/Guray00/template_lectures
```

oppure attraverso il comando scaricando da questa pagina come zip da [qui](https://github.com/Guray00/template_lectures/archive/refs/heads/master.zip).

### 1.5 Estrai la cartella (se scaricato zip)

Se hai scaricato lo zip dal link, estrai la cartella, ed entra al suo interno.

### 2. Installa le dipendenze

Installa le dipendenze necessarie per la compilazione dei file eseguendo il file `install.bat`.


### 3. Installa le estensioni per vscode [opzionale]

Al fine di avere un'esperienza migliore, è consigliato installare le seguenti estensioni per vscode:
```text
bierner.markdown-emoji
bierner.markdown-yaml-preamble
darkriszty.markdown-table-prettify
DavidAnson.vscode-markdownlint
telesoho.vscode-markdown-paste-image
streetsidesoftware.code-spell-checker
streetsidesoftware.code-spell-checker-italian
yzane.markdown-pdf
yzhang.markdown-all-in-one
```

Tale operazione può essere semplificata eseguendo lo script `vscode_extensions.bat`.

### 4. Rimuovi file inutili

Cancella `install.bat`.

### Inizia

Inizia la scrittura dei tuoi appunti! **Nota:** Al primo avvio mancheranno alcune dipendenze per il latex, leva la spunta alla schermata di installazione pacchetto "show always" e premi su "install". In questo modo verranno installati i pacchetti necessari senza doverlo eseguire manualmente.
