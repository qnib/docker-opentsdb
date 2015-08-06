###### grafana images
FROM qnib/hbase
RUN yum install -y \
		   automake \
                   bsdtar \
                   java-1.7.0-openjdk-devel \
                   make 
RUN curl -fsL https://github.com/OpenTSDB/opentsdb/archive/master.zip|bsdtar xf - -C /opt/ && mv /opt/opentsdb-master /opt/opentsdb && \
    chmod +x /opt/opentsdb/bootstrap /opt/opentsdb/build.sh /opt/opentsdb/build-aux/*.sh
RUN cd /opt/opentsdb && sh /opt/opentsdb/build.sh
ADD opt/qnib/opentsdb/bin/create_tsdb_tables.sh opt/qnib/opentsdb/bin/start_opentsdb.sh /opt/qnib/opentsdb/bin/
ADD etc/supervisord.d/opentsdb.ini /etc/supervisord.d/
ADD etc/consul.d/check_*.json /etc/consul.d/
ADD etc/opentsdb.conf /etc/
