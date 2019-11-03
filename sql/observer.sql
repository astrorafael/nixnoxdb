PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- Observadores principales
INSERT OR REPLACE INTO observer_t(name, surname, organization) VALUES("Fernando", "Jáuregui", "AstroNavarra");
INSERT OR REPLACE INTO observer_t(name, surname, organization) VALUES("Jordi", "Medina", "ASTROAMICS");
INSERT OR REPLACE INTO observer_t(name, surname, organization) VALUES("Manolo", "Barco", "Astro Córdoba");
INSERT OR REPLACE INTO observer_t(name, surname) VALUES("Jesús", "Navas Fernández");
INSERT OR REPLACE INTO observer_t(name, surname) VALUES("Felipe", "Gallego");


COMMIT;