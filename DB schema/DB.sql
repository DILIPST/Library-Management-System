PGDMP         
                z            postgres    14.2    14.2 &    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    13754    postgres    DATABASE     d   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_India.utf8';
    DROP DATABASE postgres;
                postgres    false            &           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3365                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            '           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            ?            1259    24630    admin    TABLE     H   CREATE TABLE public.admin (
    adminame text NOT NULL,
    pwd text
);
    DROP TABLE public.admin;
       public         heap    postgres    false            ?            1259    24606    books    TABLE     ?   CREATE TABLE public.books (
    title text,
    author text,
    subject text,
    pdate text,
    id integer NOT NULL,
    count integer,
    bookid integer NOT NULL
);
    DROP TABLE public.books;
       public         heap    postgres    false            ?            1259    32803    books_bookid_seq    SEQUENCE     ?   ALTER TABLE public.books ALTER COLUMN bookid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.books_bookid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            ?            1259    24617    books_id_seq    SEQUENCE     ?   ALTER TABLE public.books ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    211            ?            1259    24655    issuedbooks    TABLE     s   CREATE TABLE public.issuedbooks (
    bookname text,
    username text,
    issueddate date,
    untildate date
);
    DROP TABLE public.issuedbooks;
       public         heap    postgres    false            ?            1259    24597    login    TABLE     W   CREATE TABLE public.login (
    pass character varying,
    usern character varying
);
    DROP TABLE public.login;
       public         heap    postgres    false            ?            1259    24623    members    TABLE     ?   CREATE TABLE public.members (
    name text,
    add text,
    phonenumber text,
    mail text,
    username text NOT NULL,
    pwd text,
    mem text,
    count integer,
    memberid integer NOT NULL,
    validtill date
);
    DROP TABLE public.members;
       public         heap    postgres    false            ?            1259    32809    members_memberid_seq    SEQUENCE     ?   ALTER TABLE public.members ALTER COLUMN memberid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.members_memberid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            ?            1259    32823    notification    TABLE     b   CREATE TABLE public.notification (
    username text,
    status text,
    id integer NOT NULL
);
     DROP TABLE public.notification;
       public         heap    postgres    false            ?            1259    32828    notification_id_seq    SEQUENCE     ?   ALTER TABLE public.notification ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            ?            1259    32816    requests    TABLE     M   CREATE TABLE public.requests (
    namer text NOT NULL,
    accepted text
);
    DROP TABLE public.requests;
       public         heap    postgres    false            ?            1259    24666    reservedbooks    TABLE     ?   CREATE TABLE public.reservedbooks (
    bookname text,
    username text,
    "SI.No" integer NOT NULL,
    fromdate date,
    todate date
);
 !   DROP TABLE public.reservedbooks;
       public         heap    postgres    false            ?            1259    24671    reservedbooks_SI.No_seq    SEQUENCE     ?   ALTER TABLE public.reservedbooks ALTER COLUMN "SI.No" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservedbooks_SI.No_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            ?            1259    24649    usera    TABLE     1   CREATE TABLE public.usera (
    username text
);
    DROP TABLE public.usera;
       public         heap    postgres    false                      0    24630    admin 
   TABLE DATA           .   COPY public.admin (adminame, pwd) FROM stdin;
    public          postgres    false    214   ]%                 0    24606    books 
   TABLE DATA           Q   COPY public.books (title, author, subject, pdate, id, count, bookid) FROM stdin;
    public          postgres    false    211   ?%                 0    24655    issuedbooks 
   TABLE DATA           P   COPY public.issuedbooks (bookname, username, issueddate, untildate) FROM stdin;
    public          postgres    false    216   i&                 0    24597    login 
   TABLE DATA           ,   COPY public.login (pass, usern) FROM stdin;
    public          postgres    false    210   ?&                 0    24623    members 
   TABLE DATA           o   COPY public.members (name, add, phonenumber, mail, username, pwd, mem, count, memberid, validtill) FROM stdin;
    public          postgres    false    213   ?&                 0    32823    notification 
   TABLE DATA           <   COPY public.notification (username, status, id) FROM stdin;
    public          postgres    false    222   ?'                 0    32816    requests 
   TABLE DATA           3   COPY public.requests (namer, accepted) FROM stdin;
    public          postgres    false    221   (                 0    24666    reservedbooks 
   TABLE DATA           V   COPY public.reservedbooks (bookname, username, "SI.No", fromdate, todate) FROM stdin;
    public          postgres    false    217   3(                 0    24649    usera 
   TABLE DATA           )   COPY public.usera (username) FROM stdin;
    public          postgres    false    215   P(       (           0    0    books_bookid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.books_bookid_seq', 8, true);
          public          postgres    false    219            )           0    0    books_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.books_id_seq', 18, true);
          public          postgres    false    212            *           0    0    members_memberid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.members_memberid_seq', 18, true);
          public          postgres    false    220            +           0    0    notification_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.notification_id_seq', 36, true);
          public          postgres    false    223            ,           0    0    reservedbooks_SI.No_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."reservedbooks_SI.No_seq"', 42, true);
          public          postgres    false    218            ?           2606    24636    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (adminame);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    214            ?           2606    24629    members members_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (username);
 >   ALTER TABLE ONLY public.members DROP CONSTRAINT members_pkey;
       public            postgres    false    213            ?           2606    32822    requests requests_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (namer);
 @   ALTER TABLE ONLY public.requests DROP CONSTRAINT requests_pkey;
       public            postgres    false    221                  x?KL???s042?,(O?\1z\\\ R??         ?   x?U?An?0????Sp?????.?*$D????ո4jmW&?????J-?Y????I;??????p???'?\?,י( 4rh2?29???p??e???u3??d?????Q?XB(n??????R?.?>???Y?f??g??2???S???e?n??Xp??q?x??m??Q?bMr%i??9?M?¡z0u?Y??n????K&?Ɯt??7?F?         A   x?sT.?/??L???,(.?4202?50?52?3??\?Rs	??K?K?L??8???qqq ??         )   x?+.JMv042?L???,(.1?*??$?%楀X\1z\\\ ?         ?   x?????0??ۧ?P?C-? 1?%?l??*-???oo???x?6?ٙo/nrOP?Rч??coc?pV7?T????n????J7)ڎa?\?AZ`?!?l	?R\?Lڀ??C???ɏ??k?1??????????2:p?uY??4*?Gl?nb??w?????q??!oQ?Q?         H   x?KOM-?H,-N-??L-?4?J???,(.12?M???R??y??F?H|???	?KT??	?cS?=... n?&            x?K???,(.????????? 03?            x?????? ? ?            x?K???,?J??%?\1~6&#F??? ??I     