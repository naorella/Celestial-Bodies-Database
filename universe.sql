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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(45) NOT NULL,
    is_visible_to_eye boolean,
    galaxy_type text,
    light_years_from_earth integer,
    light_years_across integer
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
    name character varying(45) NOT NULL,
    planet_id integer,
    visible_to_eye boolean,
    diameter_km numeric(5,1)
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
    name character varying(45) NOT NULL,
    earth_mass numeric(6,2),
    period_days numeric(8,2),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy_junction; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_galaxy_junction (
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    planet_galaxy_junction_id integer NOT NULL,
    name character varying(45)
);


ALTER TABLE public.planet_galaxy_junction OWNER TO freecodecamp;

--
-- Name: planet_galaxy_junction_unique_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_junction_unique_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_junction_unique_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_junction_unique_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_junction_unique_id_seq OWNED BY public.planet_galaxy_junction.planet_galaxy_junction_id;


--
-- Name: planet_plant_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_plant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_plant_id_seq OWNER TO freecodecamp;

--
-- Name: planet_plant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_plant_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(45) NOT NULL,
    is_visible_to_eye boolean,
    star_class character varying(10),
    light_years_from_earth numeric(8,3),
    solar_mass numeric(6,2),
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_plant_id_seq'::regclass);


--
-- Name: planet_galaxy_junction planet_galaxy_junction_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy_junction ALTER COLUMN planet_galaxy_junction_id SET DEFAULT nextval('public.planet_galaxy_junction_unique_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'barred spiral', NULL, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, 'barred spiral', 2500000, 152000);
INSERT INTO public.galaxy VALUES (3, 'Antennae', false, 'irregular', 45000000, 500000);
INSERT INTO public.galaxy VALUES (5, 'Bear Claw', false, 'barred spiral', 30000000, 13500);
INSERT INTO public.galaxy VALUES (4, 'Backwards', false, 'unbarred spiral', 111000000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Eye of God', false, 'unbarred spiral', 60000000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (6, 'Amalthea', 5, false, 167.0);
INSERT INTO public.moon VALUES (7, 'Himalia', 5, false, 139.6);
INSERT INTO public.moon VALUES (8, 'Elara', 5, false, 79.9);
INSERT INTO public.moon VALUES (9, 'Pasiphae', 5, false, 57.8);
INSERT INTO public.moon VALUES (10, 'Sinope', 5, false, 35.0);
INSERT INTO public.moon VALUES (11, 'Lysithea', 5, false, 42.2);
INSERT INTO public.moon VALUES (12, 'Carme', 5, false, 46.7);
INSERT INTO public.moon VALUES (14, 'Leda', 5, false, 21.5);
INSERT INTO public.moon VALUES (15, 'Thebe', 5, false, 98.6);
INSERT INTO public.moon VALUES (16, 'Adrastea', 5, false, 16.4);
INSERT INTO public.moon VALUES (17, 'Metis', 5, false, 43.0);
INSERT INTO public.moon VALUES (18, 'Callirrhoe', 5, false, 9.6);
INSERT INTO public.moon VALUES (19, 'Themisto', 5, false, 9.0);
INSERT INTO public.moon VALUES (20, 'Megaclite', 5, false, 5.0);
INSERT INTO public.moon VALUES (21, 'Taygete', 5, false, 5.0);
INSERT INTO public.moon VALUES (2, 'Io', 5, false, 3643.2);
INSERT INTO public.moon VALUES (3, 'Europa', 5, false, 3121.6);
INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 3474.8);
INSERT INTO public.moon VALUES (22, 'Phobos', 4, false, 22.5);
INSERT INTO public.moon VALUES (23, 'Deimos', 4, false, 12.4);
INSERT INTO public.moon VALUES (13, 'Ananke', 5, false, 29.1);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, true, 5268.2);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, true, 4820.6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', 0.06, 88.00, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 0.82, 225.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.11, 687.00, 1);
INSERT INTO public.planet VALUES (1, 'Earth', 1.00, 365.30, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 317.83, 4124.50, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.16, 10738.60, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.53, 30687.00, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.15, 60190.00, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.00, 90560.10, 1);
INSERT INTO public.planet VALUES (10, 'b', 5.10, 4.22, 2);
INSERT INTO public.planet VALUES (11, 'c', 18.00, 38.00, 2);
INSERT INTO public.planet VALUES (12, 'd', 0.26, 5.12, 3);
INSERT INTO public.planet VALUES (13, 'b', 1.07, 11.19, 3);


--
-- Data for Name: planet_galaxy_junction; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_galaxy_junction VALUES (1, 1, 1, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (2, 1, 2, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (3, 1, 3, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (4, 1, 4, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (5, 1, 5, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (6, 1, 6, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (7, 1, 7, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (8, 1, 8, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (9, 1, 9, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (10, 1, 10, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (11, 1, 11, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (12, 1, 12, NULL);
INSERT INTO public.planet_galaxy_junction VALUES (13, 1, 13, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 'G2V', NULL, 1.00, 1);
INSERT INTO public.star VALUES (2, '61 Virginis', true, 'G7V', 27.836, 0.95, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', false, 'M5.5Ve', 4.247, 0.12, 1);
INSERT INTO public.star VALUES (4, 'Alpheratz', true, 'B8IV-VHgMn', 97.000, 3.80, 2);
INSERT INTO public.star VALUES (5, 'Mirach', true, 'M0 III', 199.000, 2.49, 2);
INSERT INTO public.star VALUES (6, '7 Andromedae', true, 'F1V', 76.600, 1.60, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_galaxy_junction_unique_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_junction_unique_id_seq', 13, true);


--
-- Name: planet_plant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_plant_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet_galaxy_junction planet_galaxy_junction_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy_junction
    ADD CONSTRAINT planet_galaxy_junction_pkey PRIMARY KEY (planet_galaxy_junction_id);


--
-- Name: planet_galaxy_junction planet_galaxy_junction_planet_id_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy_junction
    ADD CONSTRAINT planet_galaxy_junction_planet_id_galaxy_id_key UNIQUE (planet_id, galaxy_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_plant_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_plant_id_key UNIQUE (planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_galaxy_junction planet_galaxy_junction_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy_junction
    ADD CONSTRAINT planet_galaxy_junction_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet_galaxy_junction planet_galaxy_junction_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy_junction
    ADD CONSTRAINT planet_galaxy_junction_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

