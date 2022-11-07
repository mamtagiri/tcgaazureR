
querydownload<-function(data,destination,container){
  t<-container
  files <- file.path(
    data$project, "harmonized",
    gsub(" ","_",data$data.category),
    gsub(" ","_",data$data.type))
  current<-getwd()
  files <- file.path(destination, files)
  dir.create(files,recursive = TRUE)
  setwd(files)
  for(i in 1:nrow(data$results[[1]])) {
    maindir<-getwd()
    dir<-data$results[[1]][i,1]
    dir.create(dir)
    setwd(dir)
    file=file.path(data$results[[1]][i,1],data$results[[1]][i,5])
    filename<-paste0("TCGA/",file)
    download_blob(t, filename)
    setwd(maindir)
    
  }
  setwd(current)
}
