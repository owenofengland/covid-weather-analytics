for i in `hdfs dfs -ls project/data/jhu/gold | awk '{print $NF}'| grep .csv$ | tr '\n' ' '`
do
	file="${i##*/}"
	filename="${file%.*}"
	echo "$i"
	echo "$filename"
hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/cleaning/CountRecsMapper.py,hdfs://dumbo/user/joe215/project/cleaning/CountRecsReducer.py -mapper "python CountRecsMapper.py" -reducer "python CountRecsReducer.py" -input /user/joe215/$i -output /user/joe215/project/data/jhu/profiling/pre_clean/$filename
done
