export SPARK_HOME="/mnt/wsl/shared/lib/spark"
export HADOOP_HOME=$SPARK_HOME
export PYTHONPATH="$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.9.7-src.zip:$PYTHONPATH"
export PATH="$PATH:$SPARK_HOME/bin"
export PATH="$SPARK_HOME/python:$PATH"
