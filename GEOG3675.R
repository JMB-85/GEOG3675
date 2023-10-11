# loading grocer data
grocer.data.2023 <- read.csv ("geolytix_retailpoints_v29_202308.csv")
# Loading MSOA and IDZ population data, both data sets were manually merged in excel
msoa <- read.csv("Population_Counts_MSOA_IDZ.csv")

# load in shapefile for MSOA
p <- st_read("MSOA_2021_EW_BFC_V6.shp")
# load in shapefile for IDZ
q <- shapefile("SG_IntermediateZone_Bdry_2011.shp")

# merge Polygon data with population data for both MSOA and IDZ into seperate datasets
msoa_merged <- merge(p, msoa, by.x= "MSOA21CD", by.y = "Area_Code", all.x=TRUE, all.y=TRUE)
IDZ_merged <- merge(q, msoa, by.x= "InterZone", by.y = "Area_Code", all.x=TRUE, all.y=TRUE)

# remove unmerged polygon datasets, as well as population data to save on filesize
remove(p)
remove(q)
remove(msoa)

