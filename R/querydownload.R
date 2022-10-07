querydownload<-function(data,destination){
  t<-blob_container("https://datasettcga.blob.core.windows.net/",sas ="sp=r&st=2022-09-23T17:51:10Z&se=2025-09-02T01:51:10Z&spr=https&sv=2021-06-08&sr=c&sig=k44eVLkcrrJZCMrqijJjywE4G%2BG%2BC0f7CZ0xZFlQB0A%3D")
  files <- file.path(
    query$project, "harmonized",
    gsub(" ","_",data$data.category),
    gsub(" ","_",data$data.type))
  current<-getwd()
  files <- file.path(destination, files)
  dir.create(files,recursive = TRUE)
  setwd(files)
  for(i in 1:nrow(data$results[[1]])) {
    maindir<-getwd()
    dir<-query$results[[1]][i,1]
    dir.create(dir)
    setwd(dir)
    file=file.path(query$results[[1]][i,1],query$results[[1]][i,5])
    download_blob(t, file)
    setwd(maindir)
  
  }
  setwd(current)
}
