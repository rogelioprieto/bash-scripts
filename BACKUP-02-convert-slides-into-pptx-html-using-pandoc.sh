# Reveal.js (HTML)
#pandoc -t revealjs -s slides.md -o slides.html -V theme=sky

# Beamer (PDF)
#pandoc -t beamer slides.md -o slides.pdf

# PowerPoint
#1. get the reference.pptx file use as default by pandoc
#pandoc -o myref.pptx --print-default-data-file reference.pptx
#2. modify styles in master the myref.pptx
#3. use the pptx as parameter
#pandoc slides.md --reference-doc=myref.pptx -o slides.pptx
pandoc slides.md -o slides.pptx

# DZSlides (HTML)
#pandoc -t dzslides -s slides.md -o slides-dzslides.html



# With specific Reveal.js options
# Requirement: wget https://github.com/hakimel/reveal.js/archive/master.tar.gz and uncompress as reveal.js subdirectory.
pandoc -t revealjs -s slides.md -o slides-reveal.html \
  -V theme=white -V transition=slide -V slideNumber=true \
  -V revealjs-url=./reveal.js/

# s5 (HTML)
#pandoc -t s5 -s slides.md -o slides-s5.html
