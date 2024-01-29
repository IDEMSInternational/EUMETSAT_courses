library(ncdf4)
library(httr)

freqs <- c("daily") # Replace with actual frequency values
regions <- c("nh") # Replace with actual region values
download_dir <- getwd() # Set your download directory

for (freq in freqs) {
  for (region in regions) {
    # Construct the URL
    url <- paste0("https://thredds.met.no/thredds/fileServer/osisaf/met.no/ice/index/v2p2/", region, "/osisaf_", region, "_sie_", freq, ".nc")
    
    # Access the data store for the selected region and frequency
    # In R, you might need to handle this differently depending on the server setup
    # Here, I'm using httr to send a GET request
    response <- GET(url)
    
    if (status_code(response) == 200) {
      # If the file is accessible, download and save it
      destfile <- paste0(download_dir, "/TS_", region, "_", freq, ".nc")
      download.file(url, destfile, mode = "wb")
    }
  }
}
