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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth integer,
    number_of_stars integer,
    galaxy_id integer NOT NULL
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
    name character varying(50),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(4,1),
    moon_id integer NOT NULL,
    distance_from_earth integer,
    number_of_spacestations integer,
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
    name character varying(50),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(4,1),
    planet_id integer NOT NULL,
    distance_from_earth integer,
    number_of_moons integer,
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
-- Name: spacestation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacestation (
    spacestation_id integer NOT NULL,
    moon_id integer,
    name character varying(50) NOT NULL
);


ALTER TABLE public.spacestation OWNER TO freecodecamp;

--
-- Name: spacestation_spacestation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacestation_spacestation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacestation_spacestation_id_seq OWNER TO freecodecamp;

--
-- Name: spacestation_spacestation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacestation_spacestation_id_seq OWNED BY public.spacestation.spacestation_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50),
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth integer,
    number_of_planets integer,
    star_id integer NOT NULL,
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
-- Name: spacestation spacestation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacestation ALTER COLUMN spacestation_id SET DEFAULT nextval('public.spacestation_spacestation_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('milky way', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.galaxy VALUES ('silky way', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.galaxy VALUES ('andromeda', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.galaxy VALUES ('prometheus', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.galaxy VALUES ('hephaistos', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.galaxy VALUES ('mars', NULL, NULL, NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 8);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, 9);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 10);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 11);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 12);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, 8);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, 9);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, 10);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, 11);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, 12);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, 13);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, 14);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, 15);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, 15);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, 16);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, 17);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, 18);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, 19);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, 19);
INSERT INTO public.moon VALUES (NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, 17);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('plans', NULL, NULL, NULL, NULL, 8, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('zwans', NULL, NULL, NULL, NULL, 9, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('dreins', NULL, NULL, NULL, NULL, 10, NULL, NULL, 3);
INSERT INTO public.planet VALUES ('vans', NULL, NULL, NULL, NULL, 11, NULL, NULL, 4);
INSERT INTO public.planet VALUES ('funfans', NULL, NULL, NULL, NULL, 12, NULL, NULL, 5);
INSERT INTO public.planet VALUES ('sixans', NULL, NULL, NULL, NULL, 13, NULL, NULL, 6);
INSERT INTO public.planet VALUES ('septans', NULL, NULL, NULL, NULL, 14, NULL, NULL, 6);
INSERT INTO public.planet VALUES ('octans', NULL, NULL, NULL, NULL, 15, NULL, NULL, 5);
INSERT INTO public.planet VALUES ('nonans', NULL, NULL, NULL, NULL, 16, NULL, NULL, 4);
INSERT INTO public.planet VALUES ('deptans', NULL, NULL, NULL, NULL, 17, NULL, NULL, 3);
INSERT INTO public.planet VALUES ('electans', NULL, NULL, NULL, NULL, 18, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('deuxans', NULL, NULL, NULL, NULL, 19, NULL, NULL, 1);


--
-- Data for Name: spacestation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacestation VALUES (1, NULL, 'gangster');
INSERT INTO public.spacestation VALUES (2, NULL, 'yala');
INSERT INTO public.spacestation VALUES (3, NULL, 'kaffee');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Jupitus', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO public.star VALUES ('Omnibus', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2);
INSERT INTO public.star VALUES ('Pluribus', NULL, NULL, NULL, NULL, NULL, NULL, 3, 3);
INSERT INTO public.star VALUES ('Stantibus', NULL, NULL, NULL, NULL, NULL, NULL, 4, 4);
INSERT INTO public.star VALUES ('Reisebus', NULL, NULL, NULL, NULL, NULL, NULL, 5, 5);
INSERT INTO public.star VALUES ('Sun', NULL, NULL, NULL, NULL, NULL, NULL, 6, 6);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: spacestation_spacestation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacestation_spacestation_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacestation spacestation_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacestation
    ADD CONSTRAINT spacestation_moon_id_key UNIQUE (moon_id);


--
-- Name: spacestation spacestation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacestation
    ADD CONSTRAINT spacestation_pkey PRIMARY KEY (spacestation_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: spacestation spacestation_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacestation
    ADD CONSTRAINT spacestation_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

