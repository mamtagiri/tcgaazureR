require(AzureStor)
querydownload<-function(data,destination){
  t<-AzureStor:::blob_container("https://storagepurviewmg.blob.core.windows.net/testdata1/",sas ="sp=rl&st=2022-07-25T19:47:41Z&se=2022-10-01T03:47:41Z&spr=https&sv=2021-06-08&sr=c&sig=TVUhb4T%2Fk%2BNW5VO2Ej21lZyqkBtGBdamn0kaYX3%2BahY%3D")
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
    download_blob(t, file)
    setwd(current)
  }
}
