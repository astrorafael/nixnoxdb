PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Observadores principales
INSERT OR REPLACE INTO observer_t(name, surname, organization) VALUES("Fernando", "Jáuregui", "AstroNavarra");
INSERT OR REPLACE INTO observer_t(name, surname, organization) VALUES("Jordi", "Medina", "ASTROAMICS");

COMMIT;