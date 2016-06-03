#' colorPalette function
#' 
#' Defines a custom color palette.
#' Returns a vector of RGB values.
#' @keywords rgb
#' @export
#' @examples
#' colorPalette()

colorPalette <- function () {
  c(rgb(  1,  67, 134, maxColorValue=255),
    rgb(119, 120, 123, maxColorValue=255),
    rgb(139, 184, 234, maxColorValue=255),
    rgb(188, 190, 192, maxColorValue=255),
    rgb( 94, 122, 162, maxColorValue=255),
    rgb(223, 122,  28, maxColorValue=255))
}
