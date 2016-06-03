#' makeMetadata function
#' 
#' Make metadata associated with a data.frame object.
#' @param D data.frame object to make metadata for
#' @param note character object containing annotation
#' @keywords data.frame
#' @export
#' @examples
#' makeMetadata(iris)
#' makeMetadata(iris, note="Edgar Anderson's Iris Data")

makeMetadata <- function(D, note=NULL) {
  # Examples:
  # makeMetadata(cars)
  # x <- 1
  # makeMetadata(x)  # Returns a warning
  if (is.data.frame(D)) {
    list(objectName = deparse(substitute(D)),
         timeStamp = sprintf("%s", Sys.time()),
         objectSize = format(object.size(D), units="auto"),
         note = note,
         rowCount = nrow(D),
         colCount = ncol(D),
         colNames = names(D),
         colClasses = sapply(D, class),
         sysInfo = Sys.info(),
         sessionInfo = sessionInfo())
  } else {
    warning(sprintf("Object %s is not a data.frame", deparse(substitute(D))))
  }
}
