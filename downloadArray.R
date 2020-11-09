require(downloader)
library(curl)

options(stringsAsFactors = FALSE)

curl_download("https://orcestradata.blob.core.windows.net/toxico/TGGATES_rat_CELfiles.tar.gz", destfile = "/pfs/out/TGGATES_rat_CELfiles.tar.gz")
untar("/pfs/out/TGGATES_rat_CELfiles.tar.gz", exdir = "/pfs/out/")
file.remove("/pfs/out/TGGATES_rat_CELfiles.tar.gz")
