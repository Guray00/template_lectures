# Lectures Template

Questo progetto nasce con lo scopo di fornire agli studenti un modo semplice ed efficace per prendere gli appunti durante i corsi seguiti, focalizzandosi sul contenuto senza doversi preoccupare dell'aspetto grafico degli appunti in fase di stesura secondo la metodologia **WYSIWYM**.

> WYSIWYM è l'acronimo di What You See Is What You Mean (letteralmente: quel che vedi è ciò che intendi; sinteticamente, vedi quanto intendi). 
> ~ [Wikipedia](https://it.wikipedia.org/wiki/WYSIWYM)

Il template automatizza la creazione di file esportati in `epub`, `pdf` ed `html` da file markdown attraverso il tool [Pandoc](https://pandoc.org/).

Alcuni esempi esempi sono disponibili di seguito:

<table>
<tr>
    <td> Nome
    <td> PDF
    <td> WEB (ctrl + S)
    <td> EPUB
<tr>
    <td> Lorem Ipsum
    <td> 
        <a href="https://github.com/Guray00/template_lectures/raw/main/Lecture%20Example/output/Lecture%20Example.pdf">PDF</a>
    <td> <a href="https://github.com/Guray00/template_lectures/raw/main/Lecture%20Example/output/Lecture%20Example.html">WEB</a>
    <td> <a href="https://github.com/Guray00/template_lectures/raw/main/Lecture%20Example/output/Lecture%20Example.epub">EPUB</a>
<tr>
    <td> Architetture e sistemi di elaborazione
    <td> 
        <a href="https://lectures.mlampis.dev/Architetture%20e%20sistemi%20di%20elaborazione/output/Architetture%20e%20sistemi%20di%20elaborazione.pdf">PDF</a>
    <td> <a href="https://lectures.mlampis.dev/Architetture%20e%20sistemi%20di%20elaborazione/output/Architetture%20e%20sistemi%20di%20elaborazione.html">WEB</a>
    <td> <a href="https://lectures.mlampis.dev/Architetture%20e%20sistemi%20di%20elaborazione/output/Architetture%20e%20sistemi%20di%20elaborazione.epub">EPUB</a>
<tr>
    <td> Tecnologie e servizi di rete
    <td> 
        <a href="https://lectures.mlampis.dev/Tecnologie%20e%20Servizi%20di%20Rete/output/Tecnologie%20e%20Servizi%20di%20Rete.pdf">PDF</a>
    <td> <a href="https://lectures.mlampis.dev/Tecnologie%20e%20Servizi%20di%20Rete/output/Tecnologie%20e%20Servizi%20di%20Rete.html">WEB</a>
    <td> <a href="https://lectures.mlampis.dev//Tecnologie%20e%20Servizi%20di%20Rete/output/Tecnologie%20e%20Servizi%20di%20Rete.epub">EPUB</a>
</table>

## Configurazione

```text
Your Awesome Lecture
│   compile.bat/.sh
│   config.yaml
│   includes.txt
│
├───assets
│       background.pdf
│       epub.css
│
├───chapters
│       00_introduction.md
│       01_awesome-first-chapter.md
│       02_no-way-another-chapter.md
│
├───images
│       img.jpg
│
└───output
        Lecture Example.epub
        Lecture Example.html
        Lecture Example.pdf
```

Il template è composto da quattro cartelle principali:

- **assets**: contiene il necessario per la generazione della formattazione dell'output come copertina e css.
- **chapters**: contiene i capitoli del documento.
- **images**: contiene le immagini utilizzate nei capitoli.
- **output**: contiene i file generati.

Nella `root` sono invece presenti:

- `compile.bat/.sh`: script per la compilazione del documento.
- `config.yaml`: file di configurazione, contiene tutti i dettagli sul documento da generare.
- `includes.txt`: contiene l'elenco dei capitoli, nell'ordine desiderato, da includere nel documento.

### Inclusione file

Per includere un capitolo nel progetto, è sufficiente specificarlo nel file `includes.txt`, uno per riga.

Le immagini devono essere inserite nella cartella `images` mentre i capitoli devono essere inseriti nella cartella `chapters`.

_Nota: nel file includes non bisogna specificare `./chapters/`, quindi il file in `./chapters/capitolo1.md` verrà indicato con `capitolo1.md`_

### impostazioni

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
- `lang`: lingua del documento

### Immagine di copertina

Sono disponibili nella cartella `titlepages` le copertine per il _Politecnico di Torino_ e l'_Università di Pisa_. Per adoperarle è sufficiente rinominare il file desiderato in `assets/background.pdf`. E' inoltre presente il template `background.svg` in formato vettoriale come riferimento per eseguire le modifiche.  

## Compilazione

Per compilare il progetto nei vari formati è sufficiente avviare lo script `compile.bat`, automaticamente verrà generato il file pdf, html ed epub all'interno della cartella `output`, con il nome della **cartella** (può essere modificato nel file `compile.bat`).

## Installazione

Per utilizzare il template è necessario installare le seguenti dipendenze:

- [Pandoc Latex Template](https://github.com/Wandmalfarbe/pandoc-latex-template)
- [Latex](https://miktex.org/download)
- [Pandoc](https://pandoc.org/installing.html)

Tale operazione può essere fatta manualmente o attraverso lo script di installazione `install.bat`(windows) o `install.sh` (linux) fornito.

### 1. Download repository

Scarica questa repository di esempio:

```bash
git clone https://github.com/Guray00/template_lectures
```

oppure attraverso il comando scaricando da questa pagina come zip da [qui](https://github.com/Guray00/template_lectures/archive/refs/heads/master.zip).

### 1.5 Estrai la cartella (se scaricato zip)

Se hai scaricato lo zip dal link, estrai la cartella, ed entra al suo interno.

### 2. Installa le dipendenze

Installa le dipendenze necessarie per la compilazione dei file eseguendo il file `install.bat` su Windows o `install.sh` su Linux.

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

Tale operazione può essere semplificata eseguendo lo script `vscode_extensions.bat` (windows) oppure `vscode_extensions.sh` (linux).

### 4. Rimuovi file inutili

Cancella `install.bat`, `vscode_extensions.bat` e la cartella `titlepages/`, se non più necessari.

### 5. Inizia!

Inizia la scrittura dei tuoi appunti! **Nota:** Al primo avvio mancheranno alcune dipendenze per il latex, leva la spunta alla schermata di installazione pacchetto "show always" e premi su "install". In questo modo verranno installati i pacchetti necessari senza doverlo eseguire manualmente.

## Tips

E' possibile centrare le immagini specificando una descrizione tra parentesi quadre, ad esempio:

```markdown
![descrizione](./images/img.jpg)
```

In caso contrario l'immagine non verrà centrata.


## Cheatsheet Markdown

E' possibile trovare una versione più estesa e completa al seguente [link](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

### Titoli

```markdown
# Titolo 1
## Titolo 2
### Titolo 3
```

### Grassetto

```markdown
testo in **grassetto** o __grassetto__
```

testo in **grassetto** o __grassetto__

### Corsivo

```markdown
*corsivo*
```

### Immagini

```markdown
![descrizione](./images/img.jpg)
```

### Link

```markdown
[descrizione](https://www.google.com)
```

### Tabella

```markdown
| Header 1 | Header 2 | Header 3 |
| -------- | -------- | -------- |
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |
```

| Header 1 | Header 2 | Header 3 |
| -------- | -------- | -------- |
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |

### Ordered list

```markdown
1. Elemento 1
2. Elemento 2
3. Elemento 3
```

1. Elemento 1
2. Elemento 2
3. Elemento 3

### Unordered list

```markdown
- Elemento 1
- Elemento 2
- Elemento 3
```

- Elemento 1
- Elemento 2
- Elemento 3

### Citazione

```markdown
> Citazione di un testo
```

> Citazione di un testo
