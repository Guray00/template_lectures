@ECHO OFF


echo Sto installando le estensioni necessarie...

CMD /C code --install-extension bierner.markdown-emoji
echo: 

CMD /C code --install-extension bierner.markdown-yaml-preamble
echo: 

CMD /C code --install-extension darkriszty.markdown-table-prettify
echo: 

CMD /C code --install-extension DavidAnson.vscode-markdownlint
echo: 

CMD /C code --install-extension telesoho.vscode-markdown-paste-image
echo: 

CMD /C code --install-extension streetsidesoftware.code-spell-checker
echo: 

CMD /C code --install-extension streetsidesoftware.code-spell-checker-italian
echo: 

CMD /C code --install-extension yzane.markdown-pdf
echo: 

CMD /C code --install-extension yzhang.markdown-all-in-one
echo: 

echo Estensioni installate.
pause

