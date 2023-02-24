# An Introduction to Bayesian Data Analysis for Cognitive Science
FROM rocker/r-ver:4.2.2

#Configuring C++ Toolchain
COPY toolchainconfig.R /
RUN Rscript toolchainconfig.R

# install RStan
RUN Rscript -e 'install.packages("rstan", repos=c("https://mc-stan.org/r-packages/", getOption("repos")))'

RUN apt-get update && apt-get -y install libglpk-dev

RUN Rscript -e 'install.packages(c("igraph", "remotes", "dplyr", "purrr", "tidyr", "extraDistr", "brms", "hypr", "lme4"))'

RUN Rscript -e 'remotes::install_github("bnicenboim/bcogsci")'


