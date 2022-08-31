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
-- Name: account; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.account (
    account_id integer NOT NULL,
    name character varying(40) NOT NULL,
    email character varying(40) NOT NULL
);


ALTER TABLE public.account OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    ages_in_m_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    radius numeric(1000,2),
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    constrain name
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    ages_in_m_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    radius numeric(1000,2),
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer NOT NULL,
    constrain name
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    ages_in_m_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    radius numeric(1000,2),
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    star_id integer NOT NULL,
    constrain name
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    ages_in_m_years integer NOT NULL,
    distance_from_earth integer NOT NULL,
    radius numeric(1000,2),
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_id integer NOT NULL,
    constrain name
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.account.account_id;


--
-- Name: account account_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.account ALTER COLUMN account_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.account VALUES (1, 'ashton fei', 'ashton.fei@gmail.com');
INSERT INTO public.account VALUES (2, 'bob fei', 'bob.fei@gmail.com');
INSERT INTO public.account VALUES (3, 'chris fei', 'chris.fei@gmail.com');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'G1', 10, 1000, 1000.23, 'Gaalxy 1', true, false, NULL);
INSERT INTO public.galaxy VALUES (2, 'G2', 20, 2000, 2000.23, 'Gaalxy 2', true, false, NULL);
INSERT INTO public.galaxy VALUES (3, 'G3', 30, 3000, 3000.33, 'Galaxy 3', true, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'G2', 20, 2000, 2000.23, 'Gaalxy 2', true, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'G3', 30, 3000, 3000.33, 'Galaxy 3', true, false, NULL);
INSERT INTO public.galaxy VALUES (6, 'G2', 20, 2000, 2000.23, 'Gaalxy 2', true, false, NULL);
INSERT INTO public.galaxy VALUES (7, 'G3', 30, 3000, 3000.33, 'Galaxy 3', true, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon 1', 1000, 1000, 1000.11, 'moon 1', true, true, 1, NULL);
INSERT INTO public.moon VALUES (2, 'moon 2', 2000, 2000, 2000.22, 'moon 2', false, true, 2, NULL);
INSERT INTO public.moon VALUES (3, 'moon 3', 3000, 3000, 3000.33, 'moon 3', true, true, 3, NULL);
INSERT INTO public.moon VALUES (4, 'moon 1', 1000, 1000, 1000.11, 'moon 1', true, true, 1, NULL);
INSERT INTO public.moon VALUES (5, 'moon 2', 2000, 2000, 2000.22, 'moon 2', false, true, 2, NULL);
INSERT INTO public.moon VALUES (6, 'moon 3', 3000, 3000, 3000.33, 'moon 3', true, true, 3, NULL);
INSERT INTO public.moon VALUES (10, 'moon 1', 1000, 1000, 1000.11, 'moon 1', true, true, 1, NULL);
INSERT INTO public.moon VALUES (11, 'moon 2', 2000, 2000, 2000.22, 'moon 2', false, true, 2, NULL);
INSERT INTO public.moon VALUES (12, 'moon 3', 3000, 3000, 3000.33, 'moon 3', true, true, 5, NULL);
INSERT INTO public.moon VALUES (13, 'moon 1', 1000, 1000, 1000.11, 'moon 1', true, true, 1, NULL);
INSERT INTO public.moon VALUES (14, 'moon 2', 2000, 2000, 2000.22, 'moon 2', false, true, 2, NULL);
INSERT INTO public.moon VALUES (15, 'moon 3', 3000, 3000, 3000.33, 'moon 3', true, true, 6, NULL);
INSERT INTO public.moon VALUES (16, 'moon 1', 1000, 1000, 1000.11, 'moon 1', true, true, 1, NULL);
INSERT INTO public.moon VALUES (17, 'moon 2', 2000, 2000, 2000.22, 'moon 2', false, true, 2, NULL);
INSERT INTO public.moon VALUES (18, 'moon 3', 3000, 3000, 3000.33, 'moon 3', true, true, 7, NULL);
INSERT INTO public.moon VALUES (19, 'moon 1', 1000, 1000, 1000.11, 'moon 1', true, true, 1, NULL);
INSERT INTO public.moon VALUES (20, 'moon 2', 2000, 2000, 2000.22, 'moon 2', false, true, 2, NULL);
INSERT INTO public.moon VALUES (21, 'moon 3', 3000, 3000, 3000.33, 'moon 3', true, true, 8, NULL);
INSERT INTO public.moon VALUES (22, 'moon 1', 1000, 1000, 1000.11, 'moon 1', true, true, 1, NULL);
INSERT INTO public.moon VALUES (23, 'moon 2', 2000, 2000, 2000.22, 'moon 2', false, true, 2, NULL);
INSERT INTO public.moon VALUES (24, 'moon 3', 3000, 3000, 3000.33, 'moon 3', true, true, 9, NULL);
INSERT INTO public.moon VALUES (25, 'moon 1', 1000, 1000, 1000.11, 'moon 1', true, true, 1, NULL);
INSERT INTO public.moon VALUES (26, 'moon 2', 2000, 2000, 2000.22, 'moon 2', false, true, 2, NULL);
INSERT INTO public.moon VALUES (27, 'moon 3', 3000, 3000, 3000.33, 'moon 3', true, true, 10, NULL);
INSERT INTO public.moon VALUES (28, 'moon 1', 1000, 1000, 1000.11, 'moon 1', true, true, 1, NULL);
INSERT INTO public.moon VALUES (29, 'moon 2', 2000, 2000, 2000.22, 'moon 2', false, true, 2, NULL);
INSERT INTO public.moon VALUES (30, 'moon 3', 3000, 3000, 3000.33, 'moon 3', true, true, 11, NULL);
INSERT INTO public.moon VALUES (31, 'moon 1', 1000, 1000, 1000.11, 'moon 1', true, true, 1, NULL);
INSERT INTO public.moon VALUES (32, 'moon 2', 2000, 2000, 2000.22, 'moon 2', false, true, 2, NULL);
INSERT INTO public.moon VALUES (33, 'moon 3', 3000, 3000, 3000.33, 'moon 3', true, true, 12, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 1', 1000, 1000, 1000.11, 'planet 1', true, false, 1, NULL);
INSERT INTO public.planet VALUES (2, 'planet 1', 1000, 1000, 1000.11, 'planet 1', true, false, 1, NULL);
INSERT INTO public.planet VALUES (3, 'planet 2', 2000, 2000, 2000.22, 'planet 2', true, true, 2, NULL);
INSERT INTO public.planet VALUES (4, 'planet 3', 30000, 3000, 3000.33, 'planet 3', false, true, 3, NULL);
INSERT INTO public.planet VALUES (5, 'planet 1', 1000, 1000, 1000.11, 'planet 1', true, false, 1, NULL);
INSERT INTO public.planet VALUES (6, 'planet 2', 2000, 2000, 2000.22, 'planet 2', true, true, 2, NULL);
INSERT INTO public.planet VALUES (7, 'planet 3', 30000, 3000, 3000.33, 'planet 3', false, true, 3, NULL);
INSERT INTO public.planet VALUES (8, 'planet 1', 1000, 1000, 1000.11, 'planet 1', true, false, 1, NULL);
INSERT INTO public.planet VALUES (9, 'planet 2', 2000, 2000, 2000.22, 'planet 2', true, true, 2, NULL);
INSERT INTO public.planet VALUES (10, 'planet 3', 30000, 3000, 3000.33, 'planet 3', false, true, 3, NULL);
INSERT INTO public.planet VALUES (11, 'planet 1', 1000, 1000, 1000.11, 'planet 1', true, false, 1, NULL);
INSERT INTO public.planet VALUES (12, 'planet 2', 2000, 2000, 2000.22, 'planet 2', true, true, 2, NULL);
INSERT INTO public.planet VALUES (13, 'planet 3', 30000, 3000, 3000.33, 'planet 3', false, true, 4, NULL);
INSERT INTO public.planet VALUES (14, 'planet 1', 1000, 1000, 1000.11, 'planet 1', true, false, 1, NULL);
INSERT INTO public.planet VALUES (15, 'planet 2', 2000, 2000, 2000.22, 'planet 2', true, true, 2, NULL);
INSERT INTO public.planet VALUES (16, 'planet 3', 30000, 3000, 3000.33, 'planet 3', false, true, 5, NULL);
INSERT INTO public.planet VALUES (17, 'planet 1', 1000, 1000, 1000.11, 'planet 1', true, false, 1, NULL);
INSERT INTO public.planet VALUES (18, 'planet 2', 2000, 2000, 2000.22, 'planet 2', true, true, 2, NULL);
INSERT INTO public.planet VALUES (19, 'planet 3', 30000, 3000, 3000.33, 'planet 3', false, true, 6, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'start 1', 1000, 1000, 1000.11, 'star 1', true, false, 1, NULL);
INSERT INTO public.star VALUES (2, 'start 1', 1000, 1000, 1000.11, 'star 1', true, false, 1, NULL);
INSERT INTO public.star VALUES (3, 'start 2', 2000, 2000, 2000.22, 'start 2', true, false, 2, NULL);
INSERT INTO public.star VALUES (4, 'start 3', 3000, 3000, 3000.33, 'start 3', false, true, 3, NULL);
INSERT INTO public.star VALUES (5, 'start 1', 1000, 1000, 1000.11, 'star 1', true, false, 1, NULL);
INSERT INTO public.star VALUES (6, 'start 2', 2000, 2000, 2000.22, 'start 2', true, false, 5, NULL);
INSERT INTO public.star VALUES (7, 'start 3', 3000, 3000, 3000.33, 'start 3', false, true, 4, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 33, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 19, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- Name: galaxy galaxy_constrain_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constrain_key UNIQUE (constrain);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_constrain_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_constrain_key UNIQUE (constrain);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_constrain_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_constrain_key UNIQUE (constrain);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_constrain_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constrain_key UNIQUE (constrain);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: account users_email_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: account users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: account users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT users_pkey PRIMARY KEY (account_id);


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

