querydownload<-function(data,destination){
  t<-blob_container("https://datasettcga.blob.core.windows.net/dataset",sas ="sp=rl&st=2022-11-07T16:59:11Z&se=2030-12-01T00:59:11Z&spr=https&sv=2021-06-08&sr=c&sig=A4AWnyISkPi9JZRanNwcQNgAagxUih1J%2FeJ9T5kHyfc%3D")
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
