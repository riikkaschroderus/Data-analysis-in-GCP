# Data Analysis in GCP

In this project we explore Madrid's Air Quality during years 2001-2018. The dataset can be found from [Kaggle](https://www.kaggle.com/decide-soluciones/air-quality-madrid). The analysis is done in [Google Cloud Platform (GCP)](https://cloud.google.com) using BigQuery and Datalab.

## Prerequisites

* Google Cloud account
* A GCP project with billing enabled


## Set Up

* Load the dataset from [Kaggle: Air Quality in Madrid (2001-2018)](https://www.kaggle.com/decide-soluciones/air-quality-madrid) to your computer. For this project, it is enough to load just the folder `csvs_per_year.zip`; by unzipping you will have a folder called
<center>`csvs_per_year`</center>
with files
<center>`madrid[YEAR].csv`,</center>
where `YEAR` has values from 2001 until 2018.

* Create a bucket to the Cloud Storage of you project, for instance, in the Cloud Shell by command:
```
gsutil mb -l europe-north1 gs://$GOOGLE_CLOUD_PROJECT-data
```

* Upload the folder `csvs_per_year` from your computer to your bucket.

* Enable BigQuery API in Cloud Shell by command
```
gcloud services enable bigquery-json.googleapis.com
```

* Create a BigQuery dataset by
```
bq mk madrid_pollution_dataset
```

* By using the provided shell script <center>`bqload.sh`</center>
you can load the dataset to BigQuery by the command
```
bash bqload.sh
```

* Enable Compute Engine API
```
gcloud services enable compute.googleapis.com
```

* Create a Datalab virtual machine called, for instance, `mydatalab`, by the command
```
datalab create --disk-size-gb 20 \
--zone europe-north1-a \
--no-create-repository mydatalab
```

* Connect to your datalab by
```
datalab connect mydatalab
```

* Copy the provided notebook <center>`madrid-air-quality-2001-2018.ipynb`</center> to your computer and upload it to your datalab (or clone the whole repository).

* Explore the notebook and have fun! You can, for instance, change the selected columns (NO_2 and O_3) or rows (years).

## Clean Up

* Shutdown your datalab by
```
datalab stop mydatalab
```
* You can check the status of your datalab by
```
datalab list
```
before you exit the Cloud Shell.

* If you want to permanently delete the datalab from your Cloud project, use the command
```
datalab delete --delete-disk mydatalab
```
