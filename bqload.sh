#! /bin/bash
for i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18
do
bq load --autodetect madrid_pollution_dataset.madrid20$i gs://$GOOGLE_CLOUD_PROJECT-data/csvs_per_year/madrid20$i.csv
done
