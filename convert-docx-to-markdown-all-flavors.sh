#!/bin/bash
#Rogelio Prieto
#mayo/2025

pandoc -f docx --to markdown TRL-2.2.docx -o TRL-2.2--MARKDOWN.md
pandoc -f docx --to markdown_mmd TRL-2.2.docx -o TRL-2.2--MARKDOWN_MMD.md
pandoc -f docx --to markdown_phpextra TRL-2.2.docx -o TRL-2.2--MARKDOWN_PHPEXTRA.md
pandoc -f docx --to markdown_strict TRL-2.2.docx -o TRL-2.2--MARKDOWN_STRICT.md
pandoc -f docx --to gfm TRL-2.2.docx -o TRL-2.2--MARKDOWN_GITHUB.md
pandoc -f docx --to commonmark TRL-2.2.docx -o TRL-2.2--MARKDOWN_COMMON.md
