--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
                                 asteroid_id integer NOT NULL,
                                 name character varying(100) NOT NULL,
                                 mass numeric NOT NULL,
                                 composition text NOT NULL,
                                 is_potentially_hazardous boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
                               galaxy_id integer NOT NULL,
                               name character varying(100) NOT NULL,
                               age numeric NOT NULL,
                               distance_from_earth integer NOT NULL,
                               contains_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
                             moon_id integer NOT NULL,
                             name character varying(100) NOT NULL,
                             planet_id integer,
                             mass numeric NOT NULL,
                             is_inhabited boolean NOT NULL,
                             surface_composition text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
                               planet_id integer NOT NULL,
                               name character varying(100) NOT NULL,
                               star_id integer,
                               diameter numeric NOT NULL,
                               has_life boolean NOT NULL,
                               distance_from_star integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
                             star_id integer NOT NULL,
                             name character varying(100) NOT NULL,
                             galaxy_id integer,
                             mass integer NOT NULL,
                             temperature numeric NOT NULL,
                             is_visible boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Apophis', 27000000000, 'Rocky', true);
INSERT INTO public.asteroid VALUES (2, 'Bennu', 78000000000, 'Carbon-rich', true);
INSERT INTO public.asteroid VALUES (3, 'Ceres', 940000000000000000000, 'Water ice', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.51, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.0, 2537000, false);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 12.6, 23000000, false);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 13.3, 3000000, false);
INSERT INTO public.galaxy VALUES (5, 'Messier 82', 12.0, 12000000, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 13.0, 29000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 73500000000000000000000, false, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 10600000000000000, false, 'Dusty');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1480000000000000, false, 'Rocky');
INSERT INTO public.moon VALUES (4, 'Europa', 5, 48000000000000000000000, false, 'Icy');
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 148000000000000000000000, false, 'Rocky');
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 108000000000000000000000, false, 'Icy');
INSERT INTO public.moon VALUES (7, 'Io', 5, 89300000000000000000000, false, 'Volcanic');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 135000000000000000000000, false, 'Atmosphere rich in Nitrogen');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 108000000000000000000, false, 'Icy');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 37500000000000000000, false, 'Rocky');
INSERT INTO public.moon VALUES (11, 'Triton', 5, 21400000000000000000000, false, 'Nitrogen ice');
INSERT INTO public.moon VALUES (12, 'Nereid', 5, 31000000000000000000, false, 'Rocky');
INSERT INTO public.moon VALUES (13, 'Proxima B Moon 1', 7, 650000000000000000000, false, 'Rocky');
INSERT INTO public.moon VALUES (14, 'Proxima B Moon 2', 7, 430000000000000000000, false, 'Dusty');
INSERT INTO public.moon VALUES (15, 'Kepler 442b Moon 1', 9, 240000000000000000000, false, 'Icy');
INSERT INTO public.moon VALUES (16, 'Kepler 62e Moon 1', 10, 7000000000000000000000, false, 'Atmosphere rich in Methane');
INSERT INTO public.moon VALUES (17, 'Kepler 452b Moon 1', 11, 690000000000000000000, false, 'Rocky');
INSERT INTO public.moon VALUES (18, 'Gliese Moon 1', 12, 3200000000000000000000, false, 'Dusty');
INSERT INTO public.moon VALUES (19, 'Gliese Moon 2', 12, 2100000000000000000000, false, 'Icy');
INSERT INTO public.moon VALUES (20, 'Gliese Moon 3', 12, 5100000000000000000000, false, 'Rocky');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4879, false, 57910000);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104, false, 108200000);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 12742, true, 149600000);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6779, false, 227900000);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 139820, false, 778500000);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 116460, false, 1433000000);
INSERT INTO public.planet VALUES (7, 'Proxima b', 4, 7150, true, 7100000);
INSERT INTO public.planet VALUES (8, 'Proxima c', 4, 14240, false, 15000000);
INSERT INTO public.planet VALUES (9, 'Kepler-442b', 6, 12234, true, 104500000);
INSERT INTO public.planet VALUES (10, 'Kepler-62e', 6, 13000, false, 92000000);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 6, 16000, false, 110000000);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 4, 15300, true, 20000000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1989000, 5778, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 202000, 9940, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 1380000, 3500, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 129500, 3042, true);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 2900000, 11000, true);
INSERT INTO public.star VALUES (6, 'Vega', 3, 202000, 9602, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

