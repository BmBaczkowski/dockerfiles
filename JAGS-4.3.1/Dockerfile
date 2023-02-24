# base R + jags + tex 
FROM rocker/r-ver:4.2.2


# install tex 
RUN /rocker_scripts/install_verse.sh
ENV PATH="$PATH:/usr/local/texlive/bin/linux"
COPY tex-pkgs.txt /
RUN tlmgr install `cat /tex-pkgs.txt`
RUN apt-get update && apt-get -y install pandoc

# install JAGS
COPY JAGS-4.3.1.tar.gz /
RUN tar xvzf /JAGS-4.3.1.tar.gz
WORKDIR /JAGS-4.3.1
RUN ./configure
RUN make && make install

# install rjags 
RUN apt-get update && apt-get -y install r-cran-rjags

# add Sweave pkg 
RUN Rscript -e 'tinytex::r_texmf(action = "add")'

# create a working directory to mount local dirs
WORKDIR /docker
