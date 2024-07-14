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
    name character varying(30) NOT NULL,
    type character varying(30),
    number_of_stars text,
    mass_in_solar_masses text,
    age_in_billions_of_years numeric(4,1),
    year_discovered integer
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
-- Name: info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.info (
    info_id integer NOT NULL,
    description text NOT NULL,
    name character varying(30)
);


ALTER TABLE public.info OWNER TO freecodecamp;

--
-- Name: galaxy_more_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_more_info_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_more_info_info_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_more_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_more_info_info_id_seq OWNED BY public.info.info_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    diameter_in_km integer,
    distance_from_planet_in_km integer,
    description text
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
    year_discovered integer,
    age_in_billions_of_years numeric(5,2),
    diameter_in_km integer,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    age_in_billions_of_years numeric(5,2),
    diameter_in_km integer,
    mass_in_solar_masses numeric(4,1),
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
-- Name: info info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info ALTER COLUMN info_id SET DEFAULT nextval('public.galaxy_more_info_info_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral galaxy', '100 - 400 billion', '~1.5 trillion', 13.6, NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Barred spiral galaxy', '~10 billion', '~10 billion', 13.8, NULL);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Dwarf irregular galaxy', 'A few hundred million', '~7 billion', 13.6, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy (M31)', 'Spiral galaxy', '~1 trillion', '~1.76 trillion', 10.0, 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy (M33)', 'Spiral galaxy', '~40 billion', '~50 billion', 10.0, 1654);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy (M51)', 'Spiral galaxy', '~100 billion', '~160 billion', 10.0, 1773);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy (M104)', 'Spiral galaxy', '~800 billion', '~800 billion', 13.0, 1781);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel Galaxy (M101)', 'Spiral Galaxy', '~1 trillion', '~100 billion', 13.3, 1781);


--
-- Data for Name: info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.info VALUES (1, 'Our home galaxy, containing the Solar System', 'Milky Way');
INSERT INTO public.info VALUES (2, 'The closest spiral galaxy to the Milky Way and on a collision course with it', 'Andromeda Galaxy (M31)');
INSERT INTO public.info VALUES (3, 'The third largest member of the Local Group of galaxies', 'Triangulum Galaxy (M33)');
INSERT INTO public.info VALUES (4, 'A satellite galaxy of the Milky Way, visible from the Southern Hemisphere', 'Large Magellanic Cloud');
INSERT INTO public.info VALUES (5, 'A smaller satellite galaxy of the Milky Way, visible from the Southern Hemisphere', 'Small Magellanic Cloud');
INSERT INTO public.info VALUES (6, 'Known for its distinctive spiral arms and interaction with a smaller galaxy', 'Whirlpool Galaxy (M51)');
INSERT INTO public.info VALUES (7, 'Noted for its bright nucleus and large central bulge, resembling a sombrero hat', 'Sombrero Galaxy (M104)');
INSERT INTO public.info VALUES (8, 'A large face-on spiral galaxy with well-defined arms, located in the constellation Ursa Major', 'Pinwheel Galaxy (M101)');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 384400, 'Only natural satellite of Eath, affects tides');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 9376, 'Irregular shape, heavily cratered');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 23463, 'Smaller and smoother than Phobos');
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 5268, 1070400, 'Larges moon in the Solar System, magnetic field');
INSERT INTO public.moon VALUES (5, 'Io', 5, 3643, 421700, 'Most volcanically active body in the Solar System');
INSERT INTO public.moon VALUES (6, 'Europa', 5, 3121, 6709000, 'Icy surface, possible subsurface ocean');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1882700, 'Heavily cratered, oldest surface in the Solar System');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, 1222000, 'Thick atmosphere, liquid hydrocarbon lakes');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504, 238000, 'Geysers of water ice, possible subsurface ocean');
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 1527, 527000, 'Icy surface, heavily cratered');
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 1470, 3560000, 'Two-tome coloration, equatorial ridge');
INSERT INTO public.moon VALUES (12, 'Titania', 7, 1576, 435840, 'Largest moon of Uranus, icy surface with canyons');
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 1523, 583520, 'Second largest moon of Uranus, heavily cratered');
INSERT INTO public.moon VALUES (14, 'Triton', 8, 2706, 354800, 'Retrograde orbit, geysers of nitrogen gas');
INSERT INTO public.moon VALUES (15, 'Charon', 9, 1212, 19640, 'Largest moon of Pluto, shares a barycenter with Pluto');
INSERT INTO public.moon VALUES (16, 'Hi''iaka', 12, 320, 49880, 'Larger of Haumea''s moon');
INSERT INTO public.moon VALUES (17, 'Namaka', 12, 160, 25570, 'Smaller of Haumea''s moon');
INSERT INTO public.moon VALUES (18, 'MK 2', 11, 175, 21000, 'Only known moon of Makemake');
INSERT INTO public.moon VALUES (19, 'Dysnomia', 13, 700, 37350, 'Only known moon of Eris');
INSERT INTO public.moon VALUES (20, '243 Ida', 22, 1, 90, 'First discovered moon of an asteroid');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (12, 'Haumea', 2005, 4.50, 1632, false, false, 1, 1);
INSERT INTO public.planet VALUES (1, 'Earth', NULL, 4.54, 12742, true, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mecury', NULL, 4.50, 4880, false, true, 1, 1);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, 4.50, 12104, false, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, 4.60, 6779, false, true, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, 4.50, 139820, false, true, 1, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 4.50, 116460, false, true, 1, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 1781, 4.50, 50724, false, true, 1, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 1846, 4.50, 49244, false, true, 1, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 1930, 4.50, 2377, false, true, 1, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 1801, 4.57, 940, false, true, 1, 1);
INSERT INTO public.planet VALUES (11, 'Makemake', 2005, 4.50, 1434, false, true, 1, 1);
INSERT INTO public.planet VALUES (13, 'Eris', 2005, 4.50, 2326, false, true, 1, 1);
INSERT INTO public.planet VALUES (14, 'Kepler-22b', 2009, 4.00, 31750, NULL, true, 1, 12);
INSERT INTO public.planet VALUES (15, 'Proxima Centauri b', 2016, 4.85, 14060, NULL, true, 1, 6);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1d', 2017, 7.60, 11490, NULL, true, 1, 13);
INSERT INTO public.planet VALUES (17, 'LHS 1140 b', 2017, 5.00, 18000, NULL, true, 1, 14);
INSERT INTO public.planet VALUES (18, 'TOI 700 d', 2020, 4.50, 14000, NULL, true, 1, 15);
INSERT INTO public.planet VALUES (19, 'GJ 1214 b', 2009, 6.00, 52800, NULL, true, 1, 16);
INSERT INTO public.planet VALUES (20, '55 Cancri e', 2004, 8.50, 25000, NULL, true, 1, 17);
INSERT INTO public.planet VALUES (21, 'M51-ULS-1b', 2020, NULL, NULL, NULL, true, 7, 18);
INSERT INTO public.planet VALUES (22, 'Dactyl', 1993, 4.50, 1, false, false, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sirius', 'Binary star system', 0.30, 2375000, 2.0, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Triple star system', 4.85, 1519000, 1.1, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant', 8.00, 1400000000, 11.0, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue supergiant', 8.00, 97000000, 21.0, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Red dwarf (M-type)', 4.85, 200000, 0.1, 1);
INSERT INTO public.star VALUES (7, 'Vega', 'White main-sequence star', 0.46, 2362000, 2.1, 1);
INSERT INTO public.star VALUES (8, 'Antares', 'Red supergiant', 12.00, 1200000000, 12.0, 1);
INSERT INTO public.star VALUES (9, 'Aldebaran', 'Red giant', 6.40, 61000000, 1.2, 1);
INSERT INTO public.star VALUES (10, 'Canopus', 'Bright giant', 8.00, 71000000, 8.5, 1);
INSERT INTO public.star VALUES (11, 'Polaris Australis', 'F-type supergiant', 6.00, 7000000, 3.0, 1);
INSERT INTO public.star VALUES (1, 'Sun', 'Yellow dwarf (G-type)', 4.57, 1392700, 1.0, 1);
INSERT INTO public.star VALUES (12, 'Kepler-22', 'Yellow dwarf (G-type)', 4.00, 1170000, 1.0, 1);
INSERT INTO public.star VALUES (13, 'TRAPPIST-1', 'Ultra-cool dwarf (M-type)', 7.60, 82000, 0.1, 1);
INSERT INTO public.star VALUES (14, 'LHS 1140', 'Red dwarf (M-type)', 5.00, 285000, 0.2, 1);
INSERT INTO public.star VALUES (15, 'TOI 700', 'Red dwarf (M-type)', 4.50, 260000, 0.4, 1);
INSERT INTO public.star VALUES (16, 'GJ 1214', 'Red dwarf (M-type)', 6.00, 195000, 0.2, 1);
INSERT INTO public.star VALUES (17, '55 Cancri', 'Yellow dwarf (G-type)', 8.50, 1100000, 0.9, 1);
INSERT INTO public.star VALUES (18, 'M51-ULS-1', 'Black Hole', 10.00, NULL, NULL, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_more_info_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_more_info_info_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 25, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 19, true);


--
-- Name: info galaxy_more_info_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT galaxy_more_info_description_key UNIQUE (description);


--
-- Name: info galaxy_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT galaxy_more_info_pkey PRIMARY KEY (info_id);


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
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


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
-- Name: info galaxy_more_info_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT galaxy_more_info_name_fkey FOREIGN KEY (name) REFERENCES public.galaxy(name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

