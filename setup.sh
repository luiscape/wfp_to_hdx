cd ..
rm -rf -- tool
mv wfp_to_hdx tool
#crontab -l | { cat; echo "@daily bash tool/run.sh"; } | crontab -
printf "Now install the packages reshape2 and sqldf in R.\n"
R
