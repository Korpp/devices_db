PGDMP     :    ;                {        	   devicesDB    15.3    15.3 $               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    16882 	   devicesDB    DATABASE     �   CREATE DATABASE "devicesDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Finnish_Finland.1252';
    DROP DATABASE "devicesDB";
                postgres    false            �            1259    16900    devices    TABLE     %  CREATE TABLE public.devices (
    device_id integer NOT NULL,
    laptop_id integer NOT NULL,
    device_name character varying(100) NOT NULL,
    device_status character varying(100) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    last_login timestamp without time zone
);
    DROP TABLE public.devices;
       public         heap    postgres    false            �            1259    16891    laptops    TABLE     �  CREATE TABLE public.laptops (
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
       public         heap    postgres    false            �            1259    16890    devices_device_id_seq    SEQUENCE     �   CREATE SEQUENCE public.devices_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.devices_device_id_seq;
       public          postgres    false    215            !           0    0    devices_device_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.devices_device_id_seq OWNED BY public.laptops.laptop_id;
          public          postgres    false    214            �            1259    16899    devices_device_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.devices_device_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.devices_device_id_seq1;
       public          postgres    false    217            "           0    0    devices_device_id_seq1    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.devices_device_id_seq1 OWNED BY public.devices.device_id;
          public          postgres    false    216            �            1259    16945    leasing    TABLE       CREATE TABLE public.leasing (
    leasing_id integer NOT NULL,
    device_id integer NOT NULL,
    subscriber_id integer NOT NULL,
    monthly_cost money NOT NULL,
    leasing_start timestamp without time zone,
    leasing_end timestamp without time zone
);
    DROP TABLE public.leasing;
       public         heap    postgres    false            �            1259    16944    leasing_leasing_id_seq    SEQUENCE     �   CREATE SEQUENCE public.leasing_leasing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.leasing_leasing_id_seq;
       public          postgres    false    221            #           0    0    leasing_leasing_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.leasing_leasing_id_seq OWNED BY public.leasing.leasing_id;
          public          postgres    false    220            �            1259    16914    subscribers    TABLE     �   CREATE TABLE public.subscribers (
    subscriber_id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    mailing_address character varying(50) NOT NULL,
    postal_code integer NOT NULL,
    city character varying(50) NOT NULL
);
    DROP TABLE public.subscribers;
       public         heap    postgres    false            �            1259    16913    subscribers_subscriber_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subscribers_subscriber_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.subscribers_subscriber_id_seq;
       public          postgres    false    219            $           0    0    subscribers_subscriber_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.subscribers_subscriber_id_seq OWNED BY public.subscribers.subscriber_id;
          public          postgres    false    218            u           2604    16903    devices device_id    DEFAULT     w   ALTER TABLE ONLY public.devices ALTER COLUMN device_id SET DEFAULT nextval('public.devices_device_id_seq1'::regclass);
 @   ALTER TABLE public.devices ALTER COLUMN device_id DROP DEFAULT;
       public          postgres    false    216    217    217            t           2604    16894    laptops laptop_id    DEFAULT     v   ALTER TABLE ONLY public.laptops ALTER COLUMN laptop_id SET DEFAULT nextval('public.devices_device_id_seq'::regclass);
 @   ALTER TABLE public.laptops ALTER COLUMN laptop_id DROP DEFAULT;
       public          postgres    false    214    215    215            w           2604    16948    leasing leasing_id    DEFAULT     x   ALTER TABLE ONLY public.leasing ALTER COLUMN leasing_id SET DEFAULT nextval('public.leasing_leasing_id_seq'::regclass);
 A   ALTER TABLE public.leasing ALTER COLUMN leasing_id DROP DEFAULT;
       public          postgres    false    220    221    221            v           2604    16917    subscribers subscriber_id    DEFAULT     �   ALTER TABLE ONLY public.subscribers ALTER COLUMN subscriber_id SET DEFAULT nextval('public.subscribers_subscriber_id_seq'::regclass);
 H   ALTER TABLE public.subscribers ALTER COLUMN subscriber_id DROP DEFAULT;
       public          postgres    false    219    218    219                      0    16900    devices 
   TABLE DATA           k   COPY public.devices (device_id, laptop_id, device_name, device_status, created_on, last_login) FROM stdin;
    public          postgres    false    217   �+                 0    16891    laptops 
   TABLE DATA           �   COPY public.laptops (laptop_id, manufacturer, model, processor, graphics_card, memory, screen_size, resolution, storage, operating_system) FROM stdin;
    public          postgres    false    215   �,                 0    16945    leasing 
   TABLE DATA           q   COPY public.leasing (leasing_id, device_id, subscriber_id, monthly_cost, leasing_start, leasing_end) FROM stdin;
    public          postgres    false    221   	.                 0    16914    subscribers 
   TABLE DATA           f   COPY public.subscribers (subscriber_id, company_name, mailing_address, postal_code, city) FROM stdin;
    public          postgres    false    219   �.       %           0    0    devices_device_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.devices_device_id_seq', 1, false);
          public          postgres    false    214            &           0    0    devices_device_id_seq1    SEQUENCE SET     D   SELECT pg_catalog.setval('public.devices_device_id_seq1', 9, true);
          public          postgres    false    216            '           0    0    leasing_leasing_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.leasing_leasing_id_seq', 1, false);
          public          postgres    false    220            (           0    0    subscribers_subscriber_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.subscribers_subscriber_id_seq', 3, true);
          public          postgres    false    218            {           2606    16907    devices devices_device_name_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_device_name_key UNIQUE (device_name);
 I   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_device_name_key;
       public            postgres    false    217            y           2606    16898    laptops devices_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.laptops
    ADD CONSTRAINT devices_pkey PRIMARY KEY (laptop_id);
 >   ALTER TABLE ONLY public.laptops DROP CONSTRAINT devices_pkey;
       public            postgres    false    215            }           2606    16905    devices devices_pkey1 
   CONSTRAINT     Z   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey1 PRIMARY KEY (device_id);
 ?   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_pkey1;
       public            postgres    false    217            �           2606    16950    leasing leasing_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.leasing
    ADD CONSTRAINT leasing_pkey PRIMARY KEY (leasing_id);
 >   ALTER TABLE ONLY public.leasing DROP CONSTRAINT leasing_pkey;
       public            postgres    false    221                       2606    16919    subscribers subscribers_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.subscribers
    ADD CONSTRAINT subscribers_pkey PRIMARY KEY (subscriber_id);
 F   ALTER TABLE ONLY public.subscribers DROP CONSTRAINT subscribers_pkey;
       public            postgres    false    219            �           2606    16908    devices devices_laptop_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_laptop_id_fkey FOREIGN KEY (laptop_id) REFERENCES public.laptops(laptop_id);
 H   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_laptop_id_fkey;
       public          postgres    false    215    3193    217            �           2606    16951    leasing leasing_device_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.leasing
    ADD CONSTRAINT leasing_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.devices(device_id);
 H   ALTER TABLE ONLY public.leasing DROP CONSTRAINT leasing_device_id_fkey;
       public          postgres    false    217    221    3197            �           2606    16956 "   leasing leasing_subscriber_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.leasing
    ADD CONSTRAINT leasing_subscriber_id_fkey FOREIGN KEY (subscriber_id) REFERENCES public.subscribers(subscriber_id);
 L   ALTER TABLE ONLY public.leasing DROP CONSTRAINT leasing_subscriber_id_fkey;
       public          postgres    false    219    3199    221               �   x��н�1����U�9?�$bT��F��b
������2(�j{�y|��!��[��J��>t��0*t���d�lg���6UR���p�_�Sz��Q��^����EwU��i���k�Z���) ,�NV�`��?�ܰv$�<��Ճ`?�_@��ӄb1�k�����I�cm�Ɛ� �E� �ױ(�%�7�Sa��,��Cz�         D  x���[O�0���S�GH�����&X�@�_�T���l���cI������{�C�Q�3�a��]�@A��k�6���Y�\���4$����j�+���*Y� (FD����."�hQ�C�W���j�pR��U�)�|�i�"�����BwI�4�yYaf@��y�q�U�R�O��.)���)k�1寒Y��Qtj�����Dn���P��s�S`�݌afgKmR�D�*���c�-�����d�h�<�1/7]y�Q��}F���~Ғ��	���OBS��ޔ/��X�Y{,���Io�~�oo]D>4��d�̨         �   x�����0D��):@�.Nܴ��4��TLB�.HH��:����%�1K��?�`�"�]�빑9ejr��aEe�P�E
q�s���U��ӓ�}����Q�.���/=9�M�hZS����k�On�M�.�_�!G������]T�gje         q   x�3�NM.-J�Q���tU02�P(.)JM-Q0�4N�̒JC.#N�J���̢� �Ј����Ĕ�,R�e��\��Z4�H���qq�$��qqq �'�     