require(AzureStor)
querydownload<-function(data,destination){
  t<-AzureStor:::blob_container("https://datasettcga.blob.core.windows.net/",sas ="sp=raw&st=2022-09-06T13:30:53Z&se=2022-09-10T21:30:53Z&spr=https&sv=2021-06-08&sr=c&sig=Aw9ZlI7Ia6iK%2Bj8VESVaMSttPHQBcHITs78l8BnNBko%3D")
  files <- file.path(
    data$project, "harmonized",
    gsub(" ","_",data$data.category),
    gsub(" ","_",data$data.type))
  files <- file.path(destination, files)
  dir.create(files,recursive = TRUE)
  setwd(files)
  for(i in 1:nrow(data$results[[1]])) {
    current<-getwd()
    dir<-data$results[[1]][i,1]
    dir.create(dir)
    setwd(dir)
    file=file.path(data$results[[1]][i,1],data$results[[1]][i,5])
    download_blob(t, paste0("TCGA/",file)
    setwd(current)
  }
}
