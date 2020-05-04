#!/bin/bash


hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/analysis/scripts/avg_humidity/humidityAvgMapper.py,hdfs://dumbo/user/joe215/project/analysis/scripts/avg_humidity/humidityAvgReducer.py -mapper "python humidityAvgMapper.py" -reducer "python humidityAvgReducer.py" -input /user/joe215/project/data/weather/cleaning/*/part-* -output /user/joe215/project/analysis/humidity/avg_humidity
