PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

INSERT OR REPLACE INTO site_t(site,longitude,latitude,altitude,location,region,country) 
VALUES("Observatorio de Guirguillano","42 42 41.39 N","01 51 52.46 W", 500, "Navarra", "Navarra", "España");

COMMIT;
