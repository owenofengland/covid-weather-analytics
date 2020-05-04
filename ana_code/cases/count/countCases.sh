#!/bin/bash

hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/cleaning/CasesCountMapper.py,hdfs://dumbo/user/joe215/project/cleaning/CasesCountReducer.py -mapper "python CasesCountMapper.py" -reducer "python CasesCountReducer.py" -input /user/joe215/project/data/newjhu/cleaning/04-30-2020/part-00000 -output /user/joe215/project/data/newjhu/count/latest
