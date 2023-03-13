library(auk)
ebd <- auk_ebd("data/ebird/ebd_US_relJan-2023.txt", 
               file_sampling = "data/ebird/ebd_sampling_relJan-2023.txt")
ebird_filter <- ebd%>%
  auk_date(date = c("2021-1-1","2022-1-1"))%>%
  auk_protocol(protocol = c("Stationary", "Traveling")) %>% 
  auk_country(country = c("US"))%>%#making sure only us data, especially in sampling
  auk_complete()
ebird_filter

f_ebd <- file.path("data/ebird/ebd_us_filtered.txt")
f_sampling <- file.path("data/ebird/sampling_us_filtered.txt")

if (!file.exists(f_ebd)) {
  auk_filter(ebird_filter, file = f_ebd, file_sampling = f_sampling)}

cols <- c("latitude", "longitude",
          "group identifier", "sampling event identifier", 
          "scientific name", "observation count",
          "observer_id", "state code")
f_select <- "data/ebird/ebd_smaller.txt"
selected <- auk_ebd(f_ebd) %>% 
  auk_select(select = cols, file = f_select)

genus_species<-data.frame(matrix(ncol=2))
for (i in 1:nrow(species_strat)){
genus_species_name <- (paste(species_strat[i,8],species_strat[i,9],sep=" "))
genus_species[i,1]=species_strat[i,2]
genus_species[i,2]=genus_species_name
}

