# An Introduction to Bayesian Data Analysis for Cognitive Science
FROM rocker/r-ver:4.2.2

# Configuring C++ Toolchain
COPY toolchainconfig.R /
RUN Rscript toolchainconfig.R

# install RStan
RUN Rscript -e 'install.packages("rstan", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))'

# install additional packages
RUN Rscript -e 'install.packages(c("remotes", "dplyr", "purrr", "tidyr", "extraDistr", "brms", "hypr", "lme4"))'
RUN Rscript -e 'remotes::install_github("bnicenboim/bcogsci")'

# install vim
RUN apt update -qq && apt install -y vim

# copy set-up files
COPY vimrc /root/.vimrc