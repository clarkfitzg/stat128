#' Extract interest rates from a character vector
#'
#' @param x character vector containing text with interest rates
#' @param pattern regular expression pattern to find the matching interest rates
#' @return The first numeric interest rate found in the string, or NA if none found
#' @examples
#' extract_interest_rate("Fixed @ 3.92%, no TIC/NIC")  # 3.92
#' extract_interest_rate("123.456 but no adjacent %")  # NA
extract_interest_rate = function(x, pattern = "[0-9]+\\.[0-9]+\\%")
{
    interest = rep(NA, length(x))
    match_locations = regexpr(pattern, x)
    match_string = regmatches(x, match_locations)
    match_number_string = gsub("\\%", "", match_string)
    match_number = as.numeric(match_number_string)
    interest[match_locations != -1] = match_number
    interest
}


eir = function(x, p = "[0-9]+\\.[0-9]+\\%")
{
    i = rep(NA, length(x))
    l = regexpr(p, x)
    n = as.numeric(gsub("\\%", "", regmatches(x, l)))
    (i[l != -1] = n)
}