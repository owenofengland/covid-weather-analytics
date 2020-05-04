#!/bin/bash

hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/analysis/scripts/avg_tempmax/tempMaxAvgMapper.py,hdfs://dumbo/user/joe215/project/analysis/scripts/avg_tempmax/tempMaxAvgReducer.py -mapper "python tempMaxAvgMapper.py" -reducer "python tempMaxAvgReducer.py" -input /user/joe215/project/data/weather/cleaning/*/part-* -output /user/joe215/project/analysis/tempmax/avg_tempmax
