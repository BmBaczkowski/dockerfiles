# Use the latest stable version of the rocker/r-ver image
FROM rocker/r-ver:4.2.3

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    autoconf \
    automake \
    libtool \
    bison \
    flex

# Download and install JAGS 4.3.2
RUN wget https://sourceforge.net/projects/mcmc-jags/files/JAGS/4.x/Source/JAGS-4.3.2.tar.gz && \
   tar xvzf JAGS-4.3.2.tar.gz && \
   rm JAGS-4.3.2.tar.gz
WORKDIR /JAGS-4.3.2
RUN ./configure && \
   make && 
   make install 

# Set the R_LIBS_USER environment variable
ENV R_LIBS_USER=/usr/local/lib/R/site-library:/usr/lib/R/site-library:/usr/lib/R/library

# Install the r-cran-rjags package
RUN apt-get update && apt-get install -y r-cran-rjags

# Add R packages including R2jags
COPY r-pkgs.txt /
RUN install2.r --error --skipinstalled \
    R2jags \
    `cat /r-pkgs.txt` \
    && rm -rf /tmp/downloaded_packages \
    && strip /usr/local/lib/R/site-library/*/libs/*.so

WORKDIR /dockeruser

# clean jags instalation
RUN rm -fr /JAGS-4.3.2

# Specify the command to run (starting a shell)
CMD ["/bin/bash"]
