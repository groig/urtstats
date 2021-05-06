--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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
-- Name: aliases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aliases (
    id integer NOT NULL,
    num_used integer DEFAULT 0 NOT NULL,
    alias character varying(32) DEFAULT ''::character varying NOT NULL,
    client_id integer DEFAULT 0 NOT NULL,
    time_add integer DEFAULT 0 NOT NULL,
    time_edit integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.aliases OWNER TO postgres;

--
-- Name: aliases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aliases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aliases_id_seq OWNER TO postgres;

--
-- Name: aliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aliases_id_seq OWNED BY public.aliases.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    ip character varying(16) DEFAULT ''::character varying NOT NULL,
    connections integer DEFAULT 0 NOT NULL,
    guid character varying(36) DEFAULT ''::character varying NOT NULL,
    pbid character varying(32) DEFAULT ''::character varying NOT NULL,
    name character varying(32) DEFAULT ''::character varying NOT NULL,
    auto_login smallint DEFAULT '0'::smallint NOT NULL,
    mask_level smallint DEFAULT '0'::smallint NOT NULL,
    group_bits integer DEFAULT 0 NOT NULL,
    greeting character varying(128) DEFAULT ''::character varying NOT NULL,
    time_add integer DEFAULT 0 NOT NULL,
    time_edit integer DEFAULT 0 NOT NULL,
    password character varying(32) DEFAULT NULL::character varying,
    login character varying(16) DEFAULT NULL::character varying
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: cmdgrants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cmdgrants (
    id integer NOT NULL,
    commands text NOT NULL
);


ALTER TABLE public.cmdgrants OWNER TO postgres;

--
-- Name: cmdgrants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cmdgrants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cmdgrants_id_seq OWNER TO postgres;

--
-- Name: cmdgrants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cmdgrants_id_seq OWNED BY public.cmdgrants.id;


--
-- Name: ctime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ctime (
    id integer NOT NULL,
    guid character varying(36) NOT NULL,
    came character varying(11) DEFAULT NULL::character varying,
    gone character varying(11) DEFAULT NULL::character varying,
    nick character varying(32) NOT NULL
);


ALTER TABLE public.ctime OWNER TO postgres;

--
-- Name: ctime_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ctime_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ctime_id_seq OWNER TO postgres;

--
-- Name: ctime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ctime_id_seq OWNED BY public.ctime.id;


--
-- Name: current_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_clients (
    id integer NOT NULL,
    updated character varying(25) NOT NULL,
    name character varying(32) NOT NULL,
    level integer NOT NULL,
    dbid integer NOT NULL,
    cid character varying(32) NOT NULL,
    joined character varying(25) NOT NULL,
    connections integer NOT NULL,
    state smallint NOT NULL,
    score integer NOT NULL,
    ip character varying(16) NOT NULL,
    guid character varying(36) NOT NULL,
    pbid character varying(32) NOT NULL,
    team smallint NOT NULL,
    colorname character varying(32) NOT NULL
);


ALTER TABLE public.current_clients OWNER TO postgres;

--
-- Name: current_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_clients_id_seq OWNER TO postgres;

--
-- Name: current_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_clients_id_seq OWNED BY public.current_clients.id;


--
-- Name: current_svars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.current_svars (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.current_svars OWNER TO postgres;

--
-- Name: current_svars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.current_svars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.current_svars_id_seq OWNER TO postgres;

--
-- Name: current_svars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.current_svars_id_seq OWNED BY public.current_svars.id;


--
-- Name: data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data (
    data_key character varying(255) NOT NULL,
    data_value character varying(255) NOT NULL
);


ALTER TABLE public.data OWNER TO postgres;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(32) DEFAULT ''::character varying NOT NULL,
    keyword character varying(32) DEFAULT ''::character varying NOT NULL,
    level integer DEFAULT 0 NOT NULL,
    time_edit integer DEFAULT date_part('epoch'::text, CURRENT_TIMESTAMP) NOT NULL,
    time_add integer DEFAULT date_part('epoch'::text, CURRENT_TIMESTAMP) NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: ipaliases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ipaliases (
    id integer NOT NULL,
    num_used integer DEFAULT 0 NOT NULL,
    ip character varying(16) NOT NULL,
    client_id integer DEFAULT 0 NOT NULL,
    time_add integer DEFAULT 0 NOT NULL,
    time_edit integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.ipaliases OWNER TO postgres;

--
-- Name: ipaliases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ipaliases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipaliases_id_seq OWNER TO postgres;

--
-- Name: ipaliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ipaliases_id_seq OWNED BY public.ipaliases.id;


--
-- Name: penalties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.penalties (
    id integer NOT NULL,
    type character varying(16) DEFAULT 'Ban'::character varying NOT NULL,
    client_id integer DEFAULT 0 NOT NULL,
    admin_id integer DEFAULT 0 NOT NULL,
    duration integer DEFAULT 0 NOT NULL,
    inactive smallint DEFAULT '0'::smallint NOT NULL,
    keyword character varying(16) DEFAULT ''::character varying NOT NULL,
    reason character varying(255) DEFAULT ''::character varying NOT NULL,
    data character varying(255) DEFAULT ''::character varying NOT NULL,
    time_add integer DEFAULT 0 NOT NULL,
    time_edit integer DEFAULT 0 NOT NULL,
    time_expire integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.penalties OWNER TO postgres;

--
-- Name: penalties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.penalties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.penalties_id_seq OWNER TO postgres;

--
-- Name: penalties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.penalties_id_seq OWNED BY public.penalties.id;


--
-- Name: xlr_actionstats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_actionstats (
    id integer NOT NULL,
    name character varying(26) DEFAULT ''::character varying NOT NULL,
    count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.xlr_actionstats OWNER TO postgres;

--
-- Name: xlr_actionstats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_actionstats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_actionstats_id_seq OWNER TO postgres;

--
-- Name: xlr_actionstats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_actionstats_id_seq OWNED BY public.xlr_actionstats.id;


--
-- Name: xlr_bodyparts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_bodyparts (
    id integer NOT NULL,
    name character varying(25) DEFAULT ''::character varying NOT NULL,
    kills integer DEFAULT 0 NOT NULL,
    teamkills smallint DEFAULT '0'::smallint NOT NULL,
    suicides smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.xlr_bodyparts OWNER TO postgres;

--
-- Name: xlr_bodyparts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_bodyparts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_bodyparts_id_seq OWNER TO postgres;

--
-- Name: xlr_bodyparts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_bodyparts_id_seq OWNED BY public.xlr_bodyparts.id;


--
-- Name: xlr_history_monthly; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_history_monthly (
    id integer NOT NULL,
    client_id integer DEFAULT 0 NOT NULL,
    kills integer DEFAULT 0 NOT NULL,
    deaths integer DEFAULT 0 NOT NULL,
    teamkills smallint DEFAULT '0'::smallint NOT NULL,
    teamdeaths smallint DEFAULT '0'::smallint NOT NULL,
    suicides smallint DEFAULT '0'::smallint NOT NULL,
    ratio double precision DEFAULT '0'::double precision NOT NULL,
    skill double precision DEFAULT '0'::double precision NOT NULL,
    assists integer DEFAULT 0 NOT NULL,
    assistskill double precision DEFAULT '0'::double precision NOT NULL,
    winstreak smallint DEFAULT '0'::smallint NOT NULL,
    losestreak smallint DEFAULT '0'::smallint NOT NULL,
    rounds smallint DEFAULT '0'::smallint NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    week integer NOT NULL,
    day integer NOT NULL
);


ALTER TABLE public.xlr_history_monthly OWNER TO postgres;

--
-- Name: xlr_history_monthly_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_history_monthly_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_history_monthly_id_seq OWNER TO postgres;

--
-- Name: xlr_history_monthly_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_history_monthly_id_seq OWNED BY public.xlr_history_monthly.id;


--
-- Name: xlr_history_weekly; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_history_weekly (
    id integer NOT NULL,
    client_id integer DEFAULT 0 NOT NULL,
    kills integer DEFAULT 0 NOT NULL,
    deaths integer DEFAULT 0 NOT NULL,
    teamkills smallint DEFAULT '0'::smallint NOT NULL,
    teamdeaths smallint DEFAULT '0'::smallint NOT NULL,
    suicides smallint DEFAULT '0'::smallint NOT NULL,
    ratio double precision DEFAULT '0'::double precision NOT NULL,
    skill double precision DEFAULT '0'::double precision NOT NULL,
    assists integer DEFAULT 0 NOT NULL,
    assistskill double precision DEFAULT '0'::double precision NOT NULL,
    winstreak smallint DEFAULT '0'::smallint NOT NULL,
    losestreak smallint DEFAULT '0'::smallint NOT NULL,
    rounds smallint DEFAULT '0'::smallint NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    week integer NOT NULL,
    day integer NOT NULL
);


ALTER TABLE public.xlr_history_weekly OWNER TO postgres;

--
-- Name: xlr_history_weekly_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_history_weekly_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_history_weekly_id_seq OWNER TO postgres;

--
-- Name: xlr_history_weekly_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_history_weekly_id_seq OWNED BY public.xlr_history_weekly.id;


--
-- Name: xlr_mapstats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_mapstats (
    id integer NOT NULL,
    name character varying(25) DEFAULT ''::character varying NOT NULL,
    kills integer DEFAULT 0 NOT NULL,
    teamkills smallint DEFAULT '0'::smallint NOT NULL,
    suicides smallint DEFAULT '0'::smallint NOT NULL,
    rounds smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.xlr_mapstats OWNER TO postgres;

--
-- Name: xlr_mapstats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_mapstats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_mapstats_id_seq OWNER TO postgres;

--
-- Name: xlr_mapstats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_mapstats_id_seq OWNED BY public.xlr_mapstats.id;


--
-- Name: xlr_opponents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_opponents (
    id integer NOT NULL,
    target_id smallint DEFAULT '0'::smallint NOT NULL,
    killer_id smallint DEFAULT '0'::smallint NOT NULL,
    kills smallint DEFAULT '0'::smallint NOT NULL,
    retals smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.xlr_opponents OWNER TO postgres;

--
-- Name: xlr_opponents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_opponents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_opponents_id_seq OWNER TO postgres;

--
-- Name: xlr_opponents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_opponents_id_seq OWNED BY public.xlr_opponents.id;


--
-- Name: xlr_playeractions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_playeractions (
    id integer NOT NULL,
    action_id smallint DEFAULT '0'::smallint NOT NULL,
    player_id smallint DEFAULT '0'::smallint NOT NULL,
    count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.xlr_playeractions OWNER TO postgres;

--
-- Name: xlr_playeractions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_playeractions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_playeractions_id_seq OWNER TO postgres;

--
-- Name: xlr_playeractions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_playeractions_id_seq OWNED BY public.xlr_playeractions.id;


--
-- Name: xlr_playerbody; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_playerbody (
    id integer NOT NULL,
    bodypart_id smallint DEFAULT '0'::smallint NOT NULL,
    player_id smallint DEFAULT '0'::smallint NOT NULL,
    kills integer DEFAULT 0 NOT NULL,
    deaths integer DEFAULT 0 NOT NULL,
    teamkills smallint DEFAULT '0'::smallint NOT NULL,
    teamdeaths smallint DEFAULT '0'::smallint NOT NULL,
    suicides smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.xlr_playerbody OWNER TO postgres;

--
-- Name: xlr_playerbody_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_playerbody_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_playerbody_id_seq OWNER TO postgres;

--
-- Name: xlr_playerbody_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_playerbody_id_seq OWNED BY public.xlr_playerbody.id;


--
-- Name: xlr_playermaps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_playermaps (
    id integer NOT NULL,
    map_id smallint DEFAULT '0'::smallint NOT NULL,
    player_id smallint DEFAULT '0'::smallint NOT NULL,
    kills integer DEFAULT 0 NOT NULL,
    deaths integer DEFAULT 0 NOT NULL,
    teamkills integer DEFAULT 0 NOT NULL,
    teamdeaths smallint DEFAULT '0'::smallint NOT NULL,
    suicides smallint DEFAULT '0'::smallint NOT NULL,
    rounds smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.xlr_playermaps OWNER TO postgres;

--
-- Name: xlr_playermaps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_playermaps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_playermaps_id_seq OWNER TO postgres;

--
-- Name: xlr_playermaps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_playermaps_id_seq OWNED BY public.xlr_playermaps.id;


--
-- Name: xlr_playerstats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_playerstats (
    id integer NOT NULL,
    client_id integer DEFAULT 0 NOT NULL,
    kills integer DEFAULT 0 NOT NULL,
    deaths integer DEFAULT 0 NOT NULL,
    teamkills smallint DEFAULT '0'::smallint NOT NULL,
    teamdeaths smallint DEFAULT '0'::smallint NOT NULL,
    suicides smallint DEFAULT '0'::smallint NOT NULL,
    ratio double precision DEFAULT '0'::double precision NOT NULL,
    skill double precision DEFAULT '0'::double precision NOT NULL,
    assists integer DEFAULT 0 NOT NULL,
    assistskill double precision DEFAULT '0'::double precision NOT NULL,
    curstreak smallint DEFAULT '0'::smallint NOT NULL,
    winstreak smallint DEFAULT '0'::smallint NOT NULL,
    losestreak smallint DEFAULT '0'::smallint NOT NULL,
    rounds smallint DEFAULT '0'::smallint NOT NULL,
    hide smallint DEFAULT '0'::smallint NOT NULL,
    fixed_name character varying(32) DEFAULT ''::character varying NOT NULL,
    id_token character varying(10) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.xlr_playerstats OWNER TO postgres;

--
-- Name: xlr_playerstats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_playerstats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_playerstats_id_seq OWNER TO postgres;

--
-- Name: xlr_playerstats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_playerstats_id_seq OWNED BY public.xlr_playerstats.id;


--
-- Name: xlr_weaponstats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_weaponstats (
    id integer NOT NULL,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    kills integer DEFAULT 0 NOT NULL,
    teamkills smallint DEFAULT '0'::smallint NOT NULL,
    suicides smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.xlr_weaponstats OWNER TO postgres;

--
-- Name: xlr_weaponstats_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_weaponstats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_weaponstats_id_seq OWNER TO postgres;

--
-- Name: xlr_weaponstats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_weaponstats_id_seq OWNED BY public.xlr_weaponstats.id;


--
-- Name: xlr_weaponusage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xlr_weaponusage (
    id integer NOT NULL,
    weapon_id smallint DEFAULT '0'::smallint NOT NULL,
    player_id smallint DEFAULT '0'::smallint NOT NULL,
    kills integer DEFAULT 0 NOT NULL,
    deaths integer DEFAULT 0 NOT NULL,
    teamkills smallint DEFAULT '0'::smallint NOT NULL,
    teamdeaths smallint DEFAULT '0'::smallint NOT NULL,
    suicides smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE public.xlr_weaponusage OWNER TO postgres;

--
-- Name: xlr_weaponusage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xlr_weaponusage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.xlr_weaponusage_id_seq OWNER TO postgres;

--
-- Name: xlr_weaponusage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xlr_weaponusage_id_seq OWNED BY public.xlr_weaponusage.id;


--
-- Name: aliases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aliases ALTER COLUMN id SET DEFAULT nextval('public.aliases_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: cmdgrants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cmdgrants ALTER COLUMN id SET DEFAULT nextval('public.cmdgrants_id_seq'::regclass);


--
-- Name: ctime id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ctime ALTER COLUMN id SET DEFAULT nextval('public.ctime_id_seq'::regclass);


--
-- Name: current_clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_clients ALTER COLUMN id SET DEFAULT nextval('public.current_clients_id_seq'::regclass);


--
-- Name: current_svars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_svars ALTER COLUMN id SET DEFAULT nextval('public.current_svars_id_seq'::regclass);


--
-- Name: ipaliases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ipaliases ALTER COLUMN id SET DEFAULT nextval('public.ipaliases_id_seq'::regclass);


--
-- Name: penalties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penalties ALTER COLUMN id SET DEFAULT nextval('public.penalties_id_seq'::regclass);


--
-- Name: xlr_actionstats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_actionstats ALTER COLUMN id SET DEFAULT nextval('public.xlr_actionstats_id_seq'::regclass);


--
-- Name: xlr_bodyparts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_bodyparts ALTER COLUMN id SET DEFAULT nextval('public.xlr_bodyparts_id_seq'::regclass);


--
-- Name: xlr_history_monthly id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_history_monthly ALTER COLUMN id SET DEFAULT nextval('public.xlr_history_monthly_id_seq'::regclass);


--
-- Name: xlr_history_weekly id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_history_weekly ALTER COLUMN id SET DEFAULT nextval('public.xlr_history_weekly_id_seq'::regclass);


--
-- Name: xlr_mapstats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_mapstats ALTER COLUMN id SET DEFAULT nextval('public.xlr_mapstats_id_seq'::regclass);


--
-- Name: xlr_opponents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_opponents ALTER COLUMN id SET DEFAULT nextval('public.xlr_opponents_id_seq'::regclass);


--
-- Name: xlr_playeractions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playeractions ALTER COLUMN id SET DEFAULT nextval('public.xlr_playeractions_id_seq'::regclass);


--
-- Name: xlr_playerbody id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playerbody ALTER COLUMN id SET DEFAULT nextval('public.xlr_playerbody_id_seq'::regclass);


--
-- Name: xlr_playermaps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playermaps ALTER COLUMN id SET DEFAULT nextval('public.xlr_playermaps_id_seq'::regclass);


--
-- Name: xlr_playerstats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playerstats ALTER COLUMN id SET DEFAULT nextval('public.xlr_playerstats_id_seq'::regclass);


--
-- Name: xlr_weaponstats id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_weaponstats ALTER COLUMN id SET DEFAULT nextval('public.xlr_weaponstats_id_seq'::regclass);


--
-- Name: xlr_weaponusage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_weaponusage ALTER COLUMN id SET DEFAULT nextval('public.xlr_weaponusage_id_seq'::regclass);


--
-- Data for Name: aliases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aliases (id, num_used, alias, client_id, time_add, time_edit) FROM stdin;
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, ip, connections, guid, pbid, name, auto_login, mask_level, group_bits, greeting, time_add, time_edit, password, login) FROM stdin;
1		4	WORLD	WORLD	World	1	0	0		1620163822	1620166612		
3	152.207.249.79	1	AEFDA1E5DC62752B8CD47A096CC3E17C		Melon_Sultano	1	0	0		1620168001	1620168004		
2	152.207.113.50	3	AB736EFF306B893ED34AF279F16F47C2		XIII	1	0	128		1620164353	1620170824		
\.


--
-- Data for Name: cmdgrants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cmdgrants (id, commands) FROM stdin;
\.


--
-- Data for Name: ctime; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ctime (id, guid, came, gone, nick) FROM stdin;
\.


--
-- Data for Name: current_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_clients (id, updated, name, level, dbid, cid, joined, connections, state, score, ip, guid, pbid, team, colorname) FROM stdin;
1	Tue May  4 19:27:04 2021	XIII	100	2	0	Tue May  4 17:39:13 2021	3	2	0	152.207.113.50	AB736EFF306B893ED34AF279F16F47C2		-1	^1^1XIII^7
\.


--
-- Data for Name: current_svars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_svars (id, name, value) FROM stdin;
1	Ip	127.0.0.1
2	Port	27960
3	Name	iourt43
4	Type	ffa
5	Map	ut4_abbey
6	TimeLimit	20
7	FragLimit	20
8	CaptureLimit	0
9	Rounds	
10	RoundTime	4271
11	MapTime	692
12	OnlinePlayers	1
13	lastupdate	1620170882
14	gamename	q3urt43
15	protocol	68
16	g_enableDust	0
17	captureLimit	0
18	gameName	iourt43
19	g_followstrict	1
20	g_respawndelay	0
21	g_swaproles	0
22	g_stratTime	5
23	auth_notoriety	0
24	sv_clientsPerIp	3
25	_mapTimeStart	1620170190
26	auth_status	public
27	rounds	0
28	_mapName	ut4_abbey
29	g_suddendeath	0
30	console	<b3.parsers.iourt43.Iourt43Parser object at 0x7f4925f41cd0>
31	g_redwave	15
32	g_armbands	0
33	g_friendlyfire	2
34	sv_minRate	0
35	 Admin	roig
36	fs_game	q3ut4
37	g_maxGameClients	0
38	version	ioQ3 1.35 urt 4.3.4 linux-x86_64 Jun  7 2018
39	g_modversion	4.3.4
40	g_hotpotato	1
41	fragLimit	20
42	g_bluewave	15
43	g_allowvote	603981055
44	g_enableBreath	0
45	sv_minPing	0
46	fs_homepath	/home/cloud/UrbanTerror43
47	g_stamina	0
48	sv_privateClients	0
49	g_roundtime	2
50	sv_dlURL	roig.is-a.dev
51	g_waverespawns	0
52	timeLimit	20
53	g_deadchat	2
54	g_instagib	0
55	_roundTimeStart	1620166611
56	sv_maxclients	16
57	sv_hostname	El Parque
58	g_needpass	1
59	sv_floodprotect	2
60	g_maxrounds	0
61	g_funstuff	1
62	g_walljumps	3
63	fs_basepath	/home/cloud/UrbanTerror43
64	g_survivor	0
65	g_matchmode	0
66	g_enablePrecip	0
67	gameType	ffa
68	g_skins	1
69	sv_allowdownload	0
70	g_antilagvis	0
71	sv_maxRate	0
72	sv_maxPing	0
73	auth	1
74	 Email	groig@nauta.cu
75	auth_enable	1
\.


--
-- Data for Name: data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data (data_key, data_value) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name, keyword, level, time_edit, time_add) FROM stdin;
128	Super Admin	superadmin	100	0	1620163820
64	Senior Admin	senioradmin	80	0	1620163820
32	Full Admin	fulladmin	60	0	1620163821
16	Admin	admin	40	0	1620163821
8	Moderator	mod	20	0	1620163821
2	Regular	reg	2	0	1620163821
1	User	user	1	0	1620163821
0	Guest	guest	0	0	1620163821
\.


--
-- Data for Name: ipaliases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ipaliases (id, num_used, ip, client_id, time_add, time_edit) FROM stdin;
\.


--
-- Data for Name: penalties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penalties (id, type, client_id, admin_id, duration, inactive, keyword, reason, data, time_add, time_edit, time_expire) FROM stdin;
\.


--
-- Data for Name: xlr_actionstats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_actionstats (id, name, count) FROM stdin;
\.


--
-- Data for Name: xlr_bodyparts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_bodyparts (id, name, kills, teamkills, suicides) FROM stdin;
1	body	0	0	1
\.


--
-- Data for Name: xlr_history_monthly; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_history_monthly (id, client_id, kills, deaths, teamkills, teamdeaths, suicides, ratio, skill, assists, assistskill, winstreak, losestreak, rounds, year, month, week, day) FROM stdin;
\.


--
-- Data for Name: xlr_history_weekly; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_history_weekly (id, client_id, kills, deaths, teamkills, teamdeaths, suicides, ratio, skill, assists, assistskill, winstreak, losestreak, rounds, year, month, week, day) FROM stdin;
\.


--
-- Data for Name: xlr_mapstats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_mapstats (id, name, kills, teamkills, suicides, rounds) FROM stdin;
1	ut4_prominence	0	0	0	0
2	ut4_cascade	0	0	0	1
3	ut4_prague	0	0	0	1
4	ut4_ghosttown	0	0	1	1
5	ut4_algiers	0	0	0	1
6	ut4_abbey	0	0	0	1
\.


--
-- Data for Name: xlr_opponents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_opponents (id, target_id, killer_id, kills, retals) FROM stdin;
\.


--
-- Data for Name: xlr_playeractions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_playeractions (id, action_id, player_id, count) FROM stdin;
\.


--
-- Data for Name: xlr_playerbody; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_playerbody (id, bodypart_id, player_id, kills, deaths, teamkills, teamdeaths, suicides) FROM stdin;
1	1	3	0	0	0	0	1
\.


--
-- Data for Name: xlr_playermaps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_playermaps (id, map_id, player_id, kills, deaths, teamkills, teamdeaths, suicides, rounds) FROM stdin;
1	1	2	0	0	0	0	0	1
2	4	3	0	0	0	0	1	1
3	4	2	0	0	0	0	0	1
4	6	2	0	0	0	0	0	1
\.


--
-- Data for Name: xlr_playerstats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_playerstats (id, client_id, kills, deaths, teamkills, teamdeaths, suicides, ratio, skill, assists, assistskill, curstreak, winstreak, losestreak, rounds, hide, fixed_name, id_token) FROM stdin;
1	1	0	0	0	0	0	0	1000	0	0	0	0	0	0	1		
3	3	0	0	0	0	1	0	999.5	0	0	-1	0	-1	1	0		
2	2	0	0	0	0	0	0	1000	0	0	0	0	0	3	0		
\.


--
-- Data for Name: xlr_weaponstats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_weaponstats (id, name, kills, teamkills, suicides) FROM stdin;
1	25	0	0	1
\.


--
-- Data for Name: xlr_weaponusage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_weaponusage (id, weapon_id, player_id, kills, deaths, teamkills, teamdeaths, suicides) FROM stdin;
1	1	3	0	0	0	0	1
\.


--
-- Name: aliases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aliases_id_seq', 1, false);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 3, true);


--
-- Name: cmdgrants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cmdgrants_id_seq', 1, false);


--
-- Name: ctime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ctime_id_seq', 1, false);


--
-- Name: current_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.current_clients_id_seq', 1, true);


--
-- Name: current_svars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.current_svars_id_seq', 75, true);


--
-- Name: ipaliases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ipaliases_id_seq', 1, false);


--
-- Name: penalties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penalties_id_seq', 1, false);


--
-- Name: xlr_actionstats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_actionstats_id_seq', 1, false);


--
-- Name: xlr_bodyparts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_bodyparts_id_seq', 1, true);


--
-- Name: xlr_history_monthly_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_history_monthly_id_seq', 1, false);


--
-- Name: xlr_history_weekly_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_history_weekly_id_seq', 1, false);


--
-- Name: xlr_mapstats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_mapstats_id_seq', 6, true);


--
-- Name: xlr_opponents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_opponents_id_seq', 1, false);


--
-- Name: xlr_playeractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_playeractions_id_seq', 1, false);


--
-- Name: xlr_playerbody_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_playerbody_id_seq', 1, true);


--
-- Name: xlr_playermaps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_playermaps_id_seq', 4, true);


--
-- Name: xlr_playerstats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_playerstats_id_seq', 3, true);


--
-- Name: xlr_weaponstats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_weaponstats_id_seq', 1, true);


--
-- Name: xlr_weaponusage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_weaponusage_id_seq', 1, true);


--
-- Name: aliases aliases_alias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aliases
    ADD CONSTRAINT aliases_alias UNIQUE (alias, client_id);


--
-- Name: aliases aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aliases
    ADD CONSTRAINT aliases_pkey PRIMARY KEY (id);


--
-- Name: clients clients_guid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_guid UNIQUE (guid);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: cmdgrants cmdgrants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cmdgrants
    ADD CONSTRAINT cmdgrants_pkey PRIMARY KEY (id);


--
-- Name: ctime ctime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ctime
    ADD CONSTRAINT ctime_pkey PRIMARY KEY (id);


--
-- Name: current_clients current_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_clients
    ADD CONSTRAINT current_clients_pkey PRIMARY KEY (id);


--
-- Name: current_svars current_svars_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_svars
    ADD CONSTRAINT current_svars_name UNIQUE (name);


--
-- Name: current_svars current_svars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.current_svars
    ADD CONSTRAINT current_svars_pkey PRIMARY KEY (id);


--
-- Name: data data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT data_pkey PRIMARY KEY (data_key);


--
-- Name: groups groups_keyword; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_keyword UNIQUE (keyword);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: ipaliases ipaliases_ipalias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ipaliases
    ADD CONSTRAINT ipaliases_ipalias UNIQUE (ip, client_id);


--
-- Name: ipaliases ipaliases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ipaliases
    ADD CONSTRAINT ipaliases_pkey PRIMARY KEY (id);


--
-- Name: penalties penalties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penalties
    ADD CONSTRAINT penalties_pkey PRIMARY KEY (id);


--
-- Name: xlr_actionstats xlr_actionstats_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_actionstats
    ADD CONSTRAINT xlr_actionstats_name UNIQUE (name);


--
-- Name: xlr_actionstats xlr_actionstats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_actionstats
    ADD CONSTRAINT xlr_actionstats_pkey PRIMARY KEY (id);


--
-- Name: xlr_bodyparts xlr_bodyparts_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_bodyparts
    ADD CONSTRAINT xlr_bodyparts_name UNIQUE (name);


--
-- Name: xlr_bodyparts xlr_bodyparts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_bodyparts
    ADD CONSTRAINT xlr_bodyparts_pkey PRIMARY KEY (id);


--
-- Name: xlr_history_monthly xlr_history_monthly_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_history_monthly
    ADD CONSTRAINT xlr_history_monthly_pkey PRIMARY KEY (id);


--
-- Name: xlr_history_weekly xlr_history_weekly_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_history_weekly
    ADD CONSTRAINT xlr_history_weekly_pkey PRIMARY KEY (id);


--
-- Name: xlr_mapstats xlr_mapstats_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_mapstats
    ADD CONSTRAINT xlr_mapstats_name UNIQUE (name);


--
-- Name: xlr_mapstats xlr_mapstats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_mapstats
    ADD CONSTRAINT xlr_mapstats_pkey PRIMARY KEY (id);


--
-- Name: xlr_opponents xlr_opponents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_opponents
    ADD CONSTRAINT xlr_opponents_pkey PRIMARY KEY (id);


--
-- Name: xlr_playeractions xlr_playeractions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playeractions
    ADD CONSTRAINT xlr_playeractions_pkey PRIMARY KEY (id);


--
-- Name: xlr_playerbody xlr_playerbody_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playerbody
    ADD CONSTRAINT xlr_playerbody_pkey PRIMARY KEY (id);


--
-- Name: xlr_playermaps xlr_playermaps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playermaps
    ADD CONSTRAINT xlr_playermaps_pkey PRIMARY KEY (id);


--
-- Name: xlr_playerstats xlr_playerstats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playerstats
    ADD CONSTRAINT xlr_playerstats_pkey PRIMARY KEY (id);


--
-- Name: xlr_weaponstats xlr_weaponstats_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_weaponstats
    ADD CONSTRAINT xlr_weaponstats_name UNIQUE (name);


--
-- Name: xlr_weaponstats xlr_weaponstats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_weaponstats
    ADD CONSTRAINT xlr_weaponstats_pkey PRIMARY KEY (id);


--
-- Name: xlr_weaponusage xlr_weaponusage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_weaponusage
    ADD CONSTRAINT xlr_weaponusage_pkey PRIMARY KEY (id);


--
-- Name: xlr_opponents xlr_opponents_killer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_opponents
    ADD CONSTRAINT xlr_opponents_killer_id_fkey FOREIGN KEY (killer_id) REFERENCES public.clients(id);


--
-- Name: xlr_opponents xlr_opponents_target_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_opponents
    ADD CONSTRAINT xlr_opponents_target_id_fkey FOREIGN KEY (target_id) REFERENCES public.clients(id);


--
-- Name: xlr_playeractions xlr_playeractions_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playeractions
    ADD CONSTRAINT xlr_playeractions_action_id_fkey FOREIGN KEY (action_id) REFERENCES public.xlr_actionstats(id);


--
-- Name: xlr_playeractions xlr_playeractions_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playeractions
    ADD CONSTRAINT xlr_playeractions_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.clients(id);


--
-- Name: xlr_playerbody xlr_playerbody_bodypart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playerbody
    ADD CONSTRAINT xlr_playerbody_bodypart_id_fkey FOREIGN KEY (bodypart_id) REFERENCES public.xlr_bodyparts(id);


--
-- Name: xlr_playerbody xlr_playerbody_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playerbody
    ADD CONSTRAINT xlr_playerbody_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.clients(id);


--
-- Name: xlr_playermaps xlr_playermaps_map_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playermaps
    ADD CONSTRAINT xlr_playermaps_map_id_fkey FOREIGN KEY (map_id) REFERENCES public.xlr_mapstats(id);


--
-- Name: xlr_playermaps xlr_playermaps_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playermaps
    ADD CONSTRAINT xlr_playermaps_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.clients(id);


--
-- Name: xlr_playerstats xlr_playerstats_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_playerstats
    ADD CONSTRAINT xlr_playerstats_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: xlr_weaponusage xlr_weaponusage_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_weaponusage
    ADD CONSTRAINT xlr_weaponusage_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.clients(id);


--
-- Name: xlr_weaponusage xlr_weaponusage_weapon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xlr_weaponusage
    ADD CONSTRAINT xlr_weaponusage_weapon_id_fkey FOREIGN KEY (weapon_id) REFERENCES public.xlr_weaponstats(id);


--
-- PostgreSQL database dump complete
--

