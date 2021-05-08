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
1	1	AK103	5	1620361258	1620361258
2	1	AK103_5	5	1620361266	1620361266
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, ip, connections, guid, pbid, name, auto_login, mask_level, group_bits, greeting, time_add, time_edit, password, login) FROM stdin;
3	152.206.188.49	14	AEFDA1E5DC62752B8CD47A096CC3E17C		Melon_Sultano	1	0	0		1620168001	1620404469		
13	152.206.191.145	4	E9025665D0331B4B9F24AB7F7A9F11EF		L31Z4R	1	0	1		1620401556	1620407585		
1		8	WORLD	WORLD	World	1	0	0		1620163822	1620409172		
14	152.207.27.183	2	084906F3A5F21719D75B6D1317260404		KRATOS+KILL	1	0	0		1620418484	1620418505		
4	172.2.50.254	26	265D0EFB67B3512261C79944D45EBBAB		ppthunder	1	0	64		1620176525	1620418836		
15	190.92.127.227	2	4C736BFC14E3DA532A0CC183B3EE24B3		Fito	1	0	0		1620418784	1620418838		
12	190.152.188.215	6	F2FCAB9CB50438461BE75E6F51AA5E32		yasmabecks	1	0	0		1620364443	1620429714		
2	152.207.113.50	7	AB736EFF306B893ED34AF279F16F47C2	roig	XIII	1	0	128		1620164353	1620180956		
5	152.207.132.90	26	C510CF02E29DE2A4503115DDF6420314		AK103	1	0	64		1620177298	1620361853		
6	152.206.187.43	3	B3430D20783A7AD98C7C6C8300C48F57		ineedcoffee	1	0	1		1620186847	1620266245		
8	152.207.113.176	1	D7B605EFFAA0FCA69BFCDBA327AB9547		Arbastan	1	0	0		1620352157	1620352158		
11	152.207.214.88	4	54BF1B54DC37E61CE4957867F48158B9		glpzzz	1	0	0		1620359260	1620360182		
9	181.225.244.236	19	7220C15AD75B2D961B1F36F0C20A3BE4		hcalvofernandez	1	0	0		1620357941	1620363700		
10	152.207.224.92	18	C0BE703A1404D73EF0F623E8AAC8826E		hassiel	1	0	0		1620357960	1620364353		
7	152.206.163.42	33	F5583B7658311F75C3B7B2D137EC2FDC		ASS-BREAKER	1	0	0		1620351816	1620364562		
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
\.


--
-- Data for Name: current_svars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.current_svars (id, name, value) FROM stdin;
1	Ip	127.0.0.1
2	Port	27960
3	Name	iourt43
4	Type	ffa
5	Map	ut4_mykonos_a17
6	TimeLimit	20
7	FragLimit	20
8	CaptureLimit	0
9	Rounds	
10	RoundTime	26669
11	MapTime	83
12	OnlinePlayers	0
13	lastupdate	1620435840
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
25	_mapTimeStart	1620435757
26	auth_status	public
27	rounds	0
28	_mapName	ut4_mykonos_a17
29	g_suddendeath	0
30	console	<b3.parsers.iourt43.Iourt43Parser object at 0x7fd21a1f0cd0>
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
55	_roundTimeStart	1620409171
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
1	1	152.207.244.89	6	1620266245	1620266245
2	1	152.207.112.159	5	1620353054	1620353054
3	1	152.207.249.79	3	1620354233	1620354233
4	1	152.206.163.183	7	1620354621	1620354621
5	1	152.206.163.62	7	1620359659	1620359659
6	1	152.206.163.182	7	1620359804	1620359804
7	1	152.207.224.92	10	1620360668	1620360668
8	1	152.206.163.193	7	1620360696	1620360696
9	1	152.206.228.90	5	1620361258	1620361258
10	1	152.207.132.90	5	1620361523	1620361523
11	1	8.47.13.44	5	1620361826	1620361826
12	1	152.206.163.37	7	1620362319	1620362319
13	1	181.225.244.236	10	1620363899	1620363899
14	1	152.206.194.76	3	1620401761	1620401761
15	1	190.152.188.30	12	1620429714	1620429714
\.


--
-- Data for Name: penalties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penalties (id, type, client_id, admin_id, duration, inactive, keyword, reason, data, time_add, time_edit, time_expire) FROM stdin;
6	Warning	10	0	3	0		^7 do not shoot to spawning players!		1620358250	1620358250	1620358430
7	Warning	10	0	3	0		^7 do not shoot to spawning players!		1620358250	1620358250	1620358430
8	Warning	9	0	5	0		^7 spawnkilling is not allowed on this server!		1620358254	1620358254	1620358554
9	Kick	7	0	0	0	None	AFK for too long on this server		1620359801	1620359801	-1
10	Warning	7	0	3	0		^7 do not shoot to spawning players!		1620360362	1620360362	1620360542
11	Kick	5	0	0	0	None	AFK for too long on this server		1620361257	1620361257	-1
12	Kick	9	0	0	0	None	AFK for too long on this server		1620363413	1620363413	-1
13	Kick	10	0	0	0	None	AFK for too long on this server		1620363876	1620363876	-1
14	Kick	10	0	0	0	None	AFK for too long on this server		1620364335	1620364335	-1
15	Kick	9	0	0	0	None	AFK for too long on this server		1620364369	1620364369	-1
16	Warning	15	0	5	0		^7 spawnkilling is not allowed on this server!		1620418908	1620418908	1620419208
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
11	12	9	0	0
12	8	31	0	0
10	3	76	0	0
4	1	101	0	0
9	5	53	0	1
7	9	60	0	1
5	10	65	0	0
6	7	88	0	1
2	2	153	0	0
3	4	432	0	4
13	13	3	0	0
1	body	1	0	3
15	11	8	0	0
8	6	36	0	0
14	14	3	0	1
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
2	ut4_cascade	2	0	0	10
4	ut4_ghosttown	32	0	1	9
5	ut4_algiers	50	0	0	9
6	ut4_abbey	58	0	0	9
9	ut41_headtown_a4	0	0	0	9
7	ut4_suburbs	66	0	1	8
13	ut4_company	76	0	2	8
11	ut4_thingley	74	0	0	9
12	ut4_oildepot	90	0	1	9
8	ut4_herring	71	0	3	11
25	ut4_kingpin	0	0	0	6
26	ut4_subway	0	0	0	6
14	ut4_kingdom	41	0	0	9
27	ut4_paris	0	0	0	6
28	ut4_raiders	0	0	0	6
15	ut4_tombs	3	0	0	12
24	ut4_mandolin	0	0	0	7
16	ut4_killroom	75	0	0	10
17	ut4_bohemia	0	0	0	7
18	ut4_casa	0	0	0	7
19	ut4_sanc	36	0	0	6
20	ut4_riyadh	73	0	1	8
21	ut4_uptown	82	0	2	8
22	ut4_turnpike	65	0	0	8
23	ut4_austria	42	0	0	8
1	ut4_prominence	84	0	0	12
3	ut4_prague	36	0	0	12
10	ut4_mykonos_a17	63	0	0	12
\.


--
-- Data for Name: xlr_opponents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_opponents (id, target_id, killer_id, kills, retals) FROM stdin;
6	4	2	12	10
5	2	4	10	12
17	9	5	48	23
18	5	9	23	48
8	3	5	19	6
7	5	3	6	19
20	9	10	11	26
19	10	9	26	11
2	4	5	117	98
1	5	4	98	117
33	10	4	32	17
34	4	10	17	32
29	11	10	9	3
30	10	11	3	9
28	11	5	14	3
27	5	11	3	14
32	9	4	28	18
31	4	9	18	28
10	4	3	16	19
9	3	4	19	16
39	7	11	3	4
40	11	7	4	3
3	2	5	3	8
4	5	2	8	3
26	10	7	45	38
25	7	10	38	45
22	9	7	47	31
21	7	9	31	47
16	3	7	30	25
15	7	3	25	30
45	13	3	3	0
46	3	13	0	3
12	4	7	44	49
11	7	4	49	44
13	7	5	41	30
14	5	7	30	41
42	7	12	1	3
41	12	7	3	1
35	9	11	5	2
36	11	9	2	5
47	14	4	19	9
48	4	14	9	19
24	10	5	62	32
23	5	10	32	62
37	4	11	3	3
38	11	4	3	3
43	12	3	24	12
44	3	12	12	24
50	15	4	6	8
49	4	15	8	6
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
90	15	10	2	1	0	0	0
102	2	12	2	6	0	0	0
114	12	14	1	1	0	0	0
100	3	12	5	11	0	0	0
71	10	10	1	54	0	0	0
58	8	9	1	3	0	0	0
57	10	9	8	13	0	0	0
75	12	9	4	1	0	0	0
97	15	4	0	2	0	0	0
24	7	2	0	2	0	0	0
46	12	7	7	6	0	0	0
10	6	5	16	18	0	0	1
52	13	3	0	1	0	0	0
25	11	2	1	0	0	0	0
87	11	9	1	1	0	0	0
37	12	3	3	2	0	0	0
40	12	4	5	6	0	0	0
107	12	12	0	1	0	0	0
42	8	7	5	10	0	0	0
62	5	10	16	7	0	0	0
79	3	11	6	12	0	0	0
101	9	12	2	2	0	0	0
74	5	9	5	5	0	0	0
94	8	10	1	7	0	0	0
88	12	11	0	2	0	0	0
39	9	3	3	7	0	0	0
35	3	3	33	39	0	0	0
81	7	11	0	3	0	0	0
17	3	2	11	0	0	0	0
34	5	3	4	4	0	0	0
16	2	2	0	4	0	0	0
27	10	5	36	0	0	0	0
20	9	2	1	1	0	0	0
70	2	9	14	24	0	0	0
23	4	2	5	0	0	0	0
36	12	5	9	8	0	0	0
92	14	11	0	0	0	0	1
22	10	2	0	6	0	0	0
103	5	12	1	3	0	0	0
54	4	3	3	0	0	0	0
109	15	3	2	0	0	0	0
111	15	12	0	1	0	0	0
18	6	2	2	0	0	0	0
21	10	4	14	0	0	0	0
28	1	4	1	0	0	0	0
29	1	5	0	1	0	0	0
105	3	13	0	2	0	0	0
14	8	5	11	6	0	0	0
63	7	10	17	8	0	0	0
78	6	11	2	2	0	0	0
119	10	14	0	2	0	0	0
80	10	11	3	1	0	0	0
7	4	4	5	72	0	0	0
83	9	11	0	3	0	0	0
55	14	4	1	0	0	0	0
56	14	3	0	1	0	0	0
115	4	14	0	5	0	0	0
30	9	5	13	11	0	0	0
67	3	9	38	53	0	0	0
45	8	3	2	4	0	0	0
60	4	10	4	16	0	0	0
108	8	12	2	1	0	0	0
95	13	5	0	1	0	0	0
43	11	7	2	0	0	0	0
15	8	4	13	5	0	0	0
86	11	10	2	1	0	0	0
91	10	7	14	0	0	0	0
61	7	9	4	9	0	0	0
73	14	5	0	1	0	0	0
48	7	7	16	14	0	0	0
113	3	14	4	8	0	0	0
76	9	10	7	5	0	0	0
9	5	5	8	17	0	0	0
69	12	10	2	4	0	0	0
98	15	7	2	0	0	0	0
65	3	10	31	28	0	0	1
85	8	11	1	0	0	0	0
89	15	5	1	0	0	0	0
118	5	14	1	0	0	0	0
106	6	12	1	0	0	0	0
93	4	11	1	0	0	0	0
96	15	9	1	3	0	0	0
68	6	10	10	10	0	0	0
3	2	5	37	35	0	0	0
32	6	3	6	7	0	0	0
2	2	4	51	1	0	0	0
49	7	3	4	4	0	0	0
66	9	9	4	7	0	0	1
53	4	7	22	0	0	0	0
6	4	5	48	0	0	0	0
59	4	9	13	8	0	0	0
112	2	14	1	1	0	0	0
84	5	11	1	2	0	0	0
12	7	4	14	6	0	0	1
13	7	5	5	12	0	0	0
41	3	7	69	81	0	0	1
4	3	5	120	85	0	0	2
50	9	7	12	7	0	0	0
31	11	4	3	2	0	0	0
26	11	5	0	5	0	0	0
82	2	11	3	7	0	0	0
64	2	10	13	27	0	0	0
38	2	7	18	36	0	0	0
120	9	15	1	0	0	0	0
47	5	7	11	17	0	0	0
110	15	13	0	1	0	0	0
44	6	7	25	17	0	0	0
104	7	12	0	2	0	0	0
99	14	10	1	0	0	0	0
77	6	9	6	11	0	0	0
72	14	9	1	1	0	0	0
19	9	4	9	9	0	0	0
8	5	4	17	9	0	0	0
122	5	15	1	1	0	0	0
124	2	15	0	1	0	0	0
117	6	14	1	1	0	0	0
121	3	15	5	3	0	0	0
5	3	4	110	110	0	0	0
33	2	3	14	11	0	0	0
51	13	4	3	0	0	0	0
116	9	14	1	1	0	0	0
125	13	15	0	1	0	0	0
123	6	15	1	0	0	0	0
11	6	4	18	22	0	0	0
126	1	12	0	0	0	0	2
\.


--
-- Data for Name: xlr_playermaps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_playermaps (id, map_id, player_id, kills, deaths, teamkills, teamdeaths, suicides, rounds) FROM stdin;
1	1	2	0	0	0	0	0	1
2	4	3	0	0	0	0	1	1
3	4	2	0	0	0	0	0	1
4	6	2	0	0	0	0	0	1
5	7	2	0	0	0	0	0	1
31	21	5	21	6	0	0	1	1
30	21	4	15	16	0	0	0	1
14	14	2	0	1	0	0	0	1
13	14	5	1	0	0	0	0	5
15	15	5	0	0	0	0	0	1
79	10	7	12	14	0	0	0	1
73	8	11	3	7	0	0	1	1
9	12	4	24	25	0	0	0	7
78	10	10	9	14	0	0	0	1
29	20	3	5	7	0	0	0	1
28	20	5	21	19	0	0	1	1
27	20	4	19	19	0	0	0	1
67	7	9	6	7	0	0	0	1
8	12	5	25	17	0	0	0	2
46	3	9	4	11	0	0	0	1
84	12	7	20	18	0	0	0	1
40	23	3	11	11	0	0	0	1
80	10	9	9	11	0	0	0	1
16	16	5	10	13	0	0	0	3
18	16	2	20	12	0	0	0	1
109	16	14	9	19	0	0	0	1
19	17	5	0	0	0	0	0	1
20	21	6	0	0	0	0	0	1
21	22	6	0	0	0	0	0	1
22	8	6	0	0	0	0	0	1
23	18	7	0	0	0	0	0	1
24	18	8	0	0	0	0	0	1
38	23	4	20	17	0	0	0	1
39	23	7	11	14	0	0	0	1
107	24	4	0	0	0	0	0	1
108	15	4	0	0	0	0	0	1
12	14	4	0	0	0	0	0	2
76	10	5	20	10	0	0	0	1
45	3	5	20	11	0	0	0	1
41	1	7	20	15	0	0	0	1
105	2	12	1	1	0	0	0	1
44	2	7	0	0	0	0	0	1
26	19	5	20	16	0	0	0	0
25	19	4	16	20	0	0	0	3
48	3	10	12	12	0	0	0	1
77	10	4	13	14	0	0	0	1
85	12	9	7	18	0	0	0	1
50	4	10	6	16	0	0	0	1
49	4	5	20	10	0	0	0	1
51	4	9	6	6	0	0	0	1
98	21	9	8	11	0	0	0	1
32	21	3	3	14	0	0	0	2
11	13	5	33	23	0	0	1	2
99	21	10	6	11	0	0	0	3
34	22	4	16	15	0	0	0	1
47	3	7	0	2	0	0	0	1
35	22	5	20	12	0	0	0	1
37	22	3	13	16	0	0	0	1
91	14	10	10	14	0	0	0	1
88	13	10	2	12	0	0	0	1
10	13	4	31	30	0	0	0	4
6	11	4	19	13	0	0	0	4
82	11	9	9	15	0	0	0	1
83	11	10	8	17	0	0	0	1
81	11	7	20	17	0	0	0	1
68	7	10	9	10	0	0	0	1
64	7	4	15	13	0	0	1	1
65	7	7	20	16	0	0	0	1
63	7	5	15	15	0	0	0	1
7	11	5	18	12	0	0	0	3
87	13	9	10	11	0	0	1	1
66	7	11	1	5	0	0	0	1
74	8	10	8	14	0	0	0	1
57	6	4	13	11	0	0	0	1
69	8	4	17	10	0	0	0	1
55	5	11	6	7	0	0	0	1
56	5	4	6	4	0	0	0	1
54	5	10	10	15	0	0	0	1
52	5	5	20	13	0	0	0	1
53	5	9	8	11	0	0	0	1
72	8	9	7	9	0	0	0	1
70	8	5	20	14	0	0	0	1
62	6	7	0	4	0	0	0	2
90	14	7	20	19	0	0	0	1
60	6	11	7	13	0	0	0	1
61	6	10	9	10	0	0	0	1
58	6	5	20	9	0	0	0	1
59	6	9	9	11	0	0	0	1
89	14	9	10	7	0	0	0	1
71	8	7	16	17	0	0	0	1
75	9	5	0	0	0	0	0	1
113	8	12	0	0	0	0	2	1
97	20	10	3	11	0	0	0	1
92	15	7	0	2	0	0	0	1
94	15	10	1	0	0	0	0	1
93	15	9	2	1	0	0	0	1
86	12	10	14	12	0	0	1	1
95	20	7	20	7	0	0	0	1
96	20	9	5	10	0	0	0	2
33	21	7	29	22	0	0	1	3
100	21	12	0	2	0	0	0	1
17	16	4	35	30	0	0	0	2
110	16	15	1	1	0	0	0	1
42	1	3	41	31	0	0	0	3
103	1	12	11	23	0	0	0	2
101	22	12	1	1	0	0	0	1
36	22	7	15	21	0	0	0	2
104	2	13	0	0	0	0	0	1
111	1	4	5	7	0	0	0	1
43	2	3	1	1	0	0	0	4
102	1	13	0	3	0	0	0	2
106	5	13	0	0	0	0	0	1
112	1	15	7	5	0	0	0	1
\.


--
-- Data for Name: xlr_playerstats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_playerstats (id, client_id, kills, deaths, teamkills, teamdeaths, suicides, ratio, skill, assists, assistskill, curstreak, winstreak, losestreak, rounds, hide, fixed_name, id_token) FROM stdin;
7	7	196	182	0	0	1	1.07692307692	1171.7994337897644	17	20.405660323	6	6	-5	20	0		
15	15	8	6	0	0	0	1.33333333333	1076.21485138	0	0	-1	3	-2	2	0		
2	2	20	12	0	0	0	1.66666666667	962.2831385437869	1	3.68768327118	1	4	-2	6	0		
6	6	0	0	0	0	0	0	836.52309254083	0	0	0	0	0	3	0		
8	8	0	0	0	0	0	0	839.4749914880715	0	0	0	0	0	1	0		
11	11	17	32	0	0	1	0.53125	907.5827375005804	2	9.9911989006	-3	3	-7	4	0		
5	5	209	151	0	0	3	1.38410596026	1138.9000015439838	11	11.6177003065	1	7	-5	28	0		
9	9	98	135	0	0	1	0.725925925926	1086.4364032828644	9	33.7886361415	-3	5	-6	15	0		
10	10	97	163	0	0	1	0.59509202454	1048.8232857957842	11	34.137318926	-3	5	-11	16	0		
12	12	13	27	0	0	2	0.481481481481	929.159580523	0	0	-3	2	-5	6	0		
3	3	46	68	0	0	1	0.676470588235	1001.95235751	7	33.8111429607	-2	3	-8	13	0		
13	13	0	3	0	0	0	0	976.454940862	0	0	-3	0	-3	4	0		
1	1	0	0	0	0	0	0	1000	0	0	0	0	0	0	1		
14	14	9	19	0	0	0	0.473684210526	1023.73193818	0	0	-3	2	-3	1	0		
4	4	200	192	0	0	1	1.04166666667	1152.08851808	18	27.3756718365	2	6	-8	34	0		
\.


--
-- Data for Name: xlr_weaponstats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_weaponstats (id, name, kills, teamkills, suicides) FROM stdin;
1	25	0	0	1
8	44	19	0	0
6	18	3	0	0
18	12	2	0	0
16	21	1	0	0
7	38	29	0	0
10	19	21	0	0
3	39	9	0	0
11	15	3	0	0
12	36	55	0	0
2	30	708	0	0
5	mod_falling	0	0	8
14	9	0	0	2
17	40	2	0	0
9	20	221	0	0
4	23	35	0	0
15	16	7	0	0
13	28	4	0	0
\.


--
-- Data for Name: xlr_weaponusage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xlr_weaponusage (id, weapon_id, player_id, kills, deaths, teamkills, teamdeaths, suicides) FROM stdin;
1	1	3	0	0	0	0	1
22	10	5	0	6	0	0	0
66	15	7	0	1	0	0	0
45	9	10	47	45	0	0	0
38	12	10	24	9	0	0	0
24	10	4	0	7	0	0	0
46	9	9	47	47	0	0	0
10	6	4	0	2	0	0	0
2	2	4	240	157	0	0	0
67	15	9	0	1	0	0	0
68	5	10	0	0	0	0	1
55	12	9	31	0	0	0	0
76	17	7	1	0	0	0	0
83	4	13	0	1	0	0	0
40	12	7	0	12	0	0	0
60	13	11	1	0	0	0	0
49	4	11	0	2	0	0	0
28	10	7	0	3	0	0	0
84	17	3	1	0	0	0	0
13	7	2	0	10	0	0	0
48	2	11	15	21	0	0	0
77	17	12	0	2	0	0	0
33	11	7	0	2	0	0	0
89	2	15	8	6	0	0	0
16	9	2	10	0	0	0	0
26	9	7	106	42	0	0	0
74	13	7	0	2	0	0	0
8	5	5	0	0	0	0	3
11	2	2	0	3	0	0	0
90	5	12	0	0	0	0	1
14	8	2	10	0	0	0	0
20	8	4	0	6	0	0	0
27	5	7	0	0	0	0	1
91	14	12	0	0	0	0	1
53	10	11	0	4	0	0	0
78	18	3	2	0	0	0	0
79	18	12	0	2	0	0	0
51	8	11	1	0	0	0	0
15	8	5	2	7	0	0	0
21	10	3	12	0	0	0	0
23	2	3	54	63	0	0	0
64	15	10	4	0	0	0	0
80	2	12	0	18	0	0	0
65	15	4	0	2	0	0	0
31	3	3	0	1	0	0	0
75	9	12	11	2	0	0	0
30	9	3	0	11	0	0	0
81	2	13	0	2	0	0	0
47	4	10	8	2	0	0	0
9	6	5	3	0	0	0	0
34	6	3	0	1	0	0	0
32	11	4	3	0	0	0	0
54	11	5	0	1	0	0	0
63	14	11	0	0	0	0	1
43	7	10	5	0	0	0	0
18	7	5	0	10	0	0	0
82	4	12	2	0	0	0	0
62	3	7	0	1	0	0	0
35	4	3	2	4	0	0	0
85	15	3	3	0	0	0	0
86	15	12	0	3	0	0	0
39	12	5	0	20	0	0	0
88	7	14	9	0	0	0	0
42	3	10	0	2	0	0	0
59	5	4	0	0	0	0	1
12	7	4	15	9	0	0	0
70	16	10	1	0	0	0	0
52	10	10	9	0	0	0	0
71	16	7	0	1	0	0	0
58	10	9	0	1	0	0	0
56	12	11	0	1	0	0	0
37	2	10	0	108	0	0	0
4	3	5	9	0	0	0	0
5	3	4	0	5	0	0	0
73	13	10	3	0	0	0	0
61	13	9	0	2	0	0	0
19	9	4	0	37	0	0	0
69	5	9	0	0	0	0	1
50	9	11	0	4	0	0	0
87	2	14	0	19	0	0	0
57	12	4	0	13	0	0	0
17	9	5	0	33	0	0	0
44	8	10	6	2	0	0	0
29	4	7	8	7	0	0	0
41	4	9	4	5	0	0	0
72	8	7	0	4	0	0	0
36	2	9	18	83	0	0	0
25	2	7	88	113	0	0	0
7	4	4	6	6	0	0	0
6	4	5	5	8	0	0	0
3	2	5	285	115	0	0	0
\.


--
-- Name: aliases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aliases_id_seq', 2, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 15, true);


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

SELECT pg_catalog.setval('public.current_clients_id_seq', 1, false);


--
-- Name: current_svars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.current_svars_id_seq', 75, true);


--
-- Name: ipaliases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ipaliases_id_seq', 15, true);


--
-- Name: penalties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penalties_id_seq', 16, true);


--
-- Name: xlr_actionstats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_actionstats_id_seq', 1, false);


--
-- Name: xlr_bodyparts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_bodyparts_id_seq', 15, true);


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

SELECT pg_catalog.setval('public.xlr_mapstats_id_seq', 28, true);


--
-- Name: xlr_opponents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_opponents_id_seq', 50, true);


--
-- Name: xlr_playeractions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_playeractions_id_seq', 1, false);


--
-- Name: xlr_playerbody_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_playerbody_id_seq', 126, true);


--
-- Name: xlr_playermaps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_playermaps_id_seq', 113, true);


--
-- Name: xlr_playerstats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_playerstats_id_seq', 15, true);


--
-- Name: xlr_weaponstats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_weaponstats_id_seq', 18, true);


--
-- Name: xlr_weaponusage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xlr_weaponusage_id_seq', 91, true);


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

