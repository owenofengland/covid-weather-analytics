#!/bin/bash
for i in `hdfs dfs -ls project/data/weather/gold | awk '{print $NF}' | grep .csv$ | tr '\n' ' '`
do
	file="${i##*/}"
	filename="${file%.*}"
	echo "$i"
	echo "$filename"
	hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/cleaning/WeatherCleanMapper.py,hdfs://dumbo/user/joe215/project/cleaning/attempt2.py -mapper "python WeatherCleanMapper.py" -reducer "python attempt2.py" -input "/user/joe215/$i" -output "/user/joe215/project/data/weather/cleaning/$filename"
done
