# ubuntu base img
FROM ubuntu:latest

#update apt-get
RUN apt-get -y update \
&& apt-get -y upgrade 

#install applications
RUN apt-get install -y sudo
RUN apt-get install -y wget
RUN apt-get install -y tar
RUN apt-get install -y nano
RUN apt-get install -y curl mlocate git scala

#java
RUN apt install -y openjdk-17-jdk openjdk-17-jre
RUN wget https://dlcdn.apache.org/spark/spark-3.3.2/spark-3.3.2-bin-hadoop3.tgz
RUN tar -xvzf spark-3.3.2-bin-hadoop3.tgz \
&& mv spark-3.3.2-bin-hadoop3 /mnt/spark

#python
RUN apt install -y python3.10
RUN apt install -y python3-pip
RUN pip3 install pyspark \
&& pip3 install jsons \
&& pip3 install pandas

RUN pip3 install jupyter

#정리 커맨드
RUN rm /spark-3.3.2-bin-hadoop3.tgz

RUN mkdir /home/work-dir
WORKDIR /home/work-dir

CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--allow-root"]


# jupyter notebook --ip 0.0.0.0 --allow-root

# docker run -v C:/Users/asdf/Desktop/myfolder:/home/work-dir -it -p 5000:8888 jupytertest

# 도커 런
# docker run -v <local dir>:<container dir> -p <local port>:<container port> -it <img name>
# 도커 엑세큐트 - 도커 런타임 명령하기
# docker exec -it <dockerid or name> <command option such as bash, python etc.>
# 도커 시작 - 정지된 도커 다시 활용하기
# docker start <dockerid or name>