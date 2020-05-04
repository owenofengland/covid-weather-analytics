#!/bin/bash


hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/analysis/scripts/avg_temphigh/tempHighAvgMapper.py,hdfs://dumbo/user/joe215/project/analysis/scripts/avg_temphigh/tempHighAvgReducer.py -mapper "python tempHighAvgMapper.py" -reducer "python tempHighAvgReducer.py" -input /user/joe215/project/data/weather/cleaning/*/part-* -output /user/joe215/project/analysis/temphigh/avg_temphigh
