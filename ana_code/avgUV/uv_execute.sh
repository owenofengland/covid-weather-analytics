#!/bin/bash

hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/analysis/scripts/avg_uv/uvAvgMapper.py,hdfs://dumbo/user/joe215/project/analysis/scripts/avg_uv/uvAvgReducer.py -mapper "python uvAvgMapper.py" -reducer "python uvAvgReducer.py" -input /user/joe215/project/data/weather/cleaning/*/part-* -output /user/joe215/project/analysis/uv/avg_uv
