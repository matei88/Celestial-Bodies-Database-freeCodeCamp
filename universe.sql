CREATE DATABASE universe;

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    age NUMERIC NOT NULL,
    distance_from_earth INT NOT NULL,
    contains_life BOOLEAN NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id) ON DELETE CASCADE,
    mass INT NOT NULL,
    temperature NUMERIC NOT NULL,
    is_visible BOOLEAN NOT NULL
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id) ON DELETE CASCADE,
    diameter NUMERIC NOT NULL,
    has_life BOOLEAN NOT NULL,
    distance_from_star INT NOT NULL
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id) ON DELETE CASCADE,
    mass NUMERIC NOT NULL,
    is_inhabited BOOLEAN NOT NULL,
    surface_composition TEXT
);

CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    mass NUMERIC NOT NULL,
    composition TEXT NOT NULL,  -- TEXT column
    is_potentially_hazardous BOOLEAN NOT NULL
);


INSERT INTO galaxy (name, age, distance_from_earth, contains_life)
VALUES
    ('Milky Way', 13.51, 0, TRUE),
    ('Andromeda', 10.0, 2537000, FALSE),
    ('Whirlpool', 12.6, 23000000, FALSE),
    ('Triangulum', 13.3, 3000000, FALSE),
    ('Messier 82', 12.0, 12000000, FALSE),
    ('Sombrero', 13.0, 29000000, FALSE);

INSERT INTO star (name, galaxy_id, mass, temperature, is_visible)
VALUES
    ('Sun', 1, 1989000, 5778, TRUE),
    ('Sirius', 1, 202000, 9940, TRUE),
    ('Betelgeuse', 1, 1380000, 3500, TRUE),
    ('Proxima Centauri', 2, 129500, 3042, TRUE),
    ('Rigel', 1, 2900000, 11000, TRUE),
    ('Vega', 3, 202000, 9602, TRUE);

INSERT INTO planet (name, star_id, diameter, has_life, distance_from_star)
VALUES
    ('Mercury', 1, 4879, FALSE, 57910000),
    ('Venus', 1, 12104, FALSE, 108200000),
    ('Earth', 1, 12742, TRUE, 149600000),
    ('Mars', 1, 6779, FALSE, 227900000),
    ('Jupiter', 1, 139820, FALSE, 778500000),
    ('Saturn', 1, 116460, FALSE, 1433000000),
    ('Proxima b', 4, 7150, TRUE, 7100000),
    ('Proxima c', 4, 14240, FALSE, 15000000),
    ('Kepler-442b', 6, 12234, TRUE, 104500000),
    ('Kepler-62e', 6, 13000, FALSE, 92000000),
    ('Kepler-452b', 6, 16000, FALSE, 110000000),
    ('Gliese 581g', 4, 15300, TRUE, 20000000);

INSERT INTO moon (name, planet_id, mass, is_inhabited, surface_composition)
VALUES
    ('Moon', 3, 7.35E22, FALSE, 'Rocky'),
    ('Phobos', 4, 1.06E16, FALSE, 'Dusty'),
    ('Deimos', 4, 1.48E15, FALSE, 'Rocky'),
    ('Europa', 5, 4.8E22, FALSE, 'Icy'),
    ('Ganymede', 5, 1.48E23, FALSE, 'Rocky'),
    ('Callisto', 5, 1.08E23, FALSE, 'Icy'),
    ('Io', 5, 8.93E22, FALSE, 'Volcanic'),
    ('Titan', 6, 1.35E23, FALSE, 'Atmosphere rich in Nitrogen'),
    ('Enceladus', 6, 1.08E20, FALSE, 'Icy'),
    ('Mimas', 6, 3.75E19, FALSE, 'Rocky'),
    ('Triton', 5, 2.14E22, FALSE, 'Nitrogen ice'),
    ('Nereid', 5, 3.1E19, FALSE, 'Rocky'),
    ('Proxima B Moon 1', 7, 6.50E20, FALSE, 'Rocky'),
    ('Proxima B Moon 2', 7, 4.3E20, FALSE, 'Dusty'),
    ('Kepler 442b Moon 1', 9, 2.4E20, FALSE, 'Icy'),
    ('Kepler 62e Moon 1', 10, 7.0E21, FALSE, 'Atmosphere rich in Methane'),
    ('Kepler 452b Moon 1', 11, 6.9E20, FALSE, 'Rocky'),
    ('Gliese Moon 1', 12, 3.2E21, FALSE, 'Dusty'),
    ('Gliese Moon 2', 12, 2.1E21, FALSE, 'Icy'),
    ('Gliese Moon 3', 12, 5.1E21, FALSE, 'Rocky');

INSERT INTO asteroid (name, mass, composition, is_potentially_hazardous)
VALUES
    ('Apophis', 2.7E10, 'Rocky', TRUE),
    ('Bennu', 7.8E10, 'Carbon-rich', TRUE),
    ('Ceres', 9.4E20, 'Water ice', FALSE);

