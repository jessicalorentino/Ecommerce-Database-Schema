PGDMP      #                }         	   ecommerce    17.4    17.4 ,    P           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            Q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            R           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            S           1262    24584 	   ecommerce    DATABASE     o   CREATE DATABASE ecommerce WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'pt-BR';
    DROP DATABASE ecommerce;
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            T           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    24586    cliente    TABLE     �  CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nome character varying(100) NOT NULL,
    tipo_cliente character varying(2) NOT NULL,
    cpf character varying(14),
    cnpj character varying(18),
    email character varying(100) NOT NULL,
    CONSTRAINT cliente_tipo_cliente_check CHECK (((tipo_cliente)::text = ANY ((ARRAY['PJ'::character varying, 'PF'::character varying])::text[])))
);
    DROP TABLE public.cliente;
       public         heap r       postgres    false    4            �            1259    24585    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public               postgres    false    218    4            U           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public               postgres    false    217            �            1259    24631    itens_pedido    TABLE     �   CREATE TABLE public.itens_pedido (
    id_pedido integer NOT NULL,
    id_produto integer NOT NULL,
    quantidade integer NOT NULL,
    preco_total numeric(10,2) NOT NULL
);
     DROP TABLE public.itens_pedido;
       public         heap r       postgres    false    4            �            1259    24600 	   pagamento    TABLE     �   CREATE TABLE public.pagamento (
    id_pagamento integer NOT NULL,
    id_cliente integer NOT NULL,
    tipo_pagamento character varying(50) NOT NULL,
    detalhes_pagamento character varying(255)
);
    DROP TABLE public.pagamento;
       public         heap r       postgres    false    4            �            1259    24599    pagamento_id_pagamento_seq    SEQUENCE     �   CREATE SEQUENCE public.pagamento_id_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.pagamento_id_pagamento_seq;
       public               postgres    false    220    4            V           0    0    pagamento_id_pagamento_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.pagamento_id_pagamento_seq OWNED BY public.pagamento.id_pagamento;
          public               postgres    false    219            �            1259    24612    pedido    TABLE     �  CREATE TABLE public.pedido (
    id_pedido integer NOT NULL,
    id_cliente integer NOT NULL,
    data_pedido date NOT NULL,
    status_entrega character varying(20) NOT NULL,
    codigo_rastreamento character varying(50),
    CONSTRAINT pedido_status_entrega_check CHECK (((status_entrega)::text = ANY ((ARRAY['Processando'::character varying, 'Enviado'::character varying, 'Entregue'::character varying])::text[])))
);
    DROP TABLE public.pedido;
       public         heap r       postgres    false    4            �            1259    24611    pedido_id_pedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pedido_id_pedido_seq;
       public               postgres    false    4    222            W           0    0    pedido_id_pedido_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pedido_id_pedido_seq OWNED BY public.pedido.id_pedido;
          public               postgres    false    221            �            1259    24625    produto    TABLE     �   CREATE TABLE public.produto (
    id_produto integer NOT NULL,
    nome_produto character varying(100) NOT NULL,
    preco numeric(10,2) NOT NULL,
    quantidade_estoque integer NOT NULL
);
    DROP TABLE public.produto;
       public         heap r       postgres    false    4            �            1259    24624    produto_id_produto_seq    SEQUENCE     �   CREATE SEQUENCE public.produto_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.produto_id_produto_seq;
       public               postgres    false    4    224            X           0    0    produto_id_produto_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.produto_id_produto_seq OWNED BY public.produto.id_produto;
          public               postgres    false    223            �           2604    24589    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public               postgres    false    218    217    218            �           2604    24603    pagamento id_pagamento    DEFAULT     �   ALTER TABLE ONLY public.pagamento ALTER COLUMN id_pagamento SET DEFAULT nextval('public.pagamento_id_pagamento_seq'::regclass);
 E   ALTER TABLE public.pagamento ALTER COLUMN id_pagamento DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    24615    pedido id_pedido    DEFAULT     t   ALTER TABLE ONLY public.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedido_id_pedido_seq'::regclass);
 ?   ALTER TABLE public.pedido ALTER COLUMN id_pedido DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    24628    produto id_produto    DEFAULT     x   ALTER TABLE ONLY public.produto ALTER COLUMN id_produto SET DEFAULT nextval('public.produto_id_produto_seq'::regclass);
 A   ALTER TABLE public.produto ALTER COLUMN id_produto DROP DEFAULT;
       public               postgres    false    223    224    224            F          0    24586    cliente 
   TABLE DATA           S   COPY public.cliente (id_cliente, nome, tipo_cliente, cpf, cnpj, email) FROM stdin;
    public               postgres    false    218   65       M          0    24631    itens_pedido 
   TABLE DATA           V   COPY public.itens_pedido (id_pedido, id_produto, quantidade, preco_total) FROM stdin;
    public               postgres    false    225   S5       H          0    24600 	   pagamento 
   TABLE DATA           a   COPY public.pagamento (id_pagamento, id_cliente, tipo_pagamento, detalhes_pagamento) FROM stdin;
    public               postgres    false    220   p5       J          0    24612    pedido 
   TABLE DATA           i   COPY public.pedido (id_pedido, id_cliente, data_pedido, status_entrega, codigo_rastreamento) FROM stdin;
    public               postgres    false    222   �5       L          0    24625    produto 
   TABLE DATA           V   COPY public.produto (id_produto, nome_produto, preco, quantidade_estoque) FROM stdin;
    public               postgres    false    224   �5       Y           0    0    cliente_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, false);
          public               postgres    false    217            Z           0    0    pagamento_id_pagamento_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.pagamento_id_pagamento_seq', 1, false);
          public               postgres    false    219            [           0    0    pedido_id_pedido_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pedido_id_pedido_seq', 1, false);
          public               postgres    false    221            \           0    0    produto_id_produto_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.produto_id_produto_seq', 1, false);
          public               postgres    false    223            �           2606    24596    cliente cliente_cnpj_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cnpj_key UNIQUE (cnpj);
 B   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_cnpj_key;
       public                 postgres    false    218            �           2606    24594    cliente cliente_cpf_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cpf_key UNIQUE (cpf);
 A   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_cpf_key;
       public                 postgres    false    218            �           2606    24598    cliente cliente_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_email_key;
       public                 postgres    false    218            �           2606    24592    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public                 postgres    false    218            �           2606    24635    itens_pedido itens_pedido_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_pkey PRIMARY KEY (id_pedido, id_produto);
 H   ALTER TABLE ONLY public.itens_pedido DROP CONSTRAINT itens_pedido_pkey;
       public                 postgres    false    225    225            �           2606    24605    pagamento pagamento_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (id_pagamento);
 B   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT pagamento_pkey;
       public                 postgres    false    220            �           2606    24618    pedido pedido_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public                 postgres    false    222            �           2606    24630    produto produto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id_produto);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public                 postgres    false    224            �           2606    24636 (   itens_pedido itens_pedido_id_pedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedido(id_pedido);
 R   ALTER TABLE ONLY public.itens_pedido DROP CONSTRAINT itens_pedido_id_pedido_fkey;
       public               postgres    false    225    222    4778            �           2606    24641 )   itens_pedido itens_pedido_id_produto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.produto(id_produto);
 S   ALTER TABLE ONLY public.itens_pedido DROP CONSTRAINT itens_pedido_id_produto_fkey;
       public               postgres    false    224    225    4780            �           2606    24606 #   pagamento pagamento_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 M   ALTER TABLE ONLY public.pagamento DROP CONSTRAINT pagamento_id_cliente_fkey;
       public               postgres    false    4774    220    218            �           2606    24619    pedido pedido_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_id_cliente_fkey;
       public               postgres    false    222    4774    218            F      x������ � �      M      x������ � �      H      x������ � �      J      x������ � �      L      x������ � �     