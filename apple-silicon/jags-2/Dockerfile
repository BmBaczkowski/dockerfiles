# Use the latest stable version of the rocker/r-ver image
FROM rocker/r-ver:4.2.3

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

WORKDIR /dockeruser
 

# Install R packages using pak
RUN R -q -e 'install.packages("pak", repos=sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))'
COPY r-pkgs.txt /tmp/packages.txt
RUN R -q -e 'pak::pkg_install(pkg=readLines("/tmp/packages.txt"))'


# Clean
RUN rm -rf /var/lib/apt/lists/* \
    && rm -fr /JAGS-4.3.2 \
    && rm -rf /tmp/*

# Specify the command to run (starting a shell)
CMD ["/bin/bash"]
