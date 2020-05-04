for dir in `hdfs dfs -ls project/data/newjhu/cleaning/*/ | awk '{print $NF}' | grep "part-00000" | tr '\n' ' '`; 
do 
file=$(basename "${dir}"); 
parent="$(basename "$(dirname "${dir}")")"; 
echo $parent;
echo $dir
hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-streaming.jar -D mapreduce.job.reduces=1 -files hdfs://dumbo/user/joe215/project/cleaning/CountRecsMapper.py,hdfs://dumbo/user/joe215/project/cleaning/CountRecsReducer.py -mapper "python CountRecsMapper.py" -reducer "python CountRecsReducer.py" -input /user/joe215/$dir -output /user/joe215/project/data/newjhu/profiling/post_clean/$parent
done;