#!/bin/bash
rm -fr test.db
sqlite3 test.db <<EOF
.read schema.sql
--------------
-- Dimensiones
--------------
.read date.sql
.read time.sql
.read flags.sql
.read site.sql
.read observer.sql
.read photometer.sql
----------------
-- Observaciones
----------------
.read guirguillano.sql
.read sant_pau_de_pinos.sql
.read virgen_de_las_veredas.sql
SELECT * FROM observation_t;
EOF
sqlite3 test.db
