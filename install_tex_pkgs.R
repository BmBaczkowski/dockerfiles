list_of_packages <- readLines('tex-pkgs.txt', warn = FALSE)
tinytex::tlmgr_install(list_of_packages)