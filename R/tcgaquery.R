tcgaquery <- function(tcgadata,projectid,datacategory,datatype,sampletype) {
  if (missing(sampletype)) {
    sampletype <- unique(tcgadata$sample_type)
  }
  data<-tcgadata %>% 
    filter((project %in% projectid) & data_category==datacategory & data_type == datatype & sample_type %in% sampletype)
  ret <- data.frame(
    results = I(list(data)),
    project = unique(data$project),
    data.category = unique(data$data_category),
    data.type = unique(data$data_type),
    access = I(list(unique(data$access))),
    legacy=FALSE,
    experimental.strategy =  I(list(unique(data$experimental_strategy))),
    sample.type = I(list(unique(data$sample_type)))
  )
  return(ret)
}	

