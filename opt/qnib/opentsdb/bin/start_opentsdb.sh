#!/bin/bash
echo "Sleeping for 20 seconds to give HBase time to warm up"
sleep 20 

if [ ! -e /opt/opentsdb_tables_created.txt ]; then
	echo "creating tsdb tables"
	bash /opt/qnib/opentsdb/bin/create_tsdb_tables.sh
	echo "created tsdb tables"
fi

echo "starting opentsdb"
/opt/opentsdb/build/tsdb tsd --port=4242 --staticroot=/opt/opentsdb/build/staticroot --cachedir=/tmp --auto-metric
