#' showSessionInfo function
#' 
#' Show R session information for reproducibility purposes.
#' @param
#' @keywords debugging trace reproducibility
#' @export
#' @examples
#' .timeStart <- Sys.time()  # Defined prior to calling showSessionInfo()
#' showSessionInfo()
#' showSessionInfo()$timeEnd

showSessionInfo <- function () {
  list(timeStart = ifelse(exists(".timeStart"), format(.timeStart), NA),
       timeEnd = Sys.time(),
       timeElapsed = ifelse(exists(".timeStart"),
                            format(Sys.time() - .timeStart, format=difftime),
                            NA),
       Sys.info = Sys.info(),
       sessionInfo = sessionInfo())
}
