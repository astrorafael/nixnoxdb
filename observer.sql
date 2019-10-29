PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Observador principal
INSERT OR REPLACE INTO observer_t(name, surname, organization) VALUES("Fernando", "Jáuregui", "AstroNavarra");
COMMIT;