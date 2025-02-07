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
    name character varying(20),
    description text,
    age_in_millions_of_years numeric(10,2),
    discovery_century integer NOT NULL,
    radius_in_light_years integer
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
    name character varying(20),
    description text,
    age_in_millions_of_years numeric(10,2),
    discovery_century integer NOT NULL,
    radius_in_km integer,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    description text,
    has_life boolean,
    age_in_millions_of_years numeric(10,2),
    discovery_century integer NOT NULL,
    radius_in_km integer,
    is_spherical boolean,
    star_id integer,
    planet_type_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    description text,
    age_in_millions_of_years numeric(10,2),
    discovery_century integer NOT NULL,
    radius_in_km integer,
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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A galaxy in spiral shape where it is located the solar system', 13610.00, 17, 52850);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A spiral galaxy neighboring the Milky Way, known for its vast size', 10000.00, 10, 110000);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'A galaxy with a bright central bulge and an extended disk, resembling a sombrero hat', 13000.00, 19, 49000);
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 'A spiral galaxy in the Local Group, smaller than the Milky Way and Andromeda', 9000.00, 18, 60000);
INSERT INTO public.galaxy VALUES (5, 'Antennae Galaxies', 'A pair of colliding galaxies with long tidal tails, rich in star formation', 12000.00, 20, 65000);
INSERT INTO public.galaxy VALUES (7, 'Bode s Galaxy', 'A large spiral galaxy with a bright nucleus, also known as M81', 13500.00, 18, 90000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only natural satellite of Earth, responsible for tides', 4500.00, 0, 1737, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A small and irregularly shaped moon of Mars', 4500.00, 19, 11, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and more distant of Mars two moons', 4500.00, 19, 6, 2);
INSERT INTO public.moon VALUES (4, 'Proxima Moon 1', 'A moon with a rocky surface and potential frozen water', 4000.00, 22, 1800, 3);
INSERT INTO public.moon VALUES (5, 'Proxima Moon 2', 'A moon with volcanic activity and an iron-rich core', 3800.00, 22, 2000, 3);
INSERT INTO public.moon VALUES (6, 'Alpha Moon 1', 'A small moon with a cratered surface', 5000.00, 22, 1500, 4);
INSERT INTO public.moon VALUES (7, 'Ringa', 'A moon orbiting close to the planets rings', 7000.00, 22, 1200, 5);
INSERT INTO public.moon VALUES (8, 'Glacia', 'An icy moon with subsurface oceans', 7000.00, 22, 900, 5);
INSERT INTO public.moon VALUES (9, 'Zarmini Minor', 'A small moon with frozen methane deposits', 6000.00, 22, 700, 6);
INSERT INTO public.moon VALUES (10, 'Vega Orbital 1', 'A barren moon with deep craters', 7200.00, 22, 1600, 7);
INSERT INTO public.moon VALUES (11, 'Frostbite', 'A moon covered in thick layers of ice', 7500.00, 22, 2100, 8);
INSERT INTO public.moon VALUES (12, 'Red Storm', 'A moon engulfed in constant red storms', 10000.00, 22, 1700, 9);
INSERT INTO public.moon VALUES (13, 'Vortex', 'A moon with a dense atmosphere and violent winds', 9500.00, 22, 1600, 9);
INSERT INTO public.moon VALUES (14, 'Icecap', 'A moon with frozen water layers', 8000.00, 22, 1400, 10);
INSERT INTO public.moon VALUES (15, 'Canyonor', 'A moon with deep red canyons mirroring its planet', 8500.00, 22, 1200, 11);
INSERT INTO public.moon VALUES (16, 'Shimmer', 'A moon with a reflective crystalline surface', 8900.00, 22, 1300, 12);
INSERT INTO public.moon VALUES (17, 'Glowstone', 'A moon emitting faint luminescence due to minerals', 8800.00, 22, 1400, 12);
INSERT INTO public.moon VALUES (18, 'Terra Minor', 'A barren moon orbiting close to New Terra', 7200.00, 22, 1400, 13);
INSERT INTO public.moon VALUES (19, 'Aqua', 'A moon with a thin atmosphere and water presence', 7200.00, 22, 1500, 14);
INSERT INTO public.moon VALUES (20, 'Lunaria', 'A newly discovered moon with reflective ice crystals', 5000.00, 22, 1600, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The only known planet with life, rich in water and atmosphere', true, 4540.00, 0, 6371, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Known as the Red Planet, with evidence of ancient water flows', false, 4600.00, 19, 3389, true, 1, 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', 'An exoplanet orbiting within the habitable zone of Proxima Centauri', false, 5000.00, 21, 6400, true, 2, 5);
INSERT INTO public.planet VALUES (4, 'Alpha Centauri Bb', 'A rocky exoplanet orbiting very close to Alpha Centauri B', false, 6000.00, 21, 6800, true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Andromedus', 'A giant gas planet with a vibrant system of rings', false, 9000.00, 22, 69911, true, 3, 2);
INSERT INTO public.planet VALUES (6, 'Zarmina', 'A potentially habitable exoplanet in the Andromeda galaxy', false, 8500.00, 22, 6700, true, 3, 5);
INSERT INTO public.planet VALUES (7, 'Vega-1', 'A dwarf planet with a peculiar, elongated orbit', false, 7000.00, 22, 2400, true, 4, 4);
INSERT INTO public.planet VALUES (8, 'Vega-Prime', 'A massive ice giant located far from its star', false, 7800.00, 22, 25559, true, 4, 3);
INSERT INTO public.planet VALUES (9, 'Betelgeusia', 'A large gas giant with swirling storms and intense winds', false, 10000.00, 21, 71492, true, 5, 2);
INSERT INTO public.planet VALUES (10, 'Frostia', 'A frozen exoplanet covered in layers of reflective ice', false, 12000.00, 21, 26300, true, 5, 3);
INSERT INTO public.planet VALUES (11, 'Antaria', 'A rocky planet with deep red canyons and an arid climate', false, 9500.00, 22, 6500, true, 6, 1);
INSERT INTO public.planet VALUES (12, 'Crystalis', 'An exoplanet with a dazzling surface of reflective crystals', false, 8900.00, 22, 4700, true, 6, 5);
INSERT INTO public.planet VALUES (13, 'New Terra', 'A rocky planet orbiting a distant star', false, 7000.00, 22, 6700, true, 4, 1);
INSERT INTO public.planet VALUES (14, 'Oceanus', 'An exoplanet covered entirely in water', false, 7500.00, 22, 6400, true, 5, 5);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with a solid surface, typically smaller in size');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Massive planets primarily composed of hydrogen and helium gases');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets with a core of heavier elements surrounded by icy layers');
INSERT INTO public.planet_type VALUES (4, 'Dwarf', 'Small celestial bodies orbiting a star, not clearing their orbital path');
INSERT INTO public.planet_type VALUES (5, 'Exoplanet', 'Planets located outside of the Solar System');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The central star of the Solar System, essential for life on Earth', 4600.00, 0, 696340, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'The closest star system to the Solar System, a binary star', 6500.00, 16, 865000, 1);
INSERT INTO public.star VALUES (3, 'Mirach', 'A prominent red giant star located near Andromeda s core', 7000.50, 16, 1235000, 2);
INSERT INTO public.star VALUES (4, 'Vega', 'A bright star known for its bluish white color and rapid rotation', 450.00, 19, 2032000, 3);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'A massive red supergiant star nearing the end of its lifecycle', 8500.00, 20, 764000, 4);
INSERT INTO public.star VALUES (6, 'Antares', 'A bright reddish star at the center of a prominent star cluster', 10000.00, 17, 1204000, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_planet_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_planet_type FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

