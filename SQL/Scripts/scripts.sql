--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-10-11 12:56:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 16393)
-- Name: ecommerce-db; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "ecommerce-db";


ALTER SCHEMA "ecommerce-db" OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 16432)
-- Name: customer_payment_methods; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".customer_payment_methods (
    customer_payment_method_id uuid NOT NULL,
    customer_id character varying(25000) NOT NULL,
    payment_method_code character varying(25000) NOT NULL,
    credit_card_number character varying(25000),
    payment_method_details character varying(25000)
);


ALTER TABLE "ecommerce-db".customer_payment_methods OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16394)
-- Name: customers; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".customers (
    customer_id uuid NOT NULL,
    organization_or_person character varying(25000) NOT NULL,
    organization_name character varying(25000),
    gender character varying(10),
    first_name character varying(25000) NOT NULL,
    middle_initial character varying(25000),
    last_name character varying(25000),
    email_address character varying(30000)[] NOT NULL,
    login_name character varying(20000) NOT NULL,
    login_password character varying(2500),
    phone_number character varying,
    address_line_1 character varying,
    address_line_2 character varying,
    address_line_3 character varying,
    address_line_4 character varying,
    town_city character varying,
    county character varying,
    country character varying
);


ALTER TABLE "ecommerce-db".customers OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16448)
-- Name: invoices; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".invoices (
    invoice_id uuid NOT NULL,
    invoice_number character varying(25000) NOT NULL,
    order_id character varying(25000) NOT NULL,
    invoice_status_code character varying(25000) NOT NULL,
    invoice_date character varying(25000) NOT NULL,
    invoice_details character varying(25000) NOT NULL
);


ALTER TABLE "ecommerce-db".invoices OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16464)
-- Name: order_items; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".order_items (
    order_item_id uuid NOT NULL,
    product_id character varying(25000) NOT NULL,
    order_id character varying(25000) NOT NULL,
    order_item_status_code character varying(25000) NOT NULL,
    order_item_quantity character varying(25000) NOT NULL,
    order_item_price character varying(25000) NOT NULL,
    rma_number character varying(25000),
    rma_issued_by character varying(25000),
    rma_issued_date character varying(25000),
    other_order_item_details character varying(25000)
);


ALTER TABLE "ecommerce-db".order_items OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16416)
-- Name: orders; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".orders (
    order_id uuid NOT NULL,
    customer_id character varying(25000) NOT NULL,
    order_status_code character varying(25000),
    date_order_placed character varying(25000),
    order_details character varying(25000)
);


ALTER TABLE "ecommerce-db".orders OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16489)
-- Name: payments; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".payments (
    payment_id uuid NOT NULL,
    invoice_number character varying(25000) NOT NULL,
    payment_date character varying(25000),
    payment_amount character varying(25000)
);


ALTER TABLE "ecommerce-db".payments OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16497)
-- Name: ref_invoice_status_codes; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".ref_invoice_status_codes (
    ref_invoice_status_code_id uuid NOT NULL,
    invoice_status_code character varying(25000) NOT NULL,
    invoice_status_description character varying(25000)
);


ALTER TABLE "ecommerce-db".ref_invoice_status_codes OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16472)
-- Name: ref_order_items_status_codes; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".ref_order_items_status_codes (
    ref_order_items_status_code_id uuid NOT NULL,
    order_items_status_code character varying(25000) NOT NULL,
    order_items_status_description character varying(25000) NOT NULL
);


ALTER TABLE "ecommerce-db".ref_order_items_status_codes OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16440)
-- Name: ref_order_status_codes; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".ref_order_status_codes (
    ref_order_status_code_id uuid NOT NULL,
    order_status_code character varying(25000) NOT NULL,
    order_status_description character varying(25000) NOT NULL
);


ALTER TABLE "ecommerce-db".ref_order_status_codes OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16424)
-- Name: ref_payment_methods; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".ref_payment_methods (
    ref_payment_method_id uuid NOT NULL,
    payment_method_code character varying(25000) NOT NULL,
    payment_method_description character varying(25000)
);


ALTER TABLE "ecommerce-db".ref_payment_methods OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16408)
-- Name: ref_product_types; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".ref_product_types (
    ref_product_types_id uuid NOT NULL,
    product_type_code character varying(25000) NOT NULL,
    parent_product_type_code character varying(25000),
    product_type_description character varying(10000)
);


ALTER TABLE "ecommerce-db".ref_product_types OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16480)
-- Name: shipment_items; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".shipment_items (
    shipment_item_id uuid NOT NULL,
    shipment_id character varying(25000) NOT NULL,
    order_items_id character varying(25000) NOT NULL
);


ALTER TABLE "ecommerce-db".shipment_items OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16456)
-- Name: shipments; Type: TABLE; Schema: ecommerce-db; Owner: postgres
--

CREATE TABLE "ecommerce-db".shipments (
    shipment_id uuid NOT NULL,
    order_id character varying(25000) NOT NULL,
    invoice_number character varying(25000) NOT NULL,
    shipment_tracking_number character varying(25000) NOT NULL,
    shipment_date character varying(25000) NOT NULL,
    otherr_shipment_details character varying(25000) NOT NULL
);


ALTER TABLE "ecommerce-db".shipments OWNER TO postgres;

--
-- TOC entry 2882 (class 0 OID 16432)
-- Dependencies: 202
-- Data for Name: customer_payment_methods; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2878 (class 0 OID 16394)
-- Dependencies: 198
-- Data for Name: customers; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2884 (class 0 OID 16448)
-- Dependencies: 204
-- Data for Name: invoices; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2886 (class 0 OID 16464)
-- Dependencies: 206
-- Data for Name: order_items; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2880 (class 0 OID 16416)
-- Dependencies: 200
-- Data for Name: orders; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2889 (class 0 OID 16489)
-- Dependencies: 209
-- Data for Name: payments; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2890 (class 0 OID 16497)
-- Dependencies: 210
-- Data for Name: ref_invoice_status_codes; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2887 (class 0 OID 16472)
-- Dependencies: 207
-- Data for Name: ref_order_items_status_codes; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2883 (class 0 OID 16440)
-- Dependencies: 203
-- Data for Name: ref_order_status_codes; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2881 (class 0 OID 16424)
-- Dependencies: 201
-- Data for Name: ref_payment_methods; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2879 (class 0 OID 16408)
-- Dependencies: 199
-- Data for Name: ref_product_types; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2888 (class 0 OID 16480)
-- Dependencies: 208
-- Data for Name: shipment_items; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2885 (class 0 OID 16456)
-- Dependencies: 205
-- Data for Name: shipments; Type: TABLE DATA; Schema: ecommerce-db; Owner: postgres
--



--
-- TOC entry 2740 (class 2606 OID 16439)
-- Name: customer_payment_methods customer_payment_methods_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".customer_payment_methods
    ADD CONSTRAINT customer_payment_methods_pkey PRIMARY KEY (customer_payment_method_id);


--
-- TOC entry 2732 (class 2606 OID 16401)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 2744 (class 2606 OID 16455)
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (invoice_id);


--
-- TOC entry 2748 (class 2606 OID 16471)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- TOC entry 2736 (class 2606 OID 16423)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 2754 (class 2606 OID 16496)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 2756 (class 2606 OID 16504)
-- Name: ref_invoice_status_codes ref_invoice_status_codes_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".ref_invoice_status_codes
    ADD CONSTRAINT ref_invoice_status_codes_pkey PRIMARY KEY (ref_invoice_status_code_id);


--
-- TOC entry 2750 (class 2606 OID 16479)
-- Name: ref_order_items_status_codes ref_order_items_status_codes_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".ref_order_items_status_codes
    ADD CONSTRAINT ref_order_items_status_codes_pkey PRIMARY KEY (ref_order_items_status_code_id);


--
-- TOC entry 2742 (class 2606 OID 16447)
-- Name: ref_order_status_codes ref_order_status_codes_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".ref_order_status_codes
    ADD CONSTRAINT ref_order_status_codes_pkey PRIMARY KEY (ref_order_status_code_id);


--
-- TOC entry 2738 (class 2606 OID 16431)
-- Name: ref_payment_methods ref_payment_methods_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".ref_payment_methods
    ADD CONSTRAINT ref_payment_methods_pkey PRIMARY KEY (ref_payment_method_id);


--
-- TOC entry 2734 (class 2606 OID 16415)
-- Name: ref_product_types ref_product_types_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".ref_product_types
    ADD CONSTRAINT ref_product_types_pkey PRIMARY KEY (ref_product_types_id);


--
-- TOC entry 2752 (class 2606 OID 16487)
-- Name: shipment_items shipment_items_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".shipment_items
    ADD CONSTRAINT shipment_items_pkey PRIMARY KEY (shipment_item_id);


--
-- TOC entry 2746 (class 2606 OID 16463)
-- Name: shipments shipments_pkey; Type: CONSTRAINT; Schema: ecommerce-db; Owner: postgres
--

ALTER TABLE ONLY "ecommerce-db".shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (shipment_id);


-- Completed on 2018-10-11 12:56:25

--
-- PostgreSQL database dump complete
--

