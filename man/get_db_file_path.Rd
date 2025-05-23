% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helpers.R
\name{get_db_file_path}
\alias{get_db_file_path}
\title{get_db_file_path}
\usage{
get_db_file_path(filename)
}
\arguments{
\item{filename}{DB file to look up}
}
\value{
path to the requested file
}
\description{
Will try to fetch the path of given DB file from:
\itemize{
\item platform-specific appdata dir
\item project dir/database (during development)
\item testdata dir
}
}
