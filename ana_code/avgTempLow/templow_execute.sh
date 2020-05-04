#!/bin/bash


hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/analysis/scripts/avg_templow/tempLowAvgMapper.py,hdfs://dumbo/user/joe215/project/analysis/scripts/avg_templow/tempLowAvgReducer.py -mapper "python tempLowAvgMapper.py" -reducer "python tempLowAvgReducer.py" -input /user/joe215/project/data/weather/cleaning/*/part-* -output /user/joe215/project/analysis/templow/avg_templow
