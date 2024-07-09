unzip -qc "$variable1" ppt/slides/slide*.xml | grep -oP '(?<=\<a:t\>).*?(?=\</a:t\>)'


Source:
https://superuser.com/questions/661315/tools-to-extract-text-from-powerpoint-pptx-in-linux
