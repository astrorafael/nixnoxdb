PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS site_t
(
    site_id          INTEGER PRIMARY KEY,
    site             TEXT, -- Site Name i.e Cerro de Almodovar
    longitude        REAL, -- in floating point degrees, negative west
    latitude         REAL, -- in floating point degrees
    elevation        REAL, -- meters above sea level
    location         TEXT, -- i.e. Coslada
    province         TEXT, -- i.e. Madrid
    country          TEXT  -- i.e España
    -- PRIMARY KEY (site)
);

INSERT INTO site_t VALUES("Observatorio de Guirguillano","42 42 41.39 N","01 51 52.46 W", 500, "Navarra", "España");

COMMIT;
