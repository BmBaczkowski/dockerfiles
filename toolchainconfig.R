# The following will create or edit a configuration file for the C++ toolchain

dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR)) dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M)) file.create(M)
cat("\nCXX14FLAGS=-O3 -march=native -mtune=native -fPIC",
    "CXX14=g++", # or clang++ but you may need a version postfix
    file = M, sep = "\n", append = TRUE)

# As of version 2.21, RStan depends on the V8 R package.
Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1)
install.packages("V8")