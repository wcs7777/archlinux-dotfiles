# export SPARK_HOME="/mnt/wsl/shared/lib/spark-3.41"
export SPARK_HOME="/mnt/wsl/shared/lib/spark-3.3.1-bin-hadoop3"
export HADOOP_HOME=$SPARK_HOME
export PYTHONPATH="$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.9.7-src.zip:$PYTHONPATH"
export PATH="$PATH:$SPARK_HOME/bin"
export PATH="$PATH:$SPARK_HOME/python"
