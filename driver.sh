#!/bin/bash
rm -fr nixnox.db
sqlite3 nixnox.db <<EOF
.load /usr/local/lib/libsqlitefunctions
.read sql/schema.sql
--------------
-- Dimensiones
--------------
.read sql/date.sql
.read sql/time.sql
.read sql/flags.sql
.read sql/site.sql
.read sql/observer.sql
.read sql/photometer.sql
----------------
-- Observaciones
----------------
.read sql/guirguillano.sql
.read sql/sant_pau_de_pinos.sql
.read sql/virgen_de_las_veredas.sql
.read sql/venta_de_la_leche.sql
.read sql/tentudia.sql
SELECT * FROM observation_t;
EOF
sqlite3 nixnox.db
