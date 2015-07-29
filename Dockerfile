###### grafana images
FROM qnib/hbase
RUN yum install -y git-core \
                   java-1.7.0-openjdk-devel \
                   make
ENV JAVA_HOME /usr/lib/jvm/jre-1.7.0
RUN git clone -b next --single-branch git://github.com/OpenTSDB/opentsdb.git /opt/opentsdb && \
    cd /opt/opentsdb && bash ./build.sh
ADD opt/qnib/opentsdb/bin/create_tsdb_tables.sh opt/qnib/opentsdb/bin/start_opentsdb.sh /opt/qnib/opentsdb/bin/
ADD etc/supervisord.d/opentsdb.ini /etc/supervisord.d/
