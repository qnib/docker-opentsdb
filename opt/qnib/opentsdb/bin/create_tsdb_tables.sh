
#!/bin/bash

export COMPRESSION=NONE
export HBASE_HOME=/opt/hbase

/opt/opentsdb/src/create_table.sh
touch /opt/opentsdb_tables_created.txt
