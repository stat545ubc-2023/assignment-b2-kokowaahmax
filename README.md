
<!-- README.md is generated from README.Rmd. Please edit that file -->

# summarizeData

<!-- badges: start -->
<!-- badges: end -->

The `summarize_data` R package is a utility that provides a convenient
way to perform group-wise summarization of data frames based on
specified grouping variables and summary statistics. It simplifies the
process of creating grouped summaries by allowing you to specify
grouping variables and summary expressions in a clear and concise
manner.

## Installation

You can install the development version of summarizeData from
[GitHub](https://github.com/stat545ubc-2023/assignment-b2-kokowaahmax)
with:

``` r
devtools::install_github("stat545ubc-2023/assignment-b2-kokowaahmax")
#> Downloading GitHub repo stat545ubc-2023/assignment-b2-kokowaahmax@HEAD
#> withr (2.5.1 -> 2.5.2) [CRAN]
#> vctrs (0.6.3 -> 0.6.4) [CRAN]
#> utf8  (1.2.3 -> 1.2.4) [CRAN]
#> fansi (1.0.4 -> 1.0.5) [CRAN]
#> Installing 4 packages: withr, vctrs, utf8, fansi
#> Installing packages into '/private/var/folders/nl/8y47lkq17cg9w8d36gqg_zkh0000gn/T/RtmpzaaaaS/temp_libpathe0aa2692a3b5'
#> (as 'lib' is unspecified)
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#> * checking for file ‘/private/var/folders/nl/8y47lkq17cg9w8d36gqg_zkh0000gn/T/Rtmp5sxVPB/remoteseae853b16b4d/stat545ubc-2023-assignment-b2-kokowaahmax-7a75372/DESCRIPTION’ ... OK
#> * preparing ‘summarizeData’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘summarizeData_1.0.0.tar.gz’
#> Installing package into '/private/var/folders/nl/8y47lkq17cg9w8d36gqg_zkh0000gn/T/RtmpzaaaaS/temp_libpathe0aa2692a3b5'
#> (as 'lib' is unspecified)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(summarizeData)

## basic example code
data <- data.frame(
  Group1 = c("A", "A", "B", "B"),
  Group2 = c("X", "Y", "X", "Y"),
  Value1 = c(10, 15, 20, NA),
  Value2 = c(5, 8, 12, 18)
)

# Usage of the summarize_data function
result <- summarize_data(data, group_vars = c("Group1", "Group2"),
                        Mean_Value1 = mean(Value1, na.rm = TRUE),
                        Sum_Value2 = sum(Value2, na.rm = TRUE))

# View the resulting summary data frame
head(result)
#> # A tibble: 2 × 3
#>   group Mean_Value1 Sum_Value2
#>   <chr>       <dbl>      <dbl>
#> 1 X              15         17
#> 2 Y              15         26
```
