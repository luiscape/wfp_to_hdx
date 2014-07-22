## Script to transform WFP data from the VAM unit into the HDX format.
library(xlsx)
library(reshape2)

# loading data from source
source_data <- read.xlsx('data/source/fcsforhdx.xlsx', sheetIndex = 1)

# create indicators
indicator <- data.frame(indID = c('CHD.B.FOS.04.T6', 'CHD.B.FOS.05.T6', 'CHD.B.FOS.06.T6'), name = c('Percentage of households with poor food consumption', 'Percentage of households with borderline food consumption','Percentage of households with acceptable food consumption'), units = c('Percent'))

# create the dataset
dataset <- data.frame(dsID = 'wfp-vam', last_updated = NA, last_scraped = as.character(as.Date(Sys.time())), name = 'United Nations World Food Programme. Food Security Analysis Service / VAM (Vulnerability Analysis and Mapping)')

## Cleaning ## 
value <- source_data
value[2] <- NULL
value <- melt(value)
value$Metadata <- NULL
value$is_number <- 1
names(value) <- c('region', 'admin1', 'admin2', 'period', 'source', 'indID', 'value', 'is_number')

# storing CSV
write.csv(value, 'data/value.csv', row.names = F)
write.csv(indicator, 'data/indicator.csv', row.names = F)
write.csv(dataset, 'data/dataset.csv', row.names = F)