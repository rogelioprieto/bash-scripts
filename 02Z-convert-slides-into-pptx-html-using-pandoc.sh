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



## Slidy (HTML)
#TODO
#pandoc -t slidy -s slides.md -o slides-slidy.html
#pandoc -t slidy -s slides.md -o slides-slidy.html #pandoc uses the css and js from slidy website

#pandoc -t slidy -s slides.md -o slides-slidy2.html \
#  -V slidy-url=/home/$(whoami)/.pandoc/templates/slides/Slidy2 




# DZSlides (HTML)
#pandoc -t dzslides -s slides.md -o slides-dzslides.html
#pandoc -t dzslides -s slides.md -o slides-dzslides.html \
#  -V dzslides-url=/home/$(whoami)/.pandoc/templates/slides/dzslides/ 


# With specific Reveal.js options
# Requirement: wget https://github.com/hakimel/reveal.js/archive/master.tar.gz and uncompress as reveal.js subdirectory.
# Reveal.js (HTML) - white theme
#pandoc -t revealjs -s slides.md -o slides-revealjs-white.html \
#  -V theme=white -V transition=slide -V slideNumber=true \
#  -V revealjs-url=/home/$(whoami)/.pandoc/templates/slides/reveal.js/

# Reveal.js (HTML) - sky theme
#pandoc -t revealjs -s slides.md -o slides.html -V theme=sky
#pandoc -t revealjs -s slides.md -o slides-revealjs-sky.html \
#  -V theme=sky -V transition=slide -V slideNumber=true \
#  -V revealjs-url=/home/$(whoami)/.pandoc/templates/slides/reveal.js/


# s5 (HTML)
#pandoc -t s5 -s slides.md -o slides-s5.html
#pandoc -t s5 -s slides.md -o slides-s5.html \
#  -V s5-url=/home/$(whoami)/.pandoc/templates/slides/s5-11/ui/default

# slideous (HTML)
#pandoc -t s5 -s slides.md -o slides-s5.html
#pandoc -t slideous -s slides.md -o slides-slideous.html \
#  -V slideous-url=/home/$(whoami)/.pandoc/templates/slides/slideous
