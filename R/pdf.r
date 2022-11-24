#' Get PDF Fields
#'
#' @export
get_fields <- function() {
  # all templates should have same field
  # so just use "men" as the default
  inputfile <- get_templatefile("men")
  staplr::get_fields(inputfile)
}

get_templatefile <- function(template = c("men", "dwarf", "elf", "hobbit")) {
  template <- match.arg(template)
  filename <- paste0(template, ".pdf")
  system.file("character-sheets", filename, package = "oneringpdf")
}

#' Write pdf fields
#' @param fields character data
#' @param outputfile name of output file
#' @param template pdf template type
#' @export
write_pdf <- function(fields, outputfile, template = c("men", "dwarf", "elf", "hobbit")) {
  template <- match.arg(template)
  inputfile <- get_templatefile(template)
  staplr::set_fields(inputfile, outputfile, fields)
}
