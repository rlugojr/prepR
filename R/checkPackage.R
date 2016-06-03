#' checkPackage function
#' 
#' Check if a package is installed.
#' If not, then install it.
#' If an update exists, then update.
#' @param pkg Name of the package to check
#' @keywords library install.packages
#' @export
#' @examples
#' checkPackage("data.table")

checkPackage <- function (pkg) {
  if (is.character(pkg) == TRUE) {
    repos <- "https://cloud.r-project.org"
    if(pkg %in% rownames(installed.packages()) == FALSE) {
      install.packages(pkg, repos=repos, dependencies=TRUE)
      rowid <- which(installed.packages()[, "Package"] == pkg)
      pkgInfo <- installed.packages()[rowid, ]
      message(sprintf("%s %s was installed in %s",
                      pkg,
                      pkgInfo["Version"],
                      pkgInfo["LibPath"]))
    } else if(pkg %in% rownames(old.packages()) == TRUE) {
      update.packages(pkg, ask=FALSE, repos=repos, dependencies=TRUE)
      rowid <- which(old.packages()[, "Package"] == pkg)
      pkgInfo <- old.packages()[rowid, ]
      message(sprintf("%s was updated to version %s in %s",
                      pkg,
                      pkgInfo["ReposVer"],
                      pkgInfo["LibPath"]))
    } else {
      rowid <- which(installed.packages()[, "Package"] == pkg)
      pkgInfo <- installed.packages()[rowid, ]
      message(sprintf("%s %s is installed in %s",
                      pkg,
                      pkgInfo["Version"],
                      pkgInfo["LibPath"]))
    }
    library(pkg, character.only=TRUE)
  } else {warning("pkg should be character object")}
}
