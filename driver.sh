#!/bin/bash
rm -fr test.db
sqlite3 test.db <<EOF
.read schema.sql
.read date.sql
.read time.sql
.read flags.sql
.read site.sql
.read observer.sql
.read photometer.sql
-- .read guirguillano.sql
-- .read sant_pau_de_pinos.sql
SELECT * FROM observation_t;
EOF
sqlite3 test.db
