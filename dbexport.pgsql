--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.account_emailaddress (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO efi;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO efi;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.account_emailconfirmation (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id bigint NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO efi;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO efi;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO efi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO efi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO efi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO efi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO efi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO efi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO efi;

--
-- Name: customers_address; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.customers_address (
    id bigint NOT NULL,
    province character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    postcode character varying(12) NOT NULL,
    address character varying(1200) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.customers_address OWNER TO efi;

--
-- Name: customers_address_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.customers_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_address_id_seq OWNER TO efi;

--
-- Name: customers_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.customers_address_id_seq OWNED BY public.customers_address.id;


--
-- Name: customers_customer; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.customers_customer (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(128) NOT NULL,
    gender boolean NOT NULL
);


ALTER TABLE public.customers_customer OWNER TO efi;

--
-- Name: customers_customer_groups; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.customers_customer_groups (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.customers_customer_groups OWNER TO efi;

--
-- Name: customers_customer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.customers_customer_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_groups_id_seq OWNER TO efi;

--
-- Name: customers_customer_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.customers_customer_groups_id_seq OWNED BY public.customers_customer_groups.id;


--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO efi;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers_customer.id;


--
-- Name: customers_customer_user_permissions; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.customers_customer_user_permissions (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.customers_customer_user_permissions OWNER TO efi;

--
-- Name: customers_customer_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.customers_customer_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_user_permissions_id_seq OWNER TO efi;

--
-- Name: customers_customer_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.customers_customer_user_permissions_id_seq OWNED BY public.customers_customer_user_permissions.id;


--
-- Name: customers_discountcode; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.customers_discountcode (
    id bigint NOT NULL,
    code character varying(10) NOT NULL,
    amount integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    expire_date timestamp with time zone NOT NULL,
    user_id bigint,
    CONSTRAINT customers_discountcode_amount_check CHECK ((amount >= 0))
);


ALTER TABLE public.customers_discountcode OWNER TO efi;

--
-- Name: customers_discountcode_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.customers_discountcode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_discountcode_id_seq OWNER TO efi;

--
-- Name: customers_discountcode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.customers_discountcode_id_seq OWNED BY public.customers_discountcode.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO efi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO efi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO efi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO efi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO efi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO efi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO efi;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO efi;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO efi;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: orders_order; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.orders_order (
    id bigint NOT NULL,
    total_price integer NOT NULL,
    order_date timestamp with time zone,
    ref_code character varying(10),
    delivery_status character varying(20) NOT NULL,
    address_id bigint NOT NULL,
    user_id bigint,
    CONSTRAINT orders_order_total_price_check CHECK ((total_price >= 0))
);


ALTER TABLE public.orders_order OWNER TO efi;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO efi;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders_order.id;


--
-- Name: orders_order_products; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.orders_order_products (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    orderitem_id bigint NOT NULL
);


ALTER TABLE public.orders_order_products OWNER TO efi;

--
-- Name: orders_order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.orders_order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_products_id_seq OWNER TO efi;

--
-- Name: orders_order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.orders_order_products_id_seq OWNED BY public.orders_order_products.id;


--
-- Name: orders_orderitem; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.orders_orderitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    item_id bigint NOT NULL
);


ALTER TABLE public.orders_orderitem OWNER TO efi;

--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.orders_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderitem_id_seq OWNER TO efi;

--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.orders_orderitem_id_seq OWNED BY public.orders_orderitem.id;


--
-- Name: products_category; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.products_category (
    id bigint NOT NULL,
    title character varying(100) NOT NULL
);


ALTER TABLE public.products_category OWNER TO efi;

--
-- Name: products_category_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.products_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_id_seq OWNER TO efi;

--
-- Name: products_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products_category.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.products_product (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    price integer NOT NULL,
    description text NOT NULL,
    seller character varying(200) NOT NULL,
    rate integer NOT NULL,
    count integer,
    status boolean NOT NULL,
    category_id bigint NOT NULL,
    CONSTRAINT products_product_count_check CHECK ((count >= 0)),
    CONSTRAINT products_product_price_check CHECK ((price >= 0)),
    CONSTRAINT products_product_rate_check CHECK ((rate >= 0))
);


ALTER TABLE public.products_product OWNER TO efi;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO efi;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;


--
-- Name: products_product_image; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.products_product_image (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    productimage_id bigint NOT NULL
);


ALTER TABLE public.products_product_image OWNER TO efi;

--
-- Name: products_product_image_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.products_product_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_image_id_seq OWNER TO efi;

--
-- Name: products_product_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.products_product_image_id_seq OWNED BY public.products_product_image.id;


--
-- Name: products_productimage; Type: TABLE; Schema: public; Owner: efi
--

CREATE TABLE public.products_productimage (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.products_productimage OWNER TO efi;

--
-- Name: products_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: efi
--

CREATE SEQUENCE public.products_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_productimage_id_seq OWNER TO efi;

--
-- Name: products_productimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: efi
--

ALTER SEQUENCE public.products_productimage_id_seq OWNED BY public.products_productimage.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: customers_address id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_address ALTER COLUMN id SET DEFAULT nextval('public.customers_address_id_seq'::regclass);


--
-- Name: customers_customer id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer ALTER COLUMN id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: customers_customer_groups id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer_groups ALTER COLUMN id SET DEFAULT nextval('public.customers_customer_groups_id_seq'::regclass);


--
-- Name: customers_customer_user_permissions id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.customers_customer_user_permissions_id_seq'::regclass);


--
-- Name: customers_discountcode id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_discountcode ALTER COLUMN id SET DEFAULT nextval('public.customers_discountcode_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: orders_order id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_order ALTER COLUMN id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: orders_order_products id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_order_products ALTER COLUMN id SET DEFAULT nextval('public.orders_order_products_id_seq'::regclass);


--
-- Name: orders_orderitem id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_orderitem ALTER COLUMN id SET DEFAULT nextval('public.orders_orderitem_id_seq'::regclass);


--
-- Name: products_category id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_id_seq'::regclass);


--
-- Name: products_product id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: products_product_image id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_product_image ALTER COLUMN id SET DEFAULT nextval('public.products_product_image_id_seq'::regclass);


--
-- Name: products_productimage id; Type: DEFAULT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_productimage ALTER COLUMN id SET DEFAULT nextval('public.products_productimage_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add category	6	add_category
22	Can change category	6	change_category
23	Can delete category	6	delete_category
24	Can view category	6	view_category
25	Can add product image	7	add_productimage
26	Can change product image	7	change_productimage
27	Can delete product image	7	delete_productimage
28	Can view product image	7	view_productimage
29	Can add product	8	add_product
30	Can change product	8	change_product
31	Can delete product	8	delete_product
32	Can view product	8	view_product
33	Can add user	9	add_customer
34	Can change user	9	change_customer
35	Can delete user	9	delete_customer
36	Can view user	9	view_customer
37	Can add discount code	10	add_discountcode
38	Can change discount code	10	change_discountcode
39	Can delete discount code	10	delete_discountcode
40	Can view discount code	10	view_discountcode
41	Can add address	11	add_address
42	Can change address	11	change_address
43	Can delete address	11	delete_address
44	Can view address	11	view_address
45	Can add order item	12	add_orderitem
46	Can change order item	12	change_orderitem
47	Can delete order item	12	delete_orderitem
48	Can view order item	12	view_orderitem
49	Can add order	13	add_order
50	Can change order	13	change_order
51	Can delete order	13	delete_order
52	Can view order	13	view_order
53	Can add Token	14	add_token
54	Can change Token	14	change_token
55	Can delete Token	14	delete_token
56	Can view Token	14	view_token
57	Can add token	15	add_tokenproxy
58	Can change token	15	change_tokenproxy
59	Can delete token	15	delete_tokenproxy
60	Can view token	15	view_tokenproxy
61	Can add site	16	add_site
62	Can change site	16	change_site
63	Can delete site	16	delete_site
64	Can view site	16	view_site
65	Can add social application	17	add_socialapp
66	Can change social application	17	change_socialapp
67	Can delete social application	17	delete_socialapp
68	Can view social application	17	view_socialapp
69	Can add social account	18	add_socialaccount
70	Can change social account	18	change_socialaccount
71	Can delete social account	18	delete_socialaccount
72	Can view social account	18	view_socialaccount
73	Can add social application token	19	add_socialtoken
74	Can change social application token	19	change_socialtoken
75	Can delete social application token	19	delete_socialtoken
76	Can view social application token	19	view_socialtoken
77	Can add email address	20	add_emailaddress
78	Can change email address	20	change_emailaddress
79	Can delete email address	20	delete_emailaddress
80	Can view email address	20	view_emailaddress
81	Can add email confirmation	21	add_emailconfirmation
82	Can change email confirmation	21	change_emailconfirmation
83	Can delete email confirmation	21	delete_emailconfirmation
84	Can view email confirmation	21	view_emailconfirmation
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: customers_address; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.customers_address (id, province, city, postcode, address, user_id) FROM stdin;
\.


--
-- Data for Name: customers_customer; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.customers_customer (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, email, phone, gender) FROM stdin;
1	pbkdf2_sha256$260000$2JOR04RUifBppwWzftKHUJ$S7dkPyHmD5XeTQXO2q3Dw0hwe45p3zxKWap73vrED7Y=	2021-10-14 07:18:33.935693+00	t			t	t	2021-10-14 06:54:03.447898+00	admin@gmail.com		t
\.


--
-- Data for Name: customers_customer_groups; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.customers_customer_groups (id, customer_id, group_id) FROM stdin;
\.


--
-- Data for Name: customers_customer_user_permissions; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.customers_customer_user_permissions (id, customer_id, permission_id) FROM stdin;
\.


--
-- Data for Name: customers_discountcode; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.customers_discountcode (id, code, amount, start_date, expire_date, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-10-14 07:23:20.39767+00	1	شازده کوچولو1	1	[{"added": {}}]	7	1
2	2021-10-14 07:23:37.091766+00	2	شازده کوچولو2	1	[{"added": {}}]	7	1
3	2021-10-14 07:23:43.778116+00	1	کتاب	1	[{"added": {}}, {"added": {"name": "product", "object": "\\u0634\\u0627\\u0632\\u062f\\u0647 \\u06a9\\u0648\\u0686\\u0648\\u0644\\u0648"}}]	6	1
4	2021-10-14 07:29:21.315155+00	1	کتاب	2	[{"changed": {"name": "product", "object": "\\u0634\\u0627\\u0632\\u062f\\u0647 \\u06a9\\u0648\\u0686\\u0648\\u0644\\u0648", "fields": ["Count"]}}]	6	1
5	2021-10-14 07:29:51.143407+00	1	کتاب	2	[{"changed": {"name": "product", "object": "\\u0634\\u0627\\u0632\\u062f\\u0647 \\u06a9\\u0648\\u0686\\u0648\\u0644\\u0648", "fields": ["Count"]}}]	6	1
6	2021-10-14 07:30:29.948788+00	1	کتاب	2	[{"changed": {"name": "product", "object": "\\u0634\\u0627\\u0632\\u062f\\u0647 \\u06a9\\u0648\\u0686\\u0648\\u0644\\u0648", "fields": ["Count"]}}]	6	1
7	2021-10-14 07:30:50.429166+00	1	کتاب	2	[{"changed": {"name": "product", "object": "\\u0634\\u0627\\u0632\\u062f\\u0647 \\u06a9\\u0648\\u0686\\u0648\\u0644\\u0648", "fields": ["Count"]}}]	6	1
8	2021-10-14 07:39:39.609094+00	1	کتاب	2	[{"changed": {"name": "product", "object": "\\u0634\\u0627\\u0632\\u062f\\u0647 \\u06a9\\u0648\\u0686\\u0648\\u0644\\u0648", "fields": ["Count"]}}]	6	1
9	2021-10-14 07:56:58.449105+00	3	POCO X3 Pro 1	1	[{"added": {}}]	7	1
10	2021-10-14 07:57:15.897677+00	4	POCO X3 Pro 2	1	[{"added": {}}]	7	1
11	2021-10-14 07:57:36.087508+00	5	POCO X3 Pro 3	1	[{"added": {}}]	7	1
12	2021-10-14 07:57:52.474669+00	6	POCO X3 Pro 4	1	[{"added": {}}]	7	1
13	2021-10-14 07:58:03.214607+00	7	POCO X3 Pro 5	1	[{"added": {}}]	7	1
14	2021-10-14 07:58:12.115125+00	8	POCO X3 Pro 6	1	[{"added": {}}]	7	1
15	2021-10-14 07:58:13.783405+00	2	موبایل	1	[{"added": {}}, {"added": {"name": "product", "object": "\\u06af\\u0648\\u0634\\u06cc \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644 \\u0634\\u06cc\\u0627\\u0626\\u0648\\u0645\\u06cc \\u0645\\u062f\\u0644 POCO X3 Pro M2102J20SG"}}]	6	1
16	2021-10-14 09:21:49.96214+00	9	درباره معنی زندگی 1	1	[{"added": {}}]	7	1
17	2021-10-14 09:22:06.630853+00	10	درباره معنی زندگی 2	1	[{"added": {}}]	7	1
18	2021-10-14 09:22:10.447702+00	1	کتاب	2	[{"added": {"name": "product", "object": "\\u062f\\u0631\\u0628\\u0627\\u0631\\u0647 \\u0645\\u0639\\u0646\\u06cc \\u0632\\u0646\\u062f\\u06af\\u06cc"}}]	6	1
19	2021-10-14 09:24:13.315527+00	9	درباره معنی زندگی 1	2	[{"changed": {"fields": ["Image"]}}]	7	1
20	2021-10-14 09:24:21.061251+00	10	درباره معنی زندگی 2	2	[{"changed": {"fields": ["Image"]}}]	7	1
21	2021-10-14 09:25:28.2097+00	9	درباره معنی زندگی 1	2	[{"changed": {"fields": ["Image"]}}]	7	1
22	2021-10-14 09:25:57.30508+00	10	درباره معنی زندگی 2	3		7	1
23	2021-10-14 09:39:37.011295+00	1	شازده کوچولو1	2	[{"changed": {"fields": ["Image"]}}]	7	1
24	2021-10-14 09:40:31.399222+00	2	شازده کوچولو2	2	[{"changed": {"fields": ["Image"]}}]	7	1
25	2021-10-14 09:40:43.819487+00	1	شازده کوچولو1	2	[{"changed": {"fields": ["Image"]}}]	7	1
26	2021-10-14 09:44:08.425801+00	1	شازده کوچولو1	2	[{"changed": {"fields": ["Image"]}}]	7	1
27	2021-10-14 09:44:16.69644+00	2	شازده کوچولو2	2	[{"changed": {"fields": ["Image"]}}]	7	1
28	2021-10-14 09:44:39.940723+00	9	درباره معنی زندگی 1	2	[{"changed": {"fields": ["Image"]}}]	7	1
29	2021-10-14 09:50:42.968287+00	1	کتاب	2	[]	6	1
30	2021-10-14 09:55:48.93654+00	11	POCO M3 1	1	[{"added": {}}]	7	1
31	2021-10-14 09:56:02.037742+00	12	POCO M3 2	1	[{"added": {}}]	7	1
32	2021-10-14 09:56:13.532923+00	13	POCO M3 3	1	[{"added": {}}]	7	1
33	2021-10-14 09:56:34.763376+00	14	POCO M3 4	1	[{"added": {}}]	7	1
34	2021-10-14 09:56:36.992077+00	2	موبایل	2	[{"added": {"name": "product", "object": "\\u06af\\u0648\\u0634\\u06cc \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644 \\u0634\\u06cc\\u0627\\u0626\\u0648\\u0645\\u06cc \\u0645\\u062f\\u0644 POCO M3 M2010J19CG"}}]	6	1
35	2021-10-14 10:06:48.007977+00	15	Galaxy A32 SM-A325FDS 1	1	[{"added": {}}]	7	1
36	2021-10-14 10:07:01.595286+00	16	Galaxy A32 SM-A325FDS 2	1	[{"added": {}}]	7	1
37	2021-10-14 10:10:01.84031+00	17	Galaxy A32 SM-A325FDS 3	1	[{"added": {}}]	7	1
38	2021-10-14 10:10:55.391177+00	18	Galaxy A32 SM-A325FDS 4	1	[{"added": {}}]	7	1
39	2021-10-14 10:11:08.478666+00	19	Galaxy A32 SM-A325FDS 5	1	[{"added": {}}]	7	1
40	2021-10-14 10:11:21.340306+00	20	Galaxy A32 SM-A325FDS 6	1	[{"added": {}}]	7	1
41	2021-10-14 10:11:25.802521+00	2	موبایل	2	[{"added": {"name": "product", "object": "\\u06af\\u0648\\u0634\\u06cc \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644 \\u0633\\u0627\\u0645\\u0633\\u0648\\u0646\\u06af \\u0645\\u062f\\u0644 Galaxy A32 SM-A325F/DS"}}]	6	1
42	2021-10-14 10:14:42.407162+00	15	Galaxy A32 SM-A325FDS 1	2	[{"changed": {"fields": ["Image"]}}]	7	1
43	2021-10-14 10:33:14.348685+00	21	G20 TA-1365 1	1	[{"added": {}}]	7	1
44	2021-10-14 10:33:26.998612+00	22	G20 TA-1365 2	1	[{"added": {}}]	7	1
45	2021-10-14 10:33:39.529173+00	23	G20 TA-1365 3	1	[{"added": {}}]	7	1
46	2021-10-14 10:34:25.006972+00	2	موبایل	2	[{"added": {"name": "product", "object": "\\u06af\\u0648\\u0634\\u06cc \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644 \\u0646\\u0648\\u06a9\\u06cc\\u0627 \\u0645\\u062f\\u0644 G20 TA-1365"}}]	6	1
47	2021-10-14 10:40:27.835885+00	24	Galaxy S21 Ultra 1	1	[{"added": {}}]	7	1
48	2021-10-14 10:40:39.492383+00	25	Galaxy S21 Ultra 2	1	[{"added": {}}]	7	1
49	2021-10-14 10:40:56.469849+00	26	Galaxy S21 Ultra 3	1	[{"added": {}}]	7	1
50	2021-10-14 10:41:11.101116+00	27	Galaxy S21 Ultra 4	1	[{"added": {}}]	7	1
51	2021-10-14 10:41:21.753264+00	28	Galaxy S21 Ultra 5	1	[{"added": {}}]	7	1
52	2021-10-14 10:41:30.38975+00	29	Galaxy S21 Ultra 6	1	[{"added": {}}]	7	1
53	2021-10-14 10:41:32.022752+00	2	موبایل	2	[{"added": {"name": "product", "object": "\\u06af\\u0648\\u0634\\u06cc \\u0645\\u0648\\u0628\\u0627\\u06cc\\u0644 \\u0633\\u0627\\u0645\\u0633\\u0648\\u0646\\u06af \\u0645\\u062f\\u0644 Galaxy S21 Ultra 5G SM-G998B"}}]	6	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	products	category
7	products	productimage
8	products	product
9	customers	customer
10	customers	discountcode
11	customers	address
12	orders	orderitem
13	orders	order
14	authtoken	token
15	authtoken	tokenproxy
16	sites	site
17	allauth	socialapp
18	allauth	socialaccount
19	allauth	socialtoken
20	account	emailaddress
21	account	emailconfirmation
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-10-14 06:53:25.48939+00
2	contenttypes	0002_remove_content_type_name	2021-10-14 06:53:25.517382+00
3	auth	0001_initial	2021-10-14 06:53:25.630699+00
4	auth	0002_alter_permission_name_max_length	2021-10-14 06:53:25.639699+00
5	auth	0003_alter_user_email_max_length	2021-10-14 06:53:25.645703+00
6	auth	0004_alter_user_username_opts	2021-10-14 06:53:25.6527+00
7	auth	0005_alter_user_last_login_null	2021-10-14 06:53:25.659731+00
8	auth	0006_require_contenttypes_0002	2021-10-14 06:53:25.662699+00
9	auth	0007_alter_validators_add_error_messages	2021-10-14 06:53:25.668699+00
10	auth	0008_alter_user_username_max_length	2021-10-14 06:53:25.677701+00
11	auth	0009_alter_user_last_name_max_length	2021-10-14 06:53:25.685701+00
12	auth	0010_alter_group_name_max_length	2021-10-14 06:53:25.703702+00
13	auth	0011_update_proxy_permissions	2021-10-14 06:53:25.71373+00
14	auth	0012_alter_user_first_name_max_length	2021-10-14 06:53:25.7197+00
15	customers	0001_initial	2021-10-14 06:53:25.944737+00
16	account	0001_initial	2021-10-14 06:53:26.02774+00
17	account	0002_email_max_length	2021-10-14 06:53:26.03974+00
18	account	0003_auto_20210913_1219	2021-10-14 06:53:26.274135+00
19	admin	0001_initial	2021-10-14 06:53:26.336138+00
20	admin	0002_logentry_remove_auto_add	2021-10-14 06:53:26.348138+00
21	admin	0003_logentry_add_action_flag_choices	2021-10-14 06:53:26.361136+00
22	authtoken	0001_initial	2021-10-14 06:53:26.390143+00
23	authtoken	0002_auto_20160226_1747	2021-10-14 06:53:26.429136+00
24	authtoken	0003_tokenproxy	2021-10-14 06:53:26.435134+00
25	products	0001_initial	2021-10-14 06:53:26.535134+00
26	orders	0001_initial	2021-10-14 06:53:26.64614+00
27	sessions	0001_initial	2021-10-14 06:53:26.689135+00
28	sites	0001_initial	2021-10-14 06:53:26.709136+00
29	sites	0002_alter_domain_unique	2021-10-14 06:53:26.738136+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
riw1wxld8shchxzbcbv9va8osnhcggfh	.eJxVjDEOgzAMRe-SuYowIUnN2L1nQHZsCqUCicCEuHtBYmjX_95_m2loXbpmzTo3vZjagLn9bkxp0PEE8qbxNdk0jcvcsz0Ve9Fsn5Po53G5f4GOcne8C4SIHltyDpVLUIxctbGUKEiOfOtCUokl3QNDEvXCFVBRATooAuERZcqDLqbe9v0LlWc78g:1mayFm:jHdNicqqpIUiy0TYgXFGL5rUw4dHFShkIFPptvAua3Q	2021-10-28 10:46:26.797067+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: orders_order; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.orders_order (id, total_price, order_date, ref_code, delivery_status, address_id, user_id) FROM stdin;
\.


--
-- Data for Name: orders_order_products; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.orders_order_products (id, order_id, orderitem_id) FROM stdin;
\.


--
-- Data for Name: orders_orderitem; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.orders_orderitem (id, quantity, item_id) FROM stdin;
\.


--
-- Data for Name: products_category; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.products_category (id, title) FROM stdin;
1	کتاب
2	موبایل
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.products_product (id, title, price, description, seller, rate, count, status, category_id) FROM stdin;
3	درباره معنی زندگی	55000	روزی مردی به نزد ویل دورانت رفت و از او درخواست کرد دلیلی به دست او بدهد که چرا نباید خودکشی کند. دورانت در آن وقت محدود، جواب‌هایی به او داد ولی مدتی بعد، نامه‌ای برای بیش از صد شخصیت مشهور فرستاد و درباره معنی زندگی از آن‌ها نظر خواست و پاسخ‌های رسیده را به همراه دیدگاه خود، در این کتاب منتشر کرد.\r\n\r\nدورانت امید داشت پاسخ‌هایی که از چنین شخصیت‌های پرفروغی دریافت می‌کند، چیزی در خود داشته باشند که به پرسش آن بیگانه خوش‌لباسی که در یک روز پاییزی سال ۱۹۳۲ در باغش ظاهر شد، جوابی درخور بدهد. درواقع قضیه فراتر از این حرف‌ها بود؛ پاسخ‌ها بیش از آنکه تاریک و اندوهبار باشند، شوق‌انگیز و مثبت بودند که همراه بود با بصیرت‌هایی شخصی در اینکه چگونه باید زندگی را معنادارتر کرد. پاسخ‌ها از همه‌سو بودند؛ کسانی چون گاندی، جواهر لعل نهرو، تئودور درایزر نویسنده ناتورالیست، سینکلر لوئیس برنده نوبل ادبیات، جان ارسکین رمان‌نویس، آندره موروئا فیلسوف و رمان‌نویس، جورج برنارد شاو نمایشنامه‌نویس، برتراند راسل فیلسوف، جینا لومبروسو تنیس‌باز شهیر، سی. وی. رامان برنده نوبل فیزیک و شخصیت‌های دیگر.\r\n\r\nبه محض اینکه پاسخ نامه‌ها به دست ویل دورانت رسید، او سراغ خودش رفت و پاسخی جلوی همه پرسش‌هایش گذاشت که خود یک اثر فلسفی والا بود. دورانت نام کتاب را «درباره معنی زندگی» گذاشت و یک موسسه انتشاراتی کوچک آن را در سال ۱۹۳۲ چاپ کرد. کتابی است واقع‌بین، جسور و دربردارنده نگاه‌های متفاوت نویسندگان، شاعران، سیاستمداران و... به موضوع زندگی.	بازار	4	15	t	1
1	شازده کوچولو	25500	داستان کتاب شازده کوچولو درباره‌ی ملاقات خلبانی با یک موجود کوچولوی دوست داشتنی است. این خلبان همان نویسنده‌ ی کتاب آنتوان سنت اگزوپری است، او در یکی از سفرهایش به آفریقا، در صحرای آفریقا سقوط می‌کند و در آن‌جا شازده کوچولو را ملاقات می‌کند. داستان شاعرانه و عاشقانه شازده کوچولو از جایی شروع می‌شود که در سیاره‌ ب 612 که سیاره‌ی شازده کوچولو است گیاهی متفاوت در بین علف‌ها رشد می‌کند. گلی که در این داستان نقش معشوق را بازی می‌کند. شازده کوچولو که عاشق گل سرخ می‌شود در مسیر سفر قرار می‌گیرد، سفری که در جست و جوی دوست به زمین می‌رسد.  شازده کوچولو در سفرش با ساکنان هفت سیارک همنشین می‌شود و از آدم‌های هر سیاره حقیقت‌هایی درباره‌ی زندگی می‌آموزد.\r\n\r\nاگرچه عمر اگزوپری کم بود و از چهل و چهار تجاوز نکرد اما همین فرصت کوتاه باعث شد تا او آثار ارزشمندی مثل: «هوانورد»، «زمین انسان‌ها»، «نامه یک گروگان»و «پرواز شبانه» را از خود به جا بگذارد. اگزوپری، نه تنها خلبانی شجاع، وطن‌پرست و مبارزی ضدفاشیسم بود بلکه تجربه‌های زندگی‌اش به عنوان خلبان در رمان‌ها و داستان‌های لطیف و خیال‌انگیز  او منعکس شده است.	بازار	5	20	t	1
4	گوشی موبایل شیائومی مدل POCO M3 M2010J19CG	4649000	گوشی موبایل شیائومی مدل POCO M3 M2010J19CG دو سیم‌ کارت ظرفیت 128 گیگابایت از جمله اولین سری محصولات برند شیائومی است. این محصول دارای ساختاری متوازن و خوش‌ساخت بدون پشتیبانی از تکنولوژی 5G در تاریخ نوامبر 2020 روانه بازار شده است. این محصول از فریم پلاستیکی ساخته شده است که قاب جلو شیشه‌ای جلوه ویژه‌ای به این مدل بخشیده است. صفحه‌نمایش گوشی موبایل شیائومی مدل POCO M3 M2010J19CG دو سیم‌ کارت ظرفیت 128 گیگابایت در اندازه 6.53 منتشر شده است. این صفحه‌نمایش کاملاً تمام‌صفحه است و در بالا وسط اثری از بریدگی یا حفره دوربین سلفی وجود دیده می‌شود. دوربین سلفی این محصول دارای حسگر 8 مگاپیکسلی است .صحفه‌نمایش گوشی موبایل شیائومی مدل POCO M3 M2010J19CG با استفاده از فناوری Corning Gorilla Glass 3 در برابر خط‌وخش و صدمات احتمالی محافظت می‌شود. ویژگی دیگر Poco M3 مجهز شدن به حسگر اثرانگشت در زیر کنار گوشی که نشان از بالارده بودن محصول دارد. گفتنی است ۳ دوربین که سنسور اصلی آن 48 مگاپیکسلی است در قسمت پشتی این گوشی جا خوش کرده‌اند. این دوربین‌ها قادر هستند ویدئوی Full HD را ثبت و ضبط کنند. دوربین‌ سلفی این محصول هم به سنسوری 8 مگاپیکسلی مجهز شده است. بلوتوث نسخه 5.0، نسخه 10 سیستم عامل اندروید و باتری شگفت‌انگیز 6000 میلی‌آمپرساعتی از دیگر ویژگی‌‌های این گوشی موبایل شیائومی جدید هستند. گوشی موبایل شیائومی مدل POCO M3 M2010J19CG دو سیم‌ کارت ظرفیت 128 گیگابایت دارای قابلیت reverse charging است. شارژ معکوس یا همون (reverse charging) ویژگی است که به شما این امکان را می‌دهد که از تلفن خود برای شارژ دستگاه‌های دیگر مانند تلفن‌های هوشمند، ساعت‌های هوشمند و باندهای هوشمندی که از شارژ بی‌سیم پشتیبانی می‌کنند، استفاده کنید. برای اینکه بتوانید آنها را به‌صورت بی‌سیم شارژ کنید، دستگاه شما باید از پروتکل شارژ بی‌سیم Qi پشتیبانی کند.	بازار	3	10	t	2
2	گوشی موبایل شیائومی مدل POCO X3 Pro M2102J20SG	6066000	گوشی موبایل شیائومی مدل Poco X3 Pro دو سیم‌ کارت ظرفیت 128 گیگابایت از جمله محصولات برند شیائومی که در سال 2021 روانه بازار شده است. این محصول دارای ساختاری متوازن و خوش‌ساخت بدون پشتیبانی از تکنولوژی 5G روانه بازار شده است. این محصول از بدنه پلاستیکی ساخته شده است که قاب جلو شیشه‌ای جلوه ویژه‌ای به این مدل بخشیده است. صفحه‌نمایش گوشی موبایل شیائومی مدل POCO X3 Pro دو سیم‌ کارت ظرفیت 128 گیگابایت در اندازه 6.67 منتشر شده است. این صفحه‌نمایش کاملاً تمام‌صفحه است و در بالا وسط اثری از بریدگی یا حفره دوربین سلفی وجود دیده می‌شود. دوربین سلفی این محصول دارای حسگر 20 مگاپیکسلی است .صحفه‌نمایش گوشی موبایل شیائومی مدل POCO X3 با استفاده از فناوری Corning Gorilla Glass 6 در برابر خط‌وخش و صدمات احتمالی محافظت می‌شود. گفتنی است چهار دوربین که سنسور اصلی آن 48 مگاپیکسلی است در قسمت پشتی این گوشی جا خوش کرده‌اند. این دوربین‌ها قادر هستند ویدئوی 4K را ثبت و ضبط کنند. دوربین‌ سلفی این محصول هم به سنسوری 20 مگاپیکسلی مجهز شده است. بلوتوث نسخه 5.0، نسخه 11 سیستم عامل اندروید و باتری 5160 میلی‌آمپرساعتی از دیگر ویژگی‌‌های این گوشی جدید هستند.	بازار	4	35	t	2
5	گوشی موبایل سامسونگ مدل Galaxy A32 SM-A325F/DS	7062000	گوشی موبایل Galaxy A32 با رم 6 گیگابایتی و حافظه داخلی 128گیگابایت روانه بازار شده است. این محصول دارای صفحه‌نمایش سوپر امولد است و ظاهر زیبایی دارد. سامسونگ تلاش کرده است حاشیه را در این تولید جدید خود تا حد امکان کم کند. این گوشی قاب پشتی از جنس پلاستیک دارد و قاب جلویی آن را شیشه پوشانده که البته جلوه‌ی زیبایی به گوشی داده است. این محصول سامسونگ با نسخه 11 از سیستم‌عامل اندروید روانه بازار شده است تا از هر نظر گوشی مدرن به‌حساب بیاید. صفحه‌نمایش استفاده‌شده در این گوشی 6.4 اینچی است که با استفاده از پنل Super AMOLED تصاویر شفاف و زنده‌ای را به نمایش می‌گذارد. این صفحه‌نمایش در هر اینچ 411 پیکسل را نشان می‌دهد. تراشه‌ی این محصول، Mediatek Helio G80 از تراشه‌های 12 نانومتری شرکت مدیاتک است که به همراه 6 گیگابایت رم عرضه می‌شود. تراشه‌ی گرافیکی Mali-G52 MC2 هم برای پخش ویدئو و بازی مناسب است. این نسخه از گوشی با حافظه 128گیگابایتی عرضه شده است و با استفاده از یک کارت حافظه‌ی جانبی قادر خواهید بود حافظه داخلی را باز هم افزایش دهید. دوربین اصلی A32 سنسور 64 مگاپیکسلی دارد و از نوع عریض (Wide) است. یک سنسور 8 مگاپیکسلی و دو سنسور 5 مگاپیکسلی دیگر هم در کنار این دوربین اصلی مجموعه دوربین‌های قاب پشتی A32 را تشکیل داده‌اند. دوربین سلفی 20 مگاپیکسلی هم در قاب جلویی این گوشی به کار گرفته شده است. باتری 5000 میلی‌آمپرساعتی، پشتیبانی از فناوری شارژ سریع 15 واتی، درگاه USB Type-C و حسگر اثرانگشت هم از دیگر ویژگی‌های این تازه‌وارد است. سامسونگ در ساخت این گوشی از جدیدترین فناوری‌های ساخت گوشی استفاده کرده است تا میان‌رده‌ای با باند ارتباطی مدرن و عمر طولانی باتری روانه بازار کند.	بازار	4	18	t	2
6	گوشی موبایل نوکیا مدل G20 TA-1365	4070000	گوشی موبایل نوکیا مدل G20 دو سیم‌ کارت ظرفیت 128 گیگابایت از سری گوشی‌های باکیفیت این برند است که می‌تواند تمامی اکثر نیازهای ما مانند وب‌گردی، بازی آفلاین و آنلاین، تماشای فیلم و کلیپ، شبکه‌های اجتماعی، کار با اپلیکیشن و بسیاری دیگر را انجام دهید. گفتنی است که این گوشی با تمامی قابلیت‌هایی که دارد، یک گوشی میان‌رده است. مهندسان نوکیا برای گوشی G20 باتری لیتیوم-یونی با ظرفیت 5050 میلی‌آمپرساعت در نظر گرفته‌اند که باتوجه به ظرفیت آن، عمر مطلوبی هم دارد. که نشان دهنده ظرفیت مناسب این گوشی میان‌رده است. از این گوشی می‌توانید استفاده‌های بسیار متنوع و باکیفیتی در عکاسی داشته باشید. پردازنده مرکزی (CPU) و پردازنده گرافیکی (GPU) این گوشی به‌اندازه‌ای قدرت دارند که می‌توانید بدون هیچ‌گونه دغدغه و کاهش سرعت برنامه‌های متوسط و اجتماعی را اجرا کنید. این گوشی دارای 128 گیگابایت حافظه داخلی و 4 گیگابایت حافظه RAM رم است. گوشی نوکیا G20 دارای دوربین چهارگانه در پشت گوشی بوده که با کیفیت‌های ۴۸،۵،۲ و ۲ مگاپیکسل است. دوربین عکاسی سلفی نوکیا G20 دارای لنزی با رزولوشن ۸ مگاپیکسل است که تصاویر مطلوبی برای استفاده در شبکه‌های اجتماعی و ویدئوهای رضایت‌بخشی برای مکالمه تصویری ایجاد می‌کند.	بازار	4	33	t	2
7	گوشی موبایل سامسونگ مدل Galaxy S21 Ultra 5G SM-G998B	28599000	خبری از شیار کارت حافظه نیست. حتی خبری از شارژر در جعبه محصول نیست. شاید این ویژگی‌ها قبل از هر چیز دیگری در زمان دیدن جدول مشخصات گوشی موبایل Galaxy S21 Ultra جلب توجه می‌کنند. البته بزرگ‌نمایی 10 برابری اپتیکال و 100 برابری دیجیتالی هم نکاتی هستند که نمی‌توانید از آن‌ها به سادگی رد شوید. در سال 2021، سری گوشی‌های Galaxy S زودتر از هر سال روانه بازار شد. این سری این بار با خود ویژگی‌های جدیدی را هم به همراه داشت. گوشی موبایل Galaxy S21 Ultra جای همه کم‌وکاستی‌های نسل خود را پر کرده است. صفحه‌نمایشی با نرخ به‌روزرسانی 120هرتز بیشتر از هر چیز کنایه‌ای پرمعنا به اپل است تا زمانی که در کنار باتری حجیم 5000 میلی‌آمپرساعتی قرار می‌گیرد، نوید یکی از غول‌های دنیای فناوری اطلاعات را با خود دارد. این گوشی اولین محصول سری S است که از قلم S-Pen هم پشتیبانی می‌کند. البته جای هیچ تعجبی نیست که باید این قلم را جداگانه تهیه کنید. رنگ‌ مات و جذاب بدنه گلکسی اس 21 اولترا هم در کنار لبه‌های خمیده گوشی، ویژگی‌های جدید ظاهری این محصول به حساب می‌آیند. پس اگر به دنبال محصولی جدید و قدرتمند با امکان زوم فضایی هستید، به این گوشی فکر کنید. به نظر می‌رسد این ویژگی‌های S21، نوید سال پرهیجان و پر از محصولات عجیب‌وغریب و جذاب را در حوزه گوشی موبایل به همراه دارند. اما مهم‌تر از همه با حذف شارژر از طرف اپل، سامسونگ و شیائومی، برای این شرکت‌ها، 2021 سال فروش لوازم جانبی است.	بازار	5	50	t	2
\.


--
-- Data for Name: products_product_image; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.products_product_image (id, product_id, productimage_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	2	4
5	2	5
6	2	6
7	2	7
8	2	8
9	3	9
11	4	11
12	4	12
13	4	13
14	4	14
15	5	15
16	5	16
17	5	17
18	5	18
19	5	19
20	5	20
21	6	21
22	6	22
23	6	23
24	7	24
25	7	25
26	7	26
27	7	27
28	7	28
29	7	29
\.


--
-- Data for Name: products_productimage; Type: TABLE DATA; Schema: public; Owner: efi
--

COPY public.products_productimage (id, name, image) FROM stdin;
3	POCO X3 Pro 1	static/img/products_image/caa4e7d9543637cf8921b67f26803827c864e269_1618917760.jpg
4	POCO X3 Pro 2	static/img/products_image/c0bc53693858a4d9c21911882dd43fdccd888b26_1618918676.jpg
5	POCO X3 Pro 3	static/img/products_image/3142b2c673ba6dbaa7bc68fd48b1ad6d98435597_1618917746.jpg
6	POCO X3 Pro 4	static/img/products_image/24ce8cf4e027e0b441e79304a3a83488fd0b8ef0_1618918683.jpg
7	POCO X3 Pro 5	static/img/products_image/8a60e1c5117e45dbfb9e7b812317dc8021fc907c_1630403488.jpg
8	POCO X3 Pro 6	static/img/products_image/7cc5d6a64fd4aba6368ea70535774f876e977dbb_1618918681.jpg
1	شازده کوچولو1	static/img/products_image/160460.jpg
2	شازده کوچولو2	static/img/products_image/160533.jpg
9	درباره معنی زندگی 1	static/img/products_image/2jpg.jpg
11	POCO M3 1	static/img/products_image/POCO_M3_1.jpg
12	POCO M3 2	static/img/products_image/POCO_M3_2.jpg
13	POCO M3 3	static/img/products_image/POCO_M3_3.jpg
14	POCO M3 4	static/img/products_image/POCO_M3_4.jpg
16	Galaxy A32 SM-A325FDS 2	static/img/products_image/Galaxy_A32_SM-A325FDS_2.jpg
17	Galaxy A32 SM-A325FDS 3	static/img/products_image/Galaxy_A32_SM-A325FDS_3.jpg
18	Galaxy A32 SM-A325FDS 4	static/img/products_image/Galaxy_A32_SM-A325FDS_4.jpg
19	Galaxy A32 SM-A325FDS 5	static/img/products_image/Galaxy_A32_SM-A325FDS_5.jpg
20	Galaxy A32 SM-A325FDS 6	static/img/products_image/Galaxy_A32_SM-A325FDS_6.jpg
15	Galaxy A32 SM-A325FDS 1	static/img/products_image/Galaxy_A32_SM-A325FDS_1.jpg
21	G20 TA-1365 1	static/img/products_image/G20_TA-1365_1.jpg
22	G20 TA-1365 2	static/img/products_image/G20_TA-1365_2.jpg
23	G20 TA-1365 3	static/img/products_image/G20_TA-1365_3.jpg
24	Galaxy S21 Ultra 1	static/img/products_image/Galaxy_S21_Ultra_1.jpg
25	Galaxy S21 Ultra 2	static/img/products_image/Galaxy_S21_Ultra_2.jpg
26	Galaxy S21 Ultra 3	static/img/products_image/Galaxy_S21_Ultra_3.jpg
27	Galaxy S21 Ultra 4	static/img/products_image/Galaxy_S21_Ultra_4.jpg
28	Galaxy S21 Ultra 5	static/img/products_image/Galaxy_S21_Ultra_5.jpg
29	Galaxy S21 Ultra 6	static/img/products_image/Galaxy_S21_Ultra_6.jpg
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);


--
-- Name: customers_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.customers_address_id_seq', 1, false);


--
-- Name: customers_customer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.customers_customer_groups_id_seq', 1, false);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, true);


--
-- Name: customers_customer_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.customers_customer_user_permissions_id_seq', 1, false);


--
-- Name: customers_discountcode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.customers_discountcode_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 53, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- Name: orders_order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.orders_order_products_id_seq', 1, false);


--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.orders_orderitem_id_seq', 1, false);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.products_category_id_seq', 2, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.products_product_id_seq', 7, true);


--
-- Name: products_product_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.products_product_image_id_seq', 29, true);


--
-- Name: products_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: efi
--

SELECT pg_catalog.setval('public.products_productimage_id_seq', 29, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: customers_address customers_address_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_address
    ADD CONSTRAINT customers_address_pkey PRIMARY KEY (id);


--
-- Name: customers_customer customers_customer_email_key; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer
    ADD CONSTRAINT customers_customer_email_key UNIQUE (email);


--
-- Name: customers_customer_groups customers_customer_groups_customer_id_group_id_83eb0e0e_uniq; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_groups_customer_id_group_id_83eb0e0e_uniq UNIQUE (customer_id, group_id);


--
-- Name: customers_customer_groups customers_customer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_groups_pkey PRIMARY KEY (id);


--
-- Name: customers_customer customers_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer
    ADD CONSTRAINT customers_customer_pkey PRIMARY KEY (id);


--
-- Name: customers_customer_user_permissions customers_customer_user__customer_id_permission_i_cd47699c_uniq; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_user__customer_id_permission_i_cd47699c_uniq UNIQUE (customer_id, permission_id);


--
-- Name: customers_customer_user_permissions customers_customer_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: customers_discountcode customers_discountcode_code_key; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_discountcode
    ADD CONSTRAINT customers_discountcode_code_key UNIQUE (code);


--
-- Name: customers_discountcode customers_discountcode_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_discountcode
    ADD CONSTRAINT customers_discountcode_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: orders_order orders_order_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);


--
-- Name: orders_order_products orders_order_products_order_id_orderitem_id_fa7f4867_uniq; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_order_products
    ADD CONSTRAINT orders_order_products_order_id_orderitem_id_fa7f4867_uniq UNIQUE (order_id, orderitem_id);


--
-- Name: orders_order_products orders_order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_order_products
    ADD CONSTRAINT orders_order_products_pkey PRIMARY KEY (id);


--
-- Name: orders_orderitem orders_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);


--
-- Name: products_product_image products_product_image_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_product_image
    ADD CONSTRAINT products_product_image_pkey PRIMARY KEY (id);


--
-- Name: products_product_image products_product_image_product_id_productimage_id_0f3ea97f_uniq; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_product_image
    ADD CONSTRAINT products_product_image_product_id_productimage_id_0f3ea97f_uniq UNIQUE (product_id, productimage_id);


--
-- Name: products_product products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_productimage products_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimage_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: customers_address_user_id_8fee2cf6; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX customers_address_user_id_8fee2cf6 ON public.customers_address USING btree (user_id);


--
-- Name: customers_customer_email_300e404b_like; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX customers_customer_email_300e404b_like ON public.customers_customer USING btree (email varchar_pattern_ops);


--
-- Name: customers_customer_groups_customer_id_39e075d7; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX customers_customer_groups_customer_id_39e075d7 ON public.customers_customer_groups USING btree (customer_id);


--
-- Name: customers_customer_groups_group_id_f079b2be; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX customers_customer_groups_group_id_f079b2be ON public.customers_customer_groups USING btree (group_id);


--
-- Name: customers_customer_user_permissions_customer_id_39cf3cb6; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX customers_customer_user_permissions_customer_id_39cf3cb6 ON public.customers_customer_user_permissions USING btree (customer_id);


--
-- Name: customers_customer_user_permissions_permission_id_36492949; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX customers_customer_user_permissions_permission_id_36492949 ON public.customers_customer_user_permissions USING btree (permission_id);


--
-- Name: customers_discountcode_code_cbe6cb11_like; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX customers_discountcode_code_cbe6cb11_like ON public.customers_discountcode USING btree (code varchar_pattern_ops);


--
-- Name: customers_discountcode_user_id_e423ee75; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX customers_discountcode_user_id_e423ee75 ON public.customers_discountcode USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: orders_order_address_id_0daf897b; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX orders_order_address_id_0daf897b ON public.orders_order USING btree (address_id);


--
-- Name: orders_order_products_order_id_8e4486fb; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX orders_order_products_order_id_8e4486fb ON public.orders_order_products USING btree (order_id);


--
-- Name: orders_order_products_orderitem_id_50a8780b; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX orders_order_products_orderitem_id_50a8780b ON public.orders_order_products USING btree (orderitem_id);


--
-- Name: orders_order_user_id_e9b59eb1; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX orders_order_user_id_e9b59eb1 ON public.orders_order USING btree (user_id);


--
-- Name: orders_orderitem_item_id_0f65da43; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX orders_orderitem_item_id_0f65da43 ON public.orders_orderitem USING btree (item_id);


--
-- Name: products_product_category_id_9b594869; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX products_product_category_id_9b594869 ON public.products_product USING btree (category_id);


--
-- Name: products_product_image_product_id_8cf167bc; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX products_product_image_product_id_8cf167bc ON public.products_product_image USING btree (product_id);


--
-- Name: products_product_image_productimage_id_32662d2c; Type: INDEX; Schema: public; Owner: efi
--

CREATE INDEX products_product_image_productimage_id_32662d2c ON public.products_product_image USING btree (productimage_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_customers_customer_id FOREIGN KEY (user_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirmation_email_address_id_5b7f8c58_fk; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_email_address_id_5b7f8c58_fk FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_customers_customer_id FOREIGN KEY (user_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_address customers_address_user_id_8fee2cf6_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_address
    ADD CONSTRAINT customers_address_user_id_8fee2cf6_fk_customers_customer_id FOREIGN KEY (user_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_groups customers_customer_g_customer_id_39e075d7_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_g_customer_id_39e075d7_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_groups customers_customer_groups_group_id_f079b2be_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_groups_group_id_f079b2be_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_user_permissions customers_customer_u_customer_id_39cf3cb6_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_u_customer_id_39cf3cb6_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_user_permissions customers_customer_u_permission_id_36492949_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_u_permission_id_36492949_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_discountcode customers_discountco_user_id_e423ee75_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.customers_discountcode
    ADD CONSTRAINT customers_discountco_user_id_e423ee75_fk_customers FOREIGN KEY (user_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_customers_customer_id FOREIGN KEY (user_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_address_id_0daf897b_fk_customers_address_id; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_address_id_0daf897b_fk_customers_address_id FOREIGN KEY (address_id) REFERENCES public.customers_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order_products orders_order_product_orderitem_id_50a8780b_fk_orders_or; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_order_products
    ADD CONSTRAINT orders_order_product_orderitem_id_50a8780b_fk_orders_or FOREIGN KEY (orderitem_id) REFERENCES public.orders_orderitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order_products orders_order_products_order_id_8e4486fb_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_order_products
    ADD CONSTRAINT orders_order_products_order_id_8e4486fb_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_user_id_e9b59eb1_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_user_id_e9b59eb1_fk_customers_customer_id FOREIGN KEY (user_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderitem orders_orderitem_item_id_0f65da43_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_item_id_0f65da43_fk_products_product_id FOREIGN KEY (item_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product products_product_category_id_9b594869_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_category_id_9b594869_fk_products_category_id FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_image products_product_ima_product_id_8cf167bc_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_product_image
    ADD CONSTRAINT products_product_ima_product_id_8cf167bc_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_image products_product_ima_productimage_id_32662d2c_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: efi
--

ALTER TABLE ONLY public.products_product_image
    ADD CONSTRAINT products_product_ima_productimage_id_32662d2c_fk_products_ FOREIGN KEY (productimage_id) REFERENCES public.products_productimage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

