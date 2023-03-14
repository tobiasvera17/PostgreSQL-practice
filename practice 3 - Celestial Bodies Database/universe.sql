--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    has_water boolean,
    light_years_from_earth integer,
    diameter_light_years integer
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
-- Name: life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life (
    life_id integer NOT NULL,
    name character varying(30) NOT NULL,
    population_in_billions numeric(3,1),
    age_in_years integer,
    avg_life_expectancy integer,
    have_religions boolean,
    have_civilizations boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.life OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_life_id_seq OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_life_id_seq OWNED BY public.life.life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    light_years_from_earth integer,
    has_water boolean,
    mass_in_mj real,
    planet_id integer NOT NULL,
    has_oxygen boolean
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
    name character varying(30) NOT NULL,
    mass_in_mj real,
    light_years_from_earth integer,
    has_life boolean,
    has_water boolean,
    star_id integer NOT NULL,
    has_oxygen boolean
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
    name character varying(30) NOT NULL,
    radius real,
    is_dead boolean,
    is_multiple boolean,
    galaxy_id integer NOT NULL,
    light_years_from_earth integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: life life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life ALTER COLUMN life_id SET DEFAULT nextval('public.life_life_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Nearest large galaxy', true, true, 2480000, 200000);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'Discovered in 2003', true, true, 25000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'Has the appearance of a double galaxy', true, true, 500000000, NULL);
INSERT INTO public.galaxy VALUES (4, 'MAffei 1', 'Discovered in 1960', true, true, 9800000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Milky way', 'Large spiral system', true, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Virgo A', 'Giant elliptical galaxy', true, true, 55000000, NULL);


--
-- Data for Name: life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life VALUES (1, 'Andromedians', 78.0, 120000000, 150, false, true, 1);
INSERT INTO public.life VALUES (2, 'Canis', 7.0, 500000, 80, true, true, 3);
INSERT INTO public.life VALUES (3, 'Cygnusis', 65.0, 1500000, 180, true, true, 5);
INSERT INTO public.life VALUES (4, 'Maffeis', 8.0, 98500000, 200, false, true, 7);
INSERT INTO public.life VALUES (5, 'Mumans', 7.0, 50000000, 80, true, true, 10);
INSERT INTO public.life VALUES (6, 'Virgos', 7.0, 10000, 100, false, true, 11);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'PA-99-N2-M1', 693, false, 3.34, 1, false);
INSERT INTO public.moon VALUES (2, 'PA-99-N2-M2', 693, false, 3.34, 1, true);
INSERT INTO public.moon VALUES (4, 'PA-99-N3-M2', 9030, false, 5.34, 2, false);
INSERT INTO public.moon VALUES (3, 'PA-99-N3-M1', 9030, false, 5.34, 2, true);
INSERT INTO public.moon VALUES (5, 'DF-85-J4-M1', 9030, true, 5.25, 3, true);
INSERT INTO public.moon VALUES (6, 'DF-85-J4-M2', 9030, false, 5.25, 3, true);
INSERT INTO public.moon VALUES (7, 'DF-87-J4-M1', 9030, false, 5.25, 4, true);
INSERT INTO public.moon VALUES (8, 'DF-87-J4-M2', 9030, false, 5.25, 4, false);
INSERT INTO public.moon VALUES (9, 'CA-64-k3-M1', 2600, false, 15.25, 5, false);
INSERT INTO public.moon VALUES (10, 'CA-64-k3-M2', 2600, false, 15.25, 5, false);
INSERT INTO public.moon VALUES (11, 'CA-64-k4-M1', 2600, false, 13.25, 6, false);
INSERT INTO public.moon VALUES (12, 'CA-64-k4-M2', 2600, false, 13.25, 6, false);
INSERT INTO public.moon VALUES (13, 'AC-98-C1-M1', 228, false, 4.51, 7, true);
INSERT INTO public.moon VALUES (14, 'AC-98-C1-M2', 228, false, 4.51, 7, true);
INSERT INTO public.moon VALUES (15, 'AC-98-C2-M1', 228, true, 4.51, 8, true);
INSERT INTO public.moon VALUES (16, 'AC-98-C2-M2', 228, true, 4.51, 8, true);
INSERT INTO public.moon VALUES (17, 'MW-86-E3-M1', 5, true, 3.65, 9, true);
INSERT INTO public.moon VALUES (18, 'MW-86-E5-M1', 5, true, 3.65, 10, true);
INSERT INTO public.moon VALUES (19, 'SP-12-V1-M1', 250, false, 2.15, 11, true);
INSERT INTO public.moon VALUES (21, 'SP-12-V2-M1', 250, false, 2.15, 12, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (7, 'AC-98-C1', 8.47, 228, true, true, 4, true);
INSERT INTO public.planet VALUES (8, 'AC-98-C2', 9.65, 228, false, false, 4, false);
INSERT INTO public.planet VALUES (9, 'MW-86-E3', 5.25, 5, false, false, 5, false);
INSERT INTO public.planet VALUES (10, 'MW-86-E5', 6.67, 5, true, true, 5, true);
INSERT INTO public.planet VALUES (11, 'SP-12-V1', 3.25, 250, true, true, 6, true);
INSERT INTO public.planet VALUES (12, 'SP-12-V2', 4.25, 250, false, false, 6, false);
INSERT INTO public.planet VALUES (1, 'PA-99-N2', 6.34, 693, true, true, 1, true);
INSERT INTO public.planet VALUES (3, 'DF-85-J4', 8.25, 9030, true, true, 2, true);
INSERT INTO public.planet VALUES (4, 'DF-87-J4', 9.27, 9030, false, false, 2, false);
INSERT INTO public.planet VALUES (5, 'CA-64-k3', 18.96, 2600, true, true, 3, true);
INSERT INTO public.planet VALUES (6, 'CA-64-k4', 15.39, 2600, false, false, 3, false);
INSERT INTO public.planet VALUES (2, 'PA-99-N3', 7.34, 693, false, false, 1, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Omicron Andromedae', 6.6, false, false, 1, 692);
INSERT INTO public.star VALUES (2, 'Sirius', 1.711, false, true, 2, 9000);
INSERT INTO public.star VALUES (3, 'Deneb', 203, false, false, 3, 2600);
INSERT INTO public.star VALUES (4, 'Alpha Cassiopeiae', 45.4, false, false, 4, 228);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 0.145, false, false, 5, 4);
INSERT INTO public.star VALUES (6, 'Spica', 7.47, false, false, 6, 250);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: life_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_life_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: life life_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_name_key UNIQUE (name);


--
-- Name: life life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_pkey PRIMARY KEY (life_id);


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
-- Name: life fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--