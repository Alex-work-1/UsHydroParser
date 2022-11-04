# This function parses hydrology US daily data in a MOPEX format by its ID.
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


#' US hydrology MOPEX data parser
#'
#' @param id main argument
#'
#' @return
#' @export
#' @import "stringr"
#' @examples UsHydroParser("01048000")


UsHydroParser <- function(id) {
  url = "https://hydrology.nws.noaa.gov/pub/gcip/mopex/US_Data/Us_438_Daily/"

  try({

    dta <- read.fwf( # reads table
      file = paste0(url,id,".dly"),
      widths = c(8, rep(x = 10, times = 5)),
      col.names = c("date", "p", "e", "r", "tmax", "tmin")
    )


    dta[, 1] <- gsub("^(.{6})(.*)$", "\\1 \\2", dta[, 1]) # insert a white space between day and month
    str_squish(dta[, 1]) # remove multiple whitespaces
    dta[, 1] <- as.Date(dta[, 1], format = "%Y %m %d")

  }, silent = TRUE)

  if (inherits(x = dta, what = "try-error")) {
    message(paste(x, "was not downloaded correctly"))
  } else {
    return(dta)
  }
}

