# Use the latest stable version of the rocker/r-ver image
FROM rocker/rstudio:4.3.2

# Install system dependencies
RUN apt-get update && apt-get install -y wget

# Download and install JAGS 4.3.2
RUN wget https://sourceforge.net/projects/mcmc-jags/files/JAGS/4.x/Source/JAGS-4.3.2.tar.gz \
   && tar xvzf JAGS-4.3.2.tar.gz \
   && rm JAGS-4.3.2.tar.gz

WORKDIR /JAGS-4.3.2
RUN ./configure \
   && make \
   && make install 

WORKDIR /

# Install R packages using pak
RUN R -q -e 'install.packages("pak", repos=sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))'
COPY r-pkgs.txt /tmp/packages.txt
RUN R -q -e 'pak::pkg_install(pkg=readLines("/tmp/packages.txt"))'

# Install tex-live
RUN /rocker_scripts/install_texlive.sh
ENV PATH="$PATH:/usr/local/texlive/bin/linux"
COPY tex-pkgs.txt /tmp/
RUN tlmgr install `cat /tmp/tex-pkgs.txt`
RUN R -q -e 'tinytex::r_texmf(action="add")'

# Clean
RUN rm -rf /var/lib/apt/lists/* \
    && rm -fr /JAGS-4.3.2 \
    && rm -rf /tmp/*

WORKDIR /dockeruser
 
