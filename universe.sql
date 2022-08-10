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
    name character varying(64) NOT NULL,
    description text,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spiral boolean,
    magnitude numeric
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
    name character varying(16) NOT NULL,
    description text,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean,
    temperature numeric,
    planet_id integer NOT NULL
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
    name character varying(16) NOT NULL,
    description text,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean,
    temperature numeric,
    star_id integer NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(16) NOT NULL,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    distance_from_earth integer,
    mass integer,
    has_life boolean,
    is_double_star boolean,
    temperature numeric,
    galaxy_id integer NOT NULL
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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'All stars visible to the naked eye belong to our galaxy, but often the term "Milky Way" is applied to a light hazy band in the night sky. Due to the fact that the Earth is inside the Milky Way, the exact view of our Galaxy from the outside is unknown.', 25, 10, true, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'The Large Magellanic Cloud is often referred to as an irregular galaxy, although there is some order in its structure, so it is more correct to classify it as a Magellanic spiral galaxy', 163, 4, false, false, 0.9);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'dwarf irregular galaxy', 206, 900, false, false, 2.7);
INSERT INTO public.galaxy VALUES (4, 'Big Dipper', 'Big Dipper is a galaxy that orbits the Milky Way. It was discovered by Bat Willman et al. in 2005.', 330, 7, false, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 'dwarf spheroidal galaxy', 2430, 1, false, false, 13.9);
INSERT INTO public.galaxy VALUES (6, 'Leo', 'dwarf elliptical galaxy in the constellation Leo', 820, 3, false, false, 11.18);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Selene', 0, 0, false, false, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Metis', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (3, 'Adrastea', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (4, 'Amalthea', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Thebe', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Io', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Europe', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Ganymede', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Metis', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Callisto', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (11, 'Themisto', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (12, 'Leda', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (13, 'Himalia', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (14, 'Ersa', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (15, 'Pandia', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (16, 'Lysitea', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (17, 'Elara', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (18, 'Dia', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (19, 'Karpo', '', 0, 0, false, false, NULL, 5);
INSERT INTO public.moon VALUES (20, 'Valetuda', '', 0, 0, false, false, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', '', 0, 0, false, false, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', '', 0, 0, false, false, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Earth', '', 0, 0, false, false, NULL, 1);
INSERT INTO public.planet VALUES (4, 'Mars', '', 0, 0, false, false, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', '', 0, 0, false, false, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', '', 0, 0, false, false, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', '', 0, 0, false, false, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', '', 0, 0, false, false, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', '', 0, 0, false, false, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', '', 0, 0, false, false, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', '', 0, 0, false, false, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', '', 0, 0, false, false, NULL, 1);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Satellite-1', 'Launched by the USSR in 1957', 3);
INSERT INTO public.satellite VALUES (2, 'Explorer-1', 'Launched by USA in 1958', 3);
INSERT INTO public.satellite VALUES (3, 'Ariel-1', 'Launched by UK in 1962', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The best sun of the Universe', 150, 2000, true, false, 5778, 1);
INSERT INTO public.star VALUES (2, 'S Dorado', 'The brightest star in the Large Magellanic Cloud, a satellite of our Galaxy. It is a hypergiant, one of the brightest stars known to science.', 169, 60, false, false, 10000, 2);
INSERT INTO public.star VALUES (3, 'N81', '', 200, 500, false, false, 10000, 3);
INSERT INTO public.star VALUES (4, 'Alula North', '', 30, 250, false, true, NULL, 4);
INSERT INTO public.star VALUES (5, 'WOH G64', '', 50, 450, false, false, NULL, 5);
INSERT INTO public.star VALUES (6, 'RW Cephei', '', 100, 600, false, false, NULL, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 1, false);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: satellite satellite_satellite_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_satellite_id_key UNIQUE (satellite_id);


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
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


