# COVID & Weather 
## Project for the NYU Course: Processing Big Data for Analytics Applications
This is my final project for the aforementioned course, looking for relationships between COVID 19 cases and deaths and various weather indices. These weather indices are (daily) Low Temperature (overnight low), High Temperature (daytime high), Max Temperature (max temperature in 24 hour period), Min Temperature (minimum temperature in 24 hour period), UV Index, Humidity Index.

## Tools Used
1. Hadoop/HDFS
2. Python + MapReduce
3. Impala
4. Crontab + API Data Collection

## Directory/Repository Explanation and Structure

* `test_code` contains directories holding largely unused scripts, and queries in the final analytic but are kept for potential future reference

* `screenshots` are images of the analytic running at various stages from data cleaning, to initial analysis, and queries against tables with impala

* `profiling_code` contains the MapReduce python scripts to count the number of lines before and after cleaning the input data of both the Johns Hopkins University COVID 19 data and weather data by county provided by the DarkSky API. Within the JHU folder there are two sets of shell scripts. The shell scripts not in the folder called `new` are from the initial API I used to collect county level COVID data. However, that API was deprecated so I had to shift to collecting the JHU data from another source (that ended up being their GitHub repository), and so the profiling scripts for that new source are in the folder `new`.

* `etl_code` contains the cleaning code for both the JHU data and the weather data from the darksky API. This is composed of both MapReduce python scripts as well as shell scripts to automate running the MapReduce jobs by cycling through input and ouput paths. Once again there are two levels of directories in the JHU folder for the same reason as mentioned in `profiling code`.

* `data_ingest` contains the scripts that were used to collect data from the DarkSky weather API and county level COVID data from JHU. Original contains the initial version of these scripts as a single python script, however once the initial API I was using to collect JHU data was deprecated a chunk of this code had to be rewritten. That rewritten code was broken into `newJHUGrab.sh` and `newWeatherGrab.py` to collect the JHU data and Weather data. This daily data collection was automated via a cron job running every 24 hours within an AWS EC2 instance and the crontab configuration is displayed in the screenshot included in the folder.

* `ana_code` is the bulk of the project, containing the core analytics MapReduce python scripts and impala queries with shell scripts to automate the execution of both MapReduce and impala jobs. At the top level the folders named `avg*`, where `*` is a wildcard for the various folders with that naming convention, contain MapReduce python scripts and automation shell scripts to execute the jobs upon the cleaned data produced by scripts from within `etl_code`. `cases` contains three folders, `count` is a MapReduce job that reduces the cleaned data to only locations and case counts, `growth` calculates the daily percent growth (positive or negative) per location, and `avg_growth` averages those growth percentages calculated. `deaths` is largely the same, except it does not have a `count` folder. `impala-scripts` contains the sql queries run on tables that are composed of the output from the MapReduce jobs in all the other analytics folders. There are two versions of every .sql file, for both cases and deaths, and accompanying shell scripts for each to automate running those .sql files. These impala SQL scripts calculate things such as the correlation coefficient, linear regression slope and intercept, as well as the average death/case growth rate broken down into various brackets related to the weather indices chosen for this project. Inside the `maketable` folder under `impala-scripts` are SQL scripts and an accompanying bash file to automate the creation of the tables in impala.

## My HDFS structure/MapReduce Job Output and Impala Output

Within my HDFS directory called `project` there are three subfolders named `data`, `cleaning`, `analysis`. 

### HDFS Data folder
Within `data` there are three folders for weather, jhu, and newjhu (see `profiling_code` in directory/repository explanation). Within each of these data types there are folders for `cleaning`, `gold`, and `profiling`. 

`gold` contains the raw, original data pulled from the data source. `profiling` contains two further directories named `pre_clean` and `post_clean`, and these contain the output from the scripts run from `profiling`, detailing the number of rows of data in the file before and after it has been cleaned (this is run on each daily record so there are folders for each day). `cleaning` contains the output of the mapreduce jobs that clean the data (there is a folder for the output for each day).

### HDFS Cleaning folder
`cleaning` is where the python scripts to run the profiling and cleaning MapReduce jobs were placed.

### HDFS Analysis folder
`analysis` is once again the largest folder in HDFS, just like it is in this repository. It holds folders for each of the weather indices, as well as for both cases, and deaths as well as a `scripts` folder.

`scripts`, like the `cleaning` folder, holds the python code to run the MapReduce jobs.

`cases` is broken down to have directories for the output of each type of MapReduce job that was written, and within each of these directories there are folders containing the output for each day. This is the same for `deaths`.

The weather indicies all contain the output for each MapReduce job related to the specific weather index with subfolders for each specific day of data.

## Running this project

1. Get source data into HDFS (or continue collection if so inclined with the scripts in `data_ingest`)
2. Profiling and Cleaning
	1. Run the pre-clean shell scripts for each data source (`profiling_code`), the output of which will go to the pre-clean folder for the respective data source in HDFS
	2. Afterward, run the auto-clean shell scripts for each data source (`etl_code`), the output will go to the cleaning folder for the respectice data source in HDFS
	3. Lastly, run the post-clean shell scripts for each data source (`profiling_code`), the output of which will go to the post-clean folder for the respective data source in HDFS
3. Initial analytics MapReduce jobs
	1. For every folder, and subfolder in `ana_code` except for the impala folder run the shell scripts, the output of these jobs will go there respective subfolder for the weather index/case/death in the HDFS analysis folder
4. Create impala tables
	1. Create external impala tables from the output generated by the above MapReduce jobs (they columns are tab separated) according to the screenshot in the `screenshots` folder. The first column should be named place (with type string), and the second column should be named the word after the letters "avg" or "case" in the table name (with type double).
	2. Or, use the automated bash script located in the `maketable` folder.
5. Run all of the impala queries via using the shell scripts. The output of these will be directly printed to the terminal.

## Data Sources
1. Originally JHU API: https://corona.lmao.ninja/jhucsse
2. DarkSky Weather API: https://darksky.net/dev (Unfortunately, they no longer seem to be talking signups)
3. New JHU data source: https://github.com/CSSEGISandData/COVID-19


