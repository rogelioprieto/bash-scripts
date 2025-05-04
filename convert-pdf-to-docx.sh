#!/bin/bash
#Rogelio Prieto
#April,2025
#Source: 
#https://stackoverflow.com/questions/63593345/how-to-convert-pdf-to-docx-in-libreoffice-6-4

libreoffice --headless --infilter='writer_pdf_import' --convert-to docx --outdir . tablas-marlene.pdf
