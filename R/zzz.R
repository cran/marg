.onAttach <- function(libname, pkgname) 
{
  version <- as.character("1.2-4 (2025/05/22)")
  psm <- paste("\n   Package \"marg\"", version, "\n",
    "   Copyright (C) 2000-2025 A. R. Brazzale\n\n",
    "This is free software, and you are welcome to redistribute\n",
    "it and/or modify it under the terms of the GNU General\n",
    "Public License published by the Free Software Foundation.\n",
    "Package \"marg\" comes with ABSOLUTELY NO WARRANTY.\n\n",
    "type `help(package=\"marg\")' for summary information\n")
  packageStartupMessage(psm)
  invisible()
}
