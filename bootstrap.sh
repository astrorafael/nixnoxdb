#!/bin/bash

DEFAULT_DATABASE="/var/dbase/nixnox.db"

# Either the default database or the default value
dbase="${1:-$DEFAULT_DATABASE}"

bootstrap() {
db=$1
sqlite3 ${db} <<EOF
------------------------
-- Database schema
------------------------
.read sql/schema.sql
------------------------
-- Pre-loaded Dimensions
------------------------
.read sql/date.sql
.read sql/time.sql
.read sql/flags.sql
EOF
}

bootstrap ${dbase}
