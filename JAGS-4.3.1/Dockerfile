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

# Set the R_LIBS_USER environment variable
ENV R_LIBS_USER=/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library

# Install the r-cran-rjags package
RUN apt-get update && apt-get install -y r-cran-rjags

# Install R2jags wrapper of rjags
RUN install2.r R2jags

# Install additional diagnostics packages
RUN install2.r MCMCvis
RUN install2.r bayesplot
 
# add Sweave pkg 
RUN Rscript -e 'tinytex::r_texmf(action = "add")'

# create a working directory to mount local dirs
WORKDIR /docker
