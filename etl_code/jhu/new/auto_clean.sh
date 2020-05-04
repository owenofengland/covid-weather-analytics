#!/bin/bash
for i in `hdfs dfs -ls project/data/newjhu/gold | awk '{print $NF}'| grep .csv$ | tr '\n' ' '`
do
	file="${i##*/}"
	filename="${file%.*}"
	echo "$i"
	echo "$filename"
	hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/cleaning/newJHUCleanMapper.py,hdfs://dumbo/user/joe215/project/cleaning/newJHUCleanReducer.py -mapper "python newJHUCleanMapper.py" -reducer "python newJHUCleanReducer.py" -input "/user/joe215/$i" -output "/user/joe215/project/data/newjhu/cleaning/$filename"

done

