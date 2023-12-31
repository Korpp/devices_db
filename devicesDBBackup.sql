toc.dat                                                                                             0000600 0004000 0002000 00000026545 14463420305 0014454 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           {        	   devicesDB    15.3    15.3 %    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         %           1262    16882 	   devicesDB    DATABASE     �   CREATE DATABASE "devicesDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';
    DROP DATABASE "devicesDB";
                postgres    false         �            1259    16900    devices    TABLE     %  CREATE TABLE public.devices (
    device_id integer NOT NULL,
    laptop_id integer NOT NULL,
    device_name character varying(100) NOT NULL,
    device_status character varying(100) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    last_login timestamp without time zone
);
    DROP TABLE public.devices;
       public         heap    postgres    false         �            1259    16891    laptops    TABLE     �  CREATE TABLE public.laptops (
    laptop_id integer NOT NULL,
    manufacturer character varying(50) NOT NULL,
    model character varying(150) NOT NULL,
    processor character varying(50),
    graphics_card character varying(150),
    memory character varying(50),
    screen_size character varying(50),
    resolution character varying(250),
    storage character varying(50),
    operating_system character varying(50)
);
    DROP TABLE public.laptops;
       public         heap    postgres    false         �            1259    16890    devices_device_id_seq    SEQUENCE     �   CREATE SEQUENCE public.devices_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.devices_device_id_seq;
       public          postgres    false    215         &           0    0    devices_device_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.devices_device_id_seq OWNED BY public.laptops.laptop_id;
          public          postgres    false    214         �            1259    16899    devices_device_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.devices_device_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.devices_device_id_seq1;
       public          postgres    false    217         '           0    0    devices_device_id_seq1    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.devices_device_id_seq1 OWNED BY public.devices.device_id;
          public          postgres    false    216         �            1259    16945    leasing    TABLE       CREATE TABLE public.leasing (
    leasing_id integer NOT NULL,
    device_id integer NOT NULL,
    subscriber_id integer NOT NULL,
    monthly_cost money NOT NULL,
    leasing_start timestamp without time zone,
    leasing_end timestamp without time zone
);
    DROP TABLE public.leasing;
       public         heap    postgres    false         �            1259    16944    leasing_leasing_id_seq    SEQUENCE     �   CREATE SEQUENCE public.leasing_leasing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.leasing_leasing_id_seq;
       public          postgres    false    221         (           0    0    leasing_leasing_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.leasing_leasing_id_seq OWNED BY public.leasing.leasing_id;
          public          postgres    false    220         �            1259    16914    subscribers    TABLE     �   CREATE TABLE public.subscribers (
    subscriber_id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    mailing_address character varying(50) NOT NULL,
    postal_code integer NOT NULL,
    city character varying(50) NOT NULL
);
    DROP TABLE public.subscribers;
       public         heap    postgres    false         �            1259    16965    subs_devices    VIEW     -  CREATE VIEW public.subs_devices AS
 SELECT leasing.leasing_id,
    devices.device_name,
    subscribers.company_name
   FROM ((public.leasing
     JOIN public.devices ON ((devices.device_id = leasing.device_id)))
     JOIN public.subscribers ON ((subscribers.subscriber_id = leasing.subscriber_id)));
    DROP VIEW public.subs_devices;
       public          postgres    false    221    217    217    219    221    219    221         �            1259    16913    subscribers_subscriber_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subscribers_subscriber_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.subscribers_subscriber_id_seq;
       public          postgres    false    219         )           0    0    subscribers_subscriber_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.subscribers_subscriber_id_seq OWNED BY public.subscribers.subscriber_id;
          public          postgres    false    218         y           2604    16903    devices device_id    DEFAULT     w   ALTER TABLE ONLY public.devices ALTER COLUMN device_id SET DEFAULT nextval('public.devices_device_id_seq1'::regclass);
 @   ALTER TABLE public.devices ALTER COLUMN device_id DROP DEFAULT;
       public          postgres    false    216    217    217         x           2604    16894    laptops laptop_id    DEFAULT     v   ALTER TABLE ONLY public.laptops ALTER COLUMN laptop_id SET DEFAULT nextval('public.devices_device_id_seq'::regclass);
 @   ALTER TABLE public.laptops ALTER COLUMN laptop_id DROP DEFAULT;
       public          postgres    false    215    214    215         {           2604    16948    leasing leasing_id    DEFAULT     x   ALTER TABLE ONLY public.leasing ALTER COLUMN leasing_id SET DEFAULT nextval('public.leasing_leasing_id_seq'::regclass);
 A   ALTER TABLE public.leasing ALTER COLUMN leasing_id DROP DEFAULT;
       public          postgres    false    220    221    221         z           2604    16917    subscribers subscriber_id    DEFAULT     �   ALTER TABLE ONLY public.subscribers ALTER COLUMN subscriber_id SET DEFAULT nextval('public.subscribers_subscriber_id_seq'::regclass);
 H   ALTER TABLE public.subscribers ALTER COLUMN subscriber_id DROP DEFAULT;
       public          postgres    false    218    219    219                   0    16900    devices 
   TABLE DATA           k   COPY public.devices (device_id, laptop_id, device_name, device_status, created_on, last_login) FROM stdin;
    public          postgres    false    217       3355.dat           0    16891    laptops 
   TABLE DATA           �   COPY public.laptops (laptop_id, manufacturer, model, processor, graphics_card, memory, screen_size, resolution, storage, operating_system) FROM stdin;
    public          postgres    false    215       3353.dat           0    16945    leasing 
   TABLE DATA           q   COPY public.leasing (leasing_id, device_id, subscriber_id, monthly_cost, leasing_start, leasing_end) FROM stdin;
    public          postgres    false    221       3359.dat           0    16914    subscribers 
   TABLE DATA           f   COPY public.subscribers (subscriber_id, company_name, mailing_address, postal_code, city) FROM stdin;
    public          postgres    false    219       3357.dat *           0    0    devices_device_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.devices_device_id_seq', 1, false);
          public          postgres    false    214         +           0    0    devices_device_id_seq1    SEQUENCE SET     D   SELECT pg_catalog.setval('public.devices_device_id_seq1', 9, true);
          public          postgres    false    216         ,           0    0    leasing_leasing_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.leasing_leasing_id_seq', 1, false);
          public          postgres    false    220         -           0    0    subscribers_subscriber_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.subscribers_subscriber_id_seq', 3, true);
          public          postgres    false    218                    2606    16907    devices devices_device_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_device_name_key UNIQUE (device_name);
 I   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_device_name_key;
       public            postgres    false    217         }           2606    16898    laptops devices_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.laptops
    ADD CONSTRAINT devices_pkey PRIMARY KEY (laptop_id);
 >   ALTER TABLE ONLY public.laptops DROP CONSTRAINT devices_pkey;
       public            postgres    false    215         �           2606    16905    devices devices_pkey1 
   CONSTRAINT     Z   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey1 PRIMARY KEY (device_id);
 ?   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_pkey1;
       public            postgres    false    217         �           2606    16950    leasing leasing_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.leasing
    ADD CONSTRAINT leasing_pkey PRIMARY KEY (leasing_id);
 >   ALTER TABLE ONLY public.leasing DROP CONSTRAINT leasing_pkey;
       public            postgres    false    221         �           2606    16919    subscribers subscribers_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (subscriber_id);
 F   ALTER TABLE ONLY public.subscribers DROP CONSTRAINT subscribers_pkey;
       public            postgres    false    219         �           2606    16908    devices devices_laptop_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_laptop_id_fkey FOREIGN KEY (laptop_id) REFERENCES public.laptops(laptop_id);
 H   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_laptop_id_fkey;
       public          postgres    false    217    3197    215         �           2606    16951    leasing leasing_device_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.leasing
    ADD CONSTRAINT leasing_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(device_id);
 H   ALTER TABLE ONLY public.leasing DROP CONSTRAINT leasing_device_id_fkey;
       public          postgres    false    217    3201    221         �           2606    16956 "   leasing leasing_subscriber_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.leasing
    ADD CONSTRAINT leasing_subscriber_id_fkey FOREIGN KEY (subscriber_id) REFERENCES public.subscribers(subscriber_id);
 L   ALTER TABLE ONLY public.leasing DROP CONSTRAINT leasing_subscriber_id_fkey;
       public          postgres    false    219    221    3203                                                                                                                                                                   3355.dat                                                                                            0000600 0004000 0002000 00000001033 14463420305 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	3	GM02382AR	1 = new	2023-07-31 17:08:04.125184	\N
2	3	GM02382AI	2 = in production	2023-07-31 17:08:43.237299	\N
3	3	GM02382AS	3 = under maintenance	2023-07-31 17:08:55.391333	\N
4	1	PF74SDJ34	2 = in production	2023-07-31 17:10:03.724903	\N
5	1	PF74SDE95	2 = in production	2023-07-31 17:10:03.724903	\N
6	2	PC2K2DJOD	2 = in production	2023-07-31 17:10:03.724903	\N
7	4	PC2CY0DKD	1 = new	2023-07-31 17:11:03.25483	\N
8	4	PC2CY0DKE	1 = new	2023-07-31 17:11:03.25483	\N
9	5	LTDJJ234DS	3 = under maintenance	2023-07-31 17:11:03.25483	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     3353.dat                                                                                            0000600 0004000 0002000 00000001415 14463420305 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	HP	ELITEBOOK X360 1040 G6	Intel Core i7-8565U @ 1.80GHz	Intel UHD Graphics 620	16 GB DDR4	14	1920 x 1080 (Full HD), IPS, 360 Touchscreen	256 GB SSD	Windows 10 Pro 64-bit
2	HP	ELITEBOOK 830 G5	Intel Core i5-8250U @ 1.60GHz,	Intel UHD Graphics 620	8 GB DDR4	13	1920 x 1080 (Full HD), IPS	256 GB SSD	Windows 10 Pro 64-bit
3	Lenovo	THINKPAD T495	AMD Ryzen 3 Pro 3300U	AMD Radeon (TM) Vega 6	8 GB DDR4	14	1920 x 1080 (Full HD), IPS	256 GB SSD	Windows 10 Pro 64-bit
4	Fujitsu	Lifebook U748	Intel Core i5-7200U @ 2.50GHz	Intel HD Graphics 620	8 GB DDR4	14	1920 x 1080 (Full HD), IPS	512 GB SSD	Windows 10 Pro 64-bit
5	Lenovo	X13 Yoga Gen 1	Intel Core i7-10610U @ 1.80GHz	Intel UHD Graphics	16 GB DDR4	13	1920 x 1080 (Full HD), IPS, 360 Touchscreen	512 GB SSD	Windows 10 Pro 64-bit
\.


                                                                                                                                                                                                                                                   3359.dat                                                                                            0000600 0004000 0002000 00000000775 14463420305 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	1	22,00 €	2022-01-01 00:00:00	2025-01-01 00:00:00
2	2	2	22,00 €	2020-04-01 00:00:00	2023-04-01 00:00:00
3	3	2	22,00 €	2010-07-01 00:00:00	2030-01-01 00:00:00
4	4	1	25,50 €	2023-05-01 00:00:00	2027-05-01 00:00:00
5	5	2	25,50 €	2022-04-01 00:00:00	2022-04-01 00:00:00
6	6	3	24,40 €	2022-05-01 00:00:00	2025-05-01 00:00:00
7	7	2	20,40 €	2022-04-01 00:00:00	2025-05-01 00:00:00
8	8	2	20,40 €	2022-04-01 00:00:00	2025-05-01 00:00:00
9	9	3	20,40 €	2022-04-01 00:00:00	2030-01-01 00:00:00
\.


   3357.dat                                                                                            0000600 0004000 0002000 00000000214 14463420305 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	SecureIT OY	E 23TH street 4	11111	City 1
2	MyIT OY	first IT street 2	12345	First City
3	CyberSec OY	Secret street 22	23332	Last City
\.


                                                                                                                                                                                                                                                                                                                                                                                    restore.sql                                                                                         0000600 0004000 0002000 00000023341 14463420305 0015370 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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

DROP DATABASE "devicesDB";
--
-- Name: devicesDB; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "devicesDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';


ALTER DATABASE "devicesDB" OWNER TO postgres;

\connect "devicesDB"

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
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices (
    device_id integer NOT NULL,
    laptop_id integer NOT NULL,
    device_name character varying(100) NOT NULL,
    device_status character varying(100) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    last_login timestamp without time zone
);


ALTER TABLE public.devices OWNER TO postgres;

--
-- Name: laptops; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laptops (
    laptop_id integer NOT NULL,
    manufacturer character varying(50) NOT NULL,
    model character varying(150) NOT NULL,
    processor character varying(50),
    graphics_card character varying(150),
    memory character varying(50),
    screen_size character varying(50),
    resolution character varying(250),
    storage character varying(50),
    operating_system character varying(50)
);


ALTER TABLE public.laptops OWNER TO postgres;

--
-- Name: devices_device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devices_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_device_id_seq OWNER TO postgres;

--
-- Name: devices_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devices_device_id_seq OWNED BY public.laptops.laptop_id;


--
-- Name: devices_device_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devices_device_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_device_id_seq1 OWNER TO postgres;

--
-- Name: devices_device_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devices_device_id_seq1 OWNED BY public.devices.device_id;


--
-- Name: leasing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leasing (
    leasing_id integer NOT NULL,
    device_id integer NOT NULL,
    subscriber_id integer NOT NULL,
    monthly_cost money NOT NULL,
    leasing_start timestamp without time zone,
    leasing_end timestamp without time zone
);


ALTER TABLE public.leasing OWNER TO postgres;

--
-- Name: leasing_leasing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.leasing_leasing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leasing_leasing_id_seq OWNER TO postgres;

--
-- Name: leasing_leasing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.leasing_leasing_id_seq OWNED BY public.leasing.leasing_id;


--
-- Name: subscribers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscribers (
    subscriber_id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    mailing_address character varying(50) NOT NULL,
    postal_code integer NOT NULL,
    city character varying(50) NOT NULL
);


ALTER TABLE public.subscribers OWNER TO postgres;

--
-- Name: subs_devices; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.subs_devices AS
 SELECT leasing.leasing_id,
    devices.device_name,
    subscribers.company_name
   FROM ((public.leasing
     JOIN public.devices ON ((devices.device_id = leasing.device_id)))
     JOIN public.subscribers ON ((subscribers.subscriber_id = leasing.subscriber_id)));


ALTER TABLE public.subs_devices OWNER TO postgres;

--
-- Name: subscribers_subscriber_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscribers_subscriber_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscribers_subscriber_id_seq OWNER TO postgres;

--
-- Name: subscribers_subscriber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscribers_subscriber_id_seq OWNED BY public.subscribers.subscriber_id;


--
-- Name: devices device_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices ALTER COLUMN device_id SET DEFAULT nextval('public.devices_device_id_seq1'::regclass);


--
-- Name: laptops laptop_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laptops ALTER COLUMN laptop_id SET DEFAULT nextval('public.devices_device_id_seq'::regclass);


--
-- Name: leasing leasing_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leasing ALTER COLUMN leasing_id SET DEFAULT nextval('public.leasing_leasing_id_seq'::regclass);


--
-- Name: subscribers subscriber_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers ALTER COLUMN subscriber_id SET DEFAULT nextval('public.subscribers_subscriber_id_seq'::regclass);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devices (device_id, laptop_id, device_name, device_status, created_on, last_login) FROM stdin;
\.
COPY public.devices (device_id, laptop_id, device_name, device_status, created_on, last_login) FROM '$$PATH$$/3355.dat';

--
-- Data for Name: laptops; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laptops (laptop_id, manufacturer, model, processor, graphics_card, memory, screen_size, resolution, storage, operating_system) FROM stdin;
\.
COPY public.laptops (laptop_id, manufacturer, model, processor, graphics_card, memory, screen_size, resolution, storage, operating_system) FROM '$$PATH$$/3353.dat';

--
-- Data for Name: leasing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leasing (leasing_id, device_id, subscriber_id, monthly_cost, leasing_start, leasing_end) FROM stdin;
\.
COPY public.leasing (leasing_id, device_id, subscriber_id, monthly_cost, leasing_start, leasing_end) FROM '$$PATH$$/3359.dat';

--
-- Data for Name: subscribers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscribers (subscriber_id, company_name, mailing_address, postal_code, city) FROM stdin;
\.
COPY public.subscribers (subscriber_id, company_name, mailing_address, postal_code, city) FROM '$$PATH$$/3357.dat';

--
-- Name: devices_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devices_device_id_seq', 1, false);


--
-- Name: devices_device_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devices_device_id_seq1', 9, true);


--
-- Name: leasing_leasing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leasing_leasing_id_seq', 1, false);


--
-- Name: subscribers_subscriber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscribers_subscriber_id_seq', 3, true);


--
-- Name: devices devices_device_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_device_name_key UNIQUE (device_name);


--
-- Name: laptops devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laptops
    ADD CONSTRAINT devices_pkey PRIMARY KEY (laptop_id);


--
-- Name: devices devices_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey1 PRIMARY KEY (device_id);


--
-- Name: leasing leasing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leasing
    ADD CONSTRAINT leasing_pkey PRIMARY KEY (leasing_id);


--
-- Name: subscribers subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (subscriber_id);


--
-- Name: devices devices_laptop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_laptop_id_fkey FOREIGN KEY (laptop_id) REFERENCES public.laptops(laptop_id);


--
-- Name: leasing leasing_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leasing
    ADD CONSTRAINT leasing_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(device_id);


--
-- Name: leasing leasing_subscriber_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leasing
    ADD CONSTRAINT leasing_subscriber_id_fkey FOREIGN KEY (subscriber_id) REFERENCES public.subscribers(subscriber_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               