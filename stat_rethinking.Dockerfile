# Statistical Rethinking vol. 2
FROM rocker/r-ver:4.2.2

# install devtools 
RUN Rscript -e 'install.packages("devtools")'

# Configuring C++ Toolchain
COPY toolchainconfig.R ./
RUN Rscript toolchainconfig.R

# install RStan
RUN Rscript -e 'devtools::install_version("rstan", repos = "https://cloud.r-project.org/", dependencies = TRUE, version="2.21.1")'

# install CmdStanR
RUN Rscript -e 'devtools::install_version("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")), version="0.5.2")'
RUN Rscript -e 'cmdstanr::install_cmdstan(version="2.31.0")'

# install rethinking package
# install additional packages
RUN Rscript -e 'devtools::install_version("coda", version="0.19-4")'
RUN Rscript -e 'devtools::install_version("mvtnorm", version="1.1-3")'
RUN Rscript -e 'devtools::install_version("loo", version="2.5.1")'
RUN Rscript -e 'devtools::install_version("dagitty", version="0.3-1")'
RUN Rscript -e 'devtools::install_version("shape", version="1.4.6")'
RUN Rscript -e 'devtools::install_github("rmcelreath/rethinking@v2.2.1")'




