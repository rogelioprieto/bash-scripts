myfilename="AnexoTRL-pages21-27"
pandoc \
-t markdown_strict \
--extract-media='./images/trl/$myfilename' \
$myfilename.docx \
-o $myfilename.md



#THIS OPTION IS BEST: path to images is right!
myfilename="AnexoTRL-pages21-27"
pandoc \
-t 'markdown+bracketed_spans+backtick_code_blocks+fenced_code_attributes+fenced_divs' \
--extract-media="./images/sfmc-automatizacion/" \
$myfilename.docx \
-o $myfilename.md


Source:
<https://gist.github.com/plembo/409a8d7b1bae66622dbcd26337bbb185>


$ myfilename="example"
$ pandoc \
-t markdown_strict \
--extract-media='./attachments/$myfilename' \
$myfilename.docx \
-o $myfilename.md
