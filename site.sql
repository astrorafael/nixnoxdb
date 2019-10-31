PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

INSERT OR REPLACE INTO site_t(site,longitude,latitude,altitude,location,province,region) 
VALUES("Observatorio de Guirguillano","42 42 41.39 N","01 51 52.46 W", 500, "Guirguillano", "Navarra", "Navarra");

INSERT OR REPLACE INTO site_t(site,longitude,latitude,altitude,location,province,region) 
VALUES("Sant Pau de Pinós","41 58 12.63 N","01 57 22.94 E", 774, "Santa Maria de Merlès", "Barcelona", "Cataluña");

INSERT OR REPLACE INTO site_t(site,longitude,latitude,altitude,location,province,region) 
VALUES("Santuario Virgen de las veredas","38 31 26.76 N","04 38 45.6 W", 481, "Torrecampo", "Córdoba", "Andalucía");

INSERT OR REPLACE INTO site_t(site,longitude,latitude,altitude,location,province,region) 
VALUES("Venta de la Leche","36 59 59.34 N","04 12 29.10 W", 1100, "Zafarraya", "Granada", "Andalucía");

COMMIT;
