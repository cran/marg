.First.lib <- function(libname, pkgname) 
{
  version <- as.character("1.2-0 (2009/10/03)")
  cat("\n   Package \"marg\"", version, "\n")
  cat("   Copyright (C) 2000-2009 A. R. Brazzale\n\n")
  cat("This is free software, and you are welcome to redistribute\n")
  cat("it and/or modify it under the terms of the GNU General\n")
  cat("Public License published by the Free Software Foundation.\n")
  cat("Package \"marg\" comes with ABSOLUTELY NO WARRANTY.\n\n")
  cat("type `help(package=\"marg\")' for summary information\n")
  require(survival)
  invisible()
}
