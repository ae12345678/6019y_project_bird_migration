library(auk)
ebd <- auk_ebd("data/ebird/ebd_relJan-2023.txt", 
               file_sampling = "data/ebird/ebd_sampling_relJan-2023.txt")

ebird_filter <- ebd%>%
  auk_bbox(bbox=c(-169,0,-36,79.585627))%>%
  auk_date(date = c("2019-1-1","2022-12-31"))%>%
  auk_protocol(protocol = c("Stationary", "Traveling")) %>% 
  auk_complete()
ebird_filter

f_ebd <- file.path("data/ebird/ebd_filtered.txt")
f_sampling <- file.path("data/ebird/sampling_filtered.txt")

if (!file.exists(f_ebd)) {
  auk_filter(ebird_filter, file = f_ebd, file_sampling = f_sampling)
}
