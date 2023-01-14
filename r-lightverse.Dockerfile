# base R + tex & publishing-related package
FROM rocker/r-ver:4.2.2

# install devtools 
RUN Rscript -e 'install.packages("devtools")'

# update repos and install vim
RUN apt-get update && apt-get install -y \
  vim \
  pandoc \
  libxt6 \
  libfile-find-rule-perl-perl

# install tiny TeX
RUN Rscript -e 'devtools::install_version("tinytex", version="0.43")'
RUN Rscript -e 'tinytex::install_tinytex(bundle="TinyTeX-1", version="v2022.12")'

# install rmarkdown
RUN Rscript -e 'devtools::install_version("rmarkdown", version="2.19")'

# install bookdown
RUN Rscript -e 'devtools::install_version("bookdown", version="0.31")'

# install Sweave
RUN Rscript -e 'tinytex::tlmgr_install("Sweave")'

# setup .vimrc 
COPY vimrc ./root/.vimrc

WORKDIR /docker

# add script to extract citations
COPY getcitations.R ./docker/





