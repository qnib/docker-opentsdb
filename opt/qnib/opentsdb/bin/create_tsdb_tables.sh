
#!/bin/bash

export COMPRESSION=NONE
export HBASE_HOME=/opt/hbase

chmod +x /opt/opentsdb/src/create_table.sh
/opt/opentsdb/src/create_table.sh
touch /opt/opentsdb_tables_created.txt
