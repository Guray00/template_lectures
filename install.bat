@ECHO OFF

:: file temporaneo
set TMPFOLDER=C:\Users\%username%\AppData\Local\Temp

:: scritta iniziale
echo Benvenuto nell'installer del template
echo verra' installato, in ordine:
echo - latex
echo - pandoc
echo - template per PDF
echo - template per WEB
echo: 

:: INSTALLAZIONE LATEX
echo Verifico se latex e' installato...
latex --version > nul || (
echo Latex non installato, download in corso...

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://miktex.org/download/ctan/systems/win32/miktex/setup/windows-x64/basic-miktex-22.10-x64.exe', 'latex.exe')"

echo latex scaricato
echo installazione di latex in corso, prosegui nella finestra che si aprirà a breve!
call .\latex.exe

:: latex --version > nul || (
:: echo latex non e' stato installato, abortisco l'installazione
:: exit
:: )

if exist "./latex.exe" DEL latex.exe
)
echo latex installato.
echo: 

:: INSTALLAZIONE PANDOC
echo Verifico se pandoc e' installato...
pandoc --version > nul || (
echo pandoc non installato, download in corso...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-windows-x86_64.msi', 'pandoc.msi')"
echo pandoc scaricato
echo installazione di pandoc in corso, prosegui nella finestra che si aprirà a breve!
call .\pandoc.msi

:: pandoc --version > nul || (
:: echo pandoc non e' stato installato, abortisco l'installazione
:: exit
:: )

if exist "./pandoc.msi" DEL ./pandoc.msi
)
echo pandoc installato.
echo: 

echo Sto copiando i template...
:: creo il path per i template
if not exist "C:\Users\%username%\AppData\Roaming\pandoc\templates" mkdir C:\Users\%username%\AppData\Roaming\pandoc\templates

:: scarico template latex
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/master/eisvogel.tex', 'C:\Users\%username%\AppData\Roaming\pandoc\templates\eisvogel.latex')"


:: scarico template web
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ryangrose/easy-pandoc-templates/master/html/elegant_bootstrap_menu.html', 'C:\Users\%username%\AppData\Roaming\pandoc\templates\elegant_bootstrap_menu.html')"
echo template copiati.
echo:

:: elimino eventuali rimasugli
if exist "./latex.exe" DEL ./latex.exe
if exist "./pandoc.msi" DEL ./pandoc.msi

echo Installazione terminata.
pause