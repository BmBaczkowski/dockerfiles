# base R + tex & publishing-related package
FROM rocker/r-ver:4.2.2

RUN /rocker_scripts/install_verse.sh
ENV PATH="$PATH:/usr/local/texlive/bin/linux"
COPY tex-pkgs.txt /
RUN tlmgr install `cat /tex-pkgs.txt`

# install pandoc
RUN apt-get update && apt-get install -y pandoc

# add Sweave pkg 
RUN Rscript -e 'tinytex::r_texmf(action = "add")'

# create a working directory to mount local dirs
WORKDIR /docker
