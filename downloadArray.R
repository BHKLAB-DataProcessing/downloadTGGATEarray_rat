require(downloader)
library(curl)

options(stringsAsFactors = FALSE)
my.path="/pfs/out"

dir1 <- "ftp://ftp.biosciencedbc.jp/archive/open-tggates/LATEST/Rat/in_vitro/"

dir.create(file.path(my.path, "raw"), showWarnings=FALSE, recursive=TRUE)

tt <- read.csv('https://orcestradata.blob.core.windows.net/toxico/TCG_Rat_array_samples_zip.txt') #all zip files

samples <- tt$x

tt <- split(samples, ceiling(seq_along(samples)/5))
tt <- tt[[1]][1:2]

for (i in 1:length(tt)) {

print(i)
#samples <- tt[[i]]
samples <- tt[i]

lapply(samples, function(filename){
  curl_download(paste(dir1, filename, sep = ""), destfile = paste0(file.path(my.path, "raw"),"/",filename))
  unzip(paste0(file.path(my.path, "raw"),"/",filename), exdir="/pfs/out")
})
