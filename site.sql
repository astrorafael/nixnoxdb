PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

INSERT OR REPLACE INTO site_t(site,longitude,latitude,altitude,location,region,country) 
VALUES("Observatorio de Guirguillano","42 42 41.39 N","01 51 52.46 W", 500, "Navarra", "Navarra", "España");

INSERT OR REPLACE INTO site_t(site,longitude,latitude,altitude,location,region,country) 
VALUES("Sant Pau de Pinós","41 58 12.63 N","01 57 22.94 E", 774, "Barcelona", "Cataluña", "España");

COMMIT;
