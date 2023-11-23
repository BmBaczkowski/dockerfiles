# Use the latest stable version of the rocker/r-ver image
FROM rocker/r-ver:4.2.3

RUN apt-get update && \
    apt-get -y install cmake build-essential libtool

# Install tex-live
RUN /rocker_scripts/install_texlive.sh
ENV PATH="$PATH:/usr/local/texlive/bin/linux"
COPY tex-pkgs.txt /
RUN tlmgr install `cat /tex-pkgs.txt`

# Add pandoc
RUN apt-get update && apt-get -y install pandoc

# Add R packages
COPY r-pkgs.txt /
RUN install2.r --error --skipinstalled \
    `cat r-pkgs.txt` \
    && rm -rf /tmp/downloaded_packages \
    && strip /usr/local/lib/R/site-library/*/libs/*.so

# Add Sweave package to tex
RUN Rscript -e 'tinytex::r_texmf(action="add")'

WORKDIR /dockeruser

# Specify the command to run (starting a shell)
CMD ["/bin/bash"]
