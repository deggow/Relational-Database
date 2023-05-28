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
    name character varying(40) NOT NULL,
    age_in_by numeric(8,2),
    size_in_ly integer,
    type text,
    visible_to_naked_eye boolean NOT NULL
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
    name character varying(40) NOT NULL,
    radius numeric NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_inhabited boolean NOT NULL,
    planet_id integer
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    distance numeric(10,2) NOT NULL,
    description text,
    magnitude numeric(5,2) NOT NULL
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mass numeric NOT NULL,
    radius numeric NOT NULL,
    habitable boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    star_id integer
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
    name character varying(40) NOT NULL,
    temperature integer NOT NULL,
    luminosity integer NOT NULL,
    age integer,
    is_binary boolean NOT NULL,
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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 12.50, 26000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 13.00, 30000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (3, 'M87', 6000.00, 500000, 'Elliptical', false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 10000.00, 50000, 'Lenticular', false);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 12000.00, 50000, 'Lenticular', false);
INSERT INTO public.galaxy VALUES (6, 'IC 1101', 13700.00, 600000, 'Elliptical', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737.5, false, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.1, false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, false, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 2634.1, false, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560.8, false, false, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 2410.3, false, false, 5);
INSERT INTO public.moon VALUES (7, 'Titan', 2574.7, true, false, 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', 252.1, true, false, 6);
INSERT INTO public.moon VALUES (9, 'Mimas', 198.2, false, false, 6);
INSERT INTO public.moon VALUES (10, 'Triton', 1353.4, false, false, 7);
INSERT INTO public.moon VALUES (11, 'Charon', 603.6, false, false, 7);
INSERT INTO public.moon VALUES (12, 'Titania', 788.4, false, false, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', 584.7, false, false, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 578.9, false, false, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 235.8, false, false, 7);
INSERT INTO public.moon VALUES (16, 'Proteus', 210, false, false, 8);
INSERT INTO public.moon VALUES (17, 'Nereid', 170, false, false, 8);
INSERT INTO public.moon VALUES (18, 'Oberon', 761.4, false, false, 8);
INSERT INTO public.moon VALUES (19, 'Titov', 280, false, false, 8);
INSERT INTO public.moon VALUES (20, 'Ophelia', 21.4, false, false, 8);
INSERT INTO public.moon VALUES (21, 'Desdemona', 29.3, false, false, 9);
INSERT INTO public.moon VALUES (22, 'Bianca', 27.2, false, false, 9);
INSERT INTO public.moon VALUES (23, 'Cordelia', 20, false, false, 9);
INSERT INTO public.moon VALUES (24, 'Puck', 77.4, false, false, 9);
INSERT INTO public.moon VALUES (25, 'Caliban', 29, false, false, 9);
INSERT INTO public.moon VALUES (26, 'Sycorax', 75, false, false, 9);
INSERT INTO public.moon VALUES (27, 'Prospero', 25, false, false, 9);
INSERT INTO public.moon VALUES (28, 'Ferdinand', 12, false, false, 9);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 'Emission', 1.34, 'A diffuse nebula located in the constellation Orion', -4.00);
INSERT INTO public.nebula VALUES (2, 'Crab Nebula', 'Supernova remnant', 2.00, 'Located in the constellation Taurus', -1.00);
INSERT INTO public.nebula VALUES (3, 'Ring Nebula', 'Planetary', 0.79, 'Located in the constellation Lyra', 8.80);
INSERT INTO public.nebula VALUES (4, 'Helix Nebula', 'Planetary', 0.66, 'Located in the constellation Aquarius', 7.30);
INSERT INTO public.nebula VALUES (5, 'Lagoon Nebula', 'Emission', 4.07, 'Located in the constellation Sagittarius', 6.00);
INSERT INTO public.nebula VALUES (6, 'Cat Eye Nebula', 'Planetary', 0.32, 'Located in the constellation Draco', 9.20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.055, 2439.7, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.815, 6051.8, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.107, 3389.5, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 317.8, 69911, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.2, 58232, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 14.5, 25362, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.2, 24622, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 1.27, 1.17, false, false, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 1.44, 1.10, true, true, 6);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1d', 0.297, 0.772, true, true, 7);
INSERT INTO public.planet VALUES (12, 'HD 219134 b', 4.74, 1.606, false, false, 6);
INSERT INTO public.planet VALUES (13, 'Gliese 581d', 6.98, 1.99, true, true, 6);
INSERT INTO public.planet VALUES (14, 'Gliese 667 Cc', 3.84, 1.54, true, true, 6);
INSERT INTO public.planet VALUES (15, 'Kapteyn b', 4.8, 1.22, true, true, 6);
INSERT INTO public.planet VALUES (16, 'Tai Ceti e', 3.93, 1.61, true, true, 7);
INSERT INTO public.planet VALUES (17, 'LHS 1140 b', 6.62, 1.433, true, true, 7);
INSERT INTO public.planet VALUES (18, 'Kepler-22b', 616.5, 2.4, false, false, 8);
INSERT INTO public.planet VALUES (19, 'GJ 1214 b', 6.55, 2.678, true, true, 8);
INSERT INTO public.planet VALUES (20, 'WASP-12b', 1.4, 1.79, false, false, 9);
INSERT INTO public.planet VALUES (21, 'HD 209458 b', 0.69, 1.38, false, true, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, 1, 460000000, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 5790, 2, 600000000, false, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 3500, 100000, 8000000, false, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 9940, 26, 250000000, false, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 3042, 0, 500000000, false, 1);
INSERT INTO public.star VALUES (6, 'Vega', 9602, 37, 455000000, false, 1);
INSERT INTO public.star VALUES (7, 'Arcturus', 4286, 170, 700000000, false, 1);
INSERT INTO public.star VALUES (8, 'Antares', 3600, 15000, 12000000, false, 1);
INSERT INTO public.star VALUES (9, 'Aldebaran', 3910, 518, 650000000, false, 1);
INSERT INTO public.star VALUES (10, 'Pollux', 4750, 32, 724000000, false, 1);
INSERT INTO public.star VALUES (11, 'Regulus', 11900, 288, 340000000, false, 1);
INSERT INTO public.star VALUES (12, 'Rigel', 12100, 126000, 8000000, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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
-- Name: moon moon_planet_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_name_key UNIQUE (planet_id, name);


--
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: planet planet_star_id_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_name_key UNIQUE (star_id, name);


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

