all: compressed 

command = pdflatex main.tex .pdf main.pdf
gen_command = $(command) && /usr/bin/ghostscript -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=sven_r_$$(date +%Y_%m_%d)
docker_run = docker run --rm --user $$(id -u):$$(id -g) -i -w /doc -v $$PWD:/doc thomasweise/docker-texlive-full

build:
	$(docker_run) $(command)

compressed:
	$(docker_run) $(gen_command)

