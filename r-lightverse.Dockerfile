# base R + tex & publishing-related package
FROM rocker/r-ver:4.2.2
RUN /rocker_scripts/install_verse.sh

# install pandoc
RUN apt-get update && apt-get install -y pandoc

# copy set-up files
COPY vimrc /root/.vimrc
COPY tex-pkgs.txt /
COPY install_tex_pkgs.R /

# install tex pkgs
RUN Rscript install_tex_pkgs.R  

# add Sweave pkg 
RUN Rscript -e 'tinytex::r_texmf(action = "add")'

# update $PATH
ENV PATH="$PATH:/usr/local/texlive/bin/linux"

# create a working directory to mount local dirs
WORKDIR /docker

# copy minimal working tex example
COPY minimal.tex /docker/
COPY refs.bib /docker/
COPY trends-journals.csl /docker/
COPY run_minimal_tex.R /docker/

# to extract citations
COPY getcitations.R /docker/


