## Script to transform WFP data from the VAM unit into the HDX format.
library(reshape2)
source('code/write_tables.R')

# loading data from source
source_data <- read.csv('data/source/fcsforhdx.csv')

# create indicators
indicator <- data.frame(indID = c('CHD.B.FOS.04.T6', 'CHD.B.FOS.05.T6', 'CHD.B.FOS.06.T6'), name = c('Percentage of households with poor food consumption', 'Percentage of households with borderline food consumption','Percentage of households with acceptable food consumption'), units = c('Percent'))

# create the dataset
dataset <- data.frame(dsID = 'wfp-vam', last_updated = NA, last_scraped = as.character(as.Date(Sys.time())), name = 'United Nations World Food Programme. Food Security Analysis Service / VAM (Vulnerability Analysis and Mapping)')

## Cleaning ## 
value <- source_data
value[2] <- NULL
names(value)[5:7] <- c('CHD.B.FOS.04.T6', 'CHD.B.FOS.05.T6', 'CHD.B.FOS.06.T6')
value <- melt(value)
value$Metadata <- NULL
value$is_number <- 1
names(value) <- c('region', 'admin1', 'admin2', 'period', 'source', 'indID', 'value', 'is_number')
value$region <- ifelse(value$admin2 != "", as.character(value$admin2), as.character(value$region))
value$region <- ifelse(value$admin1 != "" & value$admin2 == "", as.character(value$admin1), as.character(value$region))
value$dsID <- 'wfp-vam'
value$admin1 <- NULL
value$admin2 <- NULL

# writing tables
writeTables(df = indicator, table_name = 'indicator', db = 'scraperwiki')
writeTables(df = dataset, table_name = 'dataset', db = 'scraperwiki')
writeTables(df = value, table_name = 'value', db = 'scraperwiki')

# storing CSV
write.csv(value, 'data/value.csv', row.names = F)
write.csv(indicator, 'data/indicator.csv', row.names = F)
write.csv(dataset, 'data/dataset.csv', row.names = F)
