command := pdflatex main.tex && gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=sven_r_$$(date +%Y_%m_%d).pdf main.pdf
 
generate:
	docker run --rm --user $$(id -u):$$(id -g) -i -w /doc -v $$PWD:/doc thomasweise/docker-texlive-full ${command}
