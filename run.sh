Rscript code/scraper.R
mv scraperwiki.sqlite ../
zip -r data/wfp-vam.zip data/indicator.csv data/value.csv data/dataset.csv
mv data/wfp-vam.zip http/csv.zip