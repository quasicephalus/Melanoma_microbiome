require(ConQuR)
require(doParallel)

path_to_table <- 'path/to/data.tsv' # Note that required table contains count reads
path_to_metadata <- 'path/to/metadata.tsv'
ref_batch <- 'Reference_batch_name'
out_path <- 'path/to/output.tsv'

df <- read.csv(datapath, sep='\t') # reading table
rownames(df) <- df[,1]
df[,1] <- NULL

metadata <- read.csv(path_to_metadata, sep='\t') #reading metadata 
metadata$response<-as.factor(metadata$response)
metadata$dataset<-as.factor(metadata$dataset)


df_corrected<-
  ConQuR(df, batchid=metadata$dataset, #variable with dataset names
         batch_ref = ref_batch, #reference dataset
         covariates = metadata$response) #covariates (R, NR)


write.csv(df_corrected, out_path)