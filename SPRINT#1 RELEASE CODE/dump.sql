--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.13
-- Dumped by pg_dump version 9.6.13

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

--
-- Name: has_test; Type: SCHEMA; Schema: -; Owner: sinfdoc
--

CREATE SCHEMA has_test;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actuator; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.actuator (
    act_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(100)
);



CREATE SEQUENCE has_test.actuator_act_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: actuator_act_id_seq; Type: SEQUENCE OWNED BY; Schema: has_test; Owner: sinfdoc
--

ALTER SEQUENCE has_test.actuator_act_id_seq OWNED BY has_test.actuator.act_id;


--
-- Name: actuator_room; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.actuator_room (
    act_id integer NOT NULL,
    name_room character varying(100) NOT NULL
);



--
-- Name: measure; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.measure (
    m_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    value double precision,
    type_sens character varying(100),
    mote_id integer
);



--
-- Name: measure_m_id_seq; Type: SEQUENCE; Schema: has_test; Owner: sinfdoc
--

CREATE SEQUENCE has_test.measure_m_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: measure_m_id_seq; Type: SEQUENCE OWNED BY; Schema: has_test; Owner: sinfdoc
--

ALTER SEQUENCE has_test.measure_m_id_seq OWNED BY has_test.measure.m_id;


--
-- Name: mote; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.mote (
    mote_id integer NOT NULL,
    name character varying(100),
    series character varying(100),
    name_room character varying(100)
);


--
-- Name: mote_mote_id_seq; Type: SEQUENCE; Schema: has_test; Owner: sinfdoc
--

CREATE SEQUENCE has_test.mote_mote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mote_mote_id_seq; Type: SEQUENCE OWNED BY; Schema: has_test; Owner: sinfdoc
--

ALTER SEQUENCE has_test.mote_mote_id_seq OWNED BY has_test.mote.mote_id;


--
-- Name: room; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.room (
    name character varying(100) NOT NULL,
    description character varying(200)
);


--
-- Name: rule; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.rule (
    rule_id integer NOT NULL,
    operator character varying(10),
    value double precision,
    act_id integer NOT NULL,
    type_sens character varying(100) NOT NULL,
    mote_id integer NOT NULL
);


--
-- Name: rule_rule_id_seq; Type: SEQUENCE; Schema: has_test; Owner: sinfdoc
--

CREATE SEQUENCE has_test.rule_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: rule_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: has_test; Owner: sinfdoc
--

ALTER SEQUENCE has_test.rule_rule_id_seq OWNED BY has_test.rule.rule_id;


--
-- Name: sensor; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.sensor (
    type character varying(100) NOT NULL,
    description character varying(200)
);


--
-- Name: sensor_mote; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.sensor_mote (
    type_sens character varying(100) NOT NULL,
    mote_id integer NOT NULL
);



--
-- Name: state; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.state (
    s_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    state integer,
    act_id integer,
    name_room character varying(100)
);


--
-- Name: state_s_id_seq; Type: SEQUENCE; Schema: has_test; Owner: sinfdoc
--

CREATE SEQUENCE has_test.state_s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: state_s_id_seq; Type: SEQUENCE OWNED BY; Schema: has_test; Owner: sinfdoc
--

ALTER SEQUENCE has_test.state_s_id_seq OWNED BY has_test.state.s_id;


--
-- Name: actuator act_id; Type: DEFAULT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.actuator ALTER COLUMN act_id SET DEFAULT nextval('has_test.actuator_act_id_seq'::regclass);


--
-- Name: measure m_id; Type: DEFAULT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.measure ALTER COLUMN m_id SET DEFAULT nextval('has_test.measure_m_id_seq'::regclass);


--
-- Name: mote mote_id; Type: DEFAULT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.mote ALTER COLUMN mote_id SET DEFAULT nextval('has_test.mote_mote_id_seq'::regclass);


--
-- Name: rule rule_id; Type: DEFAULT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.rule ALTER COLUMN rule_id SET DEFAULT nextval('has_test.rule_rule_id_seq'::regclass);


--
-- Name: state s_id; Type: DEFAULT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.state ALTER COLUMN s_id SET DEFAULT nextval('has_test.state_s_id_seq'::regclass);


--
-- Data for Name: actuator; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.actuator VALUES (1, 'Heater', 'This is the Heater type, meaning that at home there might be several heaters');


--
-- Name: actuator_act_id_seq; Type: SEQUENCE SET; Schema: has_test; Owner: sinfdoc
--

SELECT pg_catalog.setval('has_test.actuator_act_id_seq', 1, true);


--
-- Data for Name: actuator_room; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.actuator_room VALUES (1, 'Kitchen');
INSERT INTO has_test.actuator_room VALUES (1, 'WC');
INSERT INTO has_test.actuator_room VALUES (1, 'Living Room');


--
-- Data for Name: measure; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.measure VALUES (7611, '2019-04-17 18:09:39', 0, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7612, '2019-04-17 18:09:39', 0, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7613, '2019-04-17 18:09:39', 0, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7614, '2019-04-17 18:09:39', 0, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7615, '2019-04-17 18:09:39', 2, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7616, '2019-04-17 18:09:39', 5, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7617, '2019-04-17 18:09:39', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7618, '2019-04-17 18:09:39', 0.844848999999999961, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7619, '2019-04-17 18:09:39', 0, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7620, '2019-04-17 18:09:39', 0, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7621, '2019-04-17 18:09:39', 0, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7622, '2019-04-17 18:09:39', 0, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7623, '2019-04-17 18:09:40', 0, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7624, '2019-04-17 18:09:40', 0, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7625, '2019-04-17 18:09:40', 0, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7626, '2019-04-17 18:09:40', 0, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7627, '2019-04-17 18:09:40', 2, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7628, '2019-04-17 18:09:40', 5, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7629, '2019-04-17 18:09:40', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7630, '2019-04-17 18:09:40', 0.844848999999999961, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7631, '2019-04-17 18:09:40', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7632, '2019-04-17 18:09:40', 4, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7633, '2019-04-17 18:09:40', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7634, '2019-04-17 18:09:40', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7635, '2019-04-17 18:09:40', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7636, '2019-04-17 18:09:40', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7637, '2019-04-17 18:09:40', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7638, '2019-04-17 18:09:40', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7639, '2019-04-17 18:09:40', 2, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7640, '2019-04-17 18:09:40', 5, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7641, '2019-04-17 18:09:40', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7642, '2019-04-17 18:09:40', 0.844848999999999961, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7643, '2019-04-17 18:09:40', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7644, '2019-04-17 18:09:40', 4, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7645, '2019-04-17 18:09:40', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7646, '2019-04-17 18:09:40', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7647, '2019-04-17 18:09:40', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7648, '2019-04-17 18:09:40', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7649, '2019-04-17 18:09:40', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7650, '2019-04-17 18:09:40', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7651, '2019-04-17 18:09:40', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7652, '2019-04-17 18:09:40', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7653, '2019-04-17 18:09:40', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7654, '2019-04-17 18:09:40', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7655, '2019-04-17 18:09:40', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7656, '2019-04-17 18:09:40', 4, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7657, '2019-04-17 18:09:40', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7658, '2019-04-17 18:09:40', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7659, '2019-04-17 18:09:41', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7660, '2019-04-17 18:09:41', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7661, '2019-04-17 18:09:41', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7662, '2019-04-17 18:09:41', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7663, '2019-04-17 18:09:41', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7664, '2019-04-17 18:09:41', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7665, '2019-04-17 18:09:41', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7666, '2019-04-17 18:09:41', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7667, '2019-04-17 18:09:41', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7668, '2019-04-17 18:09:41', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7669, '2019-04-17 18:09:41', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7670, '2019-04-17 18:09:41', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7671, '2019-04-17 18:09:41', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7672, '2019-04-17 18:09:41', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7673, '2019-04-17 18:09:41', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7674, '2019-04-17 18:09:41', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7675, '2019-04-17 18:09:41', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7676, '2019-04-17 18:09:41', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7677, '2019-04-17 18:09:41', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7678, '2019-04-17 18:09:41', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7679, '2019-04-17 18:09:41', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7680, '2019-04-17 18:09:41', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7681, '2019-04-17 18:09:41', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7682, '2019-04-17 18:09:41', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7683, '2019-04-17 18:09:41', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7684, '2019-04-17 18:09:41', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7685, '2019-04-17 18:09:41', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7686, '2019-04-17 18:09:41', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7687, '2019-04-17 18:09:41', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7688, '2019-04-17 18:09:41', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7689, '2019-04-17 18:09:41', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7690, '2019-04-17 18:09:41', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7691, '2019-04-17 18:09:41', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7692, '2019-04-17 18:09:41', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7693, '2019-04-17 18:09:41', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7694, '2019-04-17 18:09:41', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7695, '2019-04-17 18:09:42', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7696, '2019-04-17 18:09:42', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7697, '2019-04-17 18:09:42', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7698, '2019-04-17 18:09:42', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7699, '2019-04-17 18:09:42', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7700, '2019-04-17 18:09:42', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7701, '2019-04-17 18:09:42', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7702, '2019-04-17 18:09:42', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7703, '2019-04-17 18:09:42', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7704, '2019-04-17 18:09:42', 8, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7705, '2019-04-17 18:09:42', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7706, '2019-04-17 18:09:42', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7707, '2019-04-17 18:09:42', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7708, '2019-04-17 18:09:42', 9, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7709, '2019-04-17 18:09:42', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7710, '2019-04-17 18:09:42', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7711, '2019-04-17 18:09:42', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7712, '2019-04-17 18:09:42', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7713, '2019-04-17 18:09:42', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7714, '2019-04-17 18:09:42', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7715, '2019-04-17 18:09:42', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7716, '2019-04-17 18:09:42', 8, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7717, '2019-04-17 18:09:42', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7718, '2019-04-17 18:09:42', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7719, '2019-04-17 18:09:42', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7720, '2019-04-17 18:09:42', 9, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7721, '2019-04-17 18:09:42', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7722, '2019-04-17 18:09:42', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7723, '2019-04-17 18:09:42', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7724, '2019-04-17 18:09:42', 10, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7725, '2019-04-17 18:09:42', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7726, '2019-04-17 18:09:42', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7727, '2019-04-17 18:09:42', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7728, '2019-04-17 18:09:42', 8, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7729, '2019-04-17 18:09:42', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7730, '2019-04-17 18:09:42', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7731, '2019-04-17 18:09:43', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7732, '2019-04-17 18:09:43', 9, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7733, '2019-04-17 18:09:43', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7734, '2019-04-17 18:09:43', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7735, '2019-04-17 18:09:43', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7736, '2019-04-17 18:09:43', 10, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7737, '2019-04-17 18:09:43', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7738, '2019-04-17 18:09:43', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7739, '2019-04-17 18:09:43', 6, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7740, '2019-04-17 18:09:43', 10, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7741, '2019-04-17 18:09:43', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7742, '2019-04-17 18:09:43', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7743, '2019-04-17 18:09:43', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7744, '2019-04-17 18:09:43', 11, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7745, '2019-04-17 18:09:43', 116, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7746, '2019-04-17 18:09:43', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7747, '2019-04-17 18:09:43', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7748, '2019-04-17 18:09:43', 10, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7749, '2019-04-17 18:09:43', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7750, '2019-04-17 18:09:43', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7751, '2019-04-17 18:09:43', 6, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7752, '2019-04-17 18:09:43', 10, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7753, '2019-04-17 18:09:43', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7754, '2019-04-17 18:09:43', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7755, '2019-04-17 18:09:43', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7756, '2019-04-17 18:09:43', 11, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7757, '2019-04-17 18:09:43', 116, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7758, '2019-04-17 18:09:43', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7759, '2019-04-17 18:09:43', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7760, '2019-04-17 18:09:43', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7761, '2019-04-17 18:09:43', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7762, '2019-04-17 18:09:43', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7763, '2019-04-17 18:09:43', 6, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7764, '2019-04-17 18:09:43', 10, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7765, '2019-04-17 18:09:43', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7766, '2019-04-17 18:09:43', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7767, '2019-04-17 18:09:44', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7768, '2019-04-17 18:09:44', 11, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7769, '2019-04-17 18:09:44', 116, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7770, '2019-04-17 18:09:44', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7771, '2019-04-17 18:09:44', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7772, '2019-04-17 18:09:44', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7773, '2019-04-17 18:09:44', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7774, '2019-04-17 18:09:44', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7775, '2019-04-17 18:09:44', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7776, '2019-04-17 18:09:44', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7777, '2019-04-17 18:09:44', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7778, '2019-04-17 18:09:44', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7779, '2019-04-17 18:09:44', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7780, '2019-04-17 18:09:44', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7781, '2019-04-17 18:09:44', 86, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7782, '2019-04-17 18:09:44', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7783, '2019-04-17 18:09:44', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7784, '2019-04-17 18:09:44', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7785, '2019-04-17 18:09:44', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7786, '2019-04-17 18:09:44', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7787, '2019-04-17 18:09:44', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7788, '2019-04-17 18:09:44', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7789, '2019-04-17 18:09:44', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7790, '2019-04-17 18:09:44', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7791, '2019-04-17 18:09:44', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7792, '2019-04-17 18:09:44', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7793, '2019-04-17 18:09:44', 86, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7794, '2019-04-17 18:09:44', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7795, '2019-04-17 18:09:44', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7796, '2019-04-17 18:09:44', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7797, '2019-04-17 18:09:44', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7798, '2019-04-17 18:09:44', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7799, '2019-04-17 18:09:44', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7800, '2019-04-17 18:09:44', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7801, '2019-04-17 18:09:44', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7802, '2019-04-17 18:09:44', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7803, '2019-04-17 18:09:45', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7804, '2019-04-17 18:09:45', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7805, '2019-04-17 18:09:45', 86, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7806, '2019-04-17 18:09:45', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7807, '2019-04-17 18:09:45', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7808, '2019-04-17 18:09:45', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7809, '2019-04-17 18:09:45', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7810, '2019-04-17 18:09:45', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7811, '2019-04-17 18:09:45', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7812, '2019-04-17 18:09:45', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7813, '2019-04-17 18:09:45', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7814, '2019-04-17 18:09:45', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7815, '2019-04-17 18:09:45', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7816, '2019-04-17 18:09:45', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7817, '2019-04-17 18:09:45', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7818, '2019-04-17 18:09:45', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7819, '2019-04-17 18:09:45', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7820, '2019-04-17 18:09:45', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7821, '2019-04-17 18:09:45', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7822, '2019-04-17 18:09:45', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7823, '2019-04-17 18:09:45', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7824, '2019-04-17 18:09:45', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7825, '2019-04-17 18:09:45', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7826, '2019-04-17 18:09:45', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7827, '2019-04-17 18:09:45', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7828, '2019-04-17 18:09:45', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7829, '2019-04-17 18:09:45', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7830, '2019-04-17 18:09:45', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7831, '2019-04-17 18:09:45', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7832, '2019-04-17 18:09:45', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7833, '2019-04-17 18:09:45', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7834, '2019-04-17 18:09:45', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7835, '2019-04-17 18:09:45', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7836, '2019-04-17 18:09:45', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7837, '2019-04-17 18:09:45', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7838, '2019-04-17 18:09:45', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7839, '2019-04-17 18:09:46', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7840, '2019-04-17 18:09:46', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7841, '2019-04-17 18:09:46', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7842, '2019-04-17 18:09:46', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7843, '2019-04-17 18:09:46', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7844, '2019-04-17 18:09:46', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7845, '2019-04-17 18:09:46', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7846, '2019-04-17 18:09:46', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7847, '2019-04-17 18:09:46', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7848, '2019-04-17 18:09:46', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7849, '2019-04-17 18:09:46', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7850, '2019-04-17 18:09:46', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7851, '2019-04-17 18:09:46', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7852, '2019-04-17 18:09:46', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7853, '2019-04-17 18:09:46', 89, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7854, '2019-04-17 18:09:46', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7855, '2019-04-17 18:09:46', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7856, '2019-04-17 18:09:46', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7857, '2019-04-17 18:09:46', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7858, '2019-04-17 18:09:46', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7859, '2019-04-17 18:09:46', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7860, '2019-04-17 18:09:46', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7861, '2019-04-17 18:09:46', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7862, '2019-04-17 18:09:46', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7863, '2019-04-17 18:09:46', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7864, '2019-04-17 18:09:46', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7865, '2019-04-17 18:09:46', 89, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7866, '2019-04-17 18:09:46', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7867, '2019-04-17 18:09:46', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7868, '2019-04-17 18:09:46', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7869, '2019-04-17 18:09:46', 100, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7870, '2019-04-17 18:09:46', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7871, '2019-04-17 18:09:46', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7872, '2019-04-17 18:09:46', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7873, '2019-04-17 18:09:46', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7874, '2019-04-17 18:09:46', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7875, '2019-04-17 18:09:47', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7876, '2019-04-17 18:09:47', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7877, '2019-04-17 18:09:47', 89, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7878, '2019-04-17 18:09:47', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7879, '2019-04-17 18:09:47', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7880, '2019-04-17 18:09:47', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7881, '2019-04-17 18:09:47', 100, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7882, '2019-04-17 18:09:47', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7883, '2019-04-17 18:09:47', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7884, '2019-04-17 18:09:47', 16, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7885, '2019-04-17 18:09:47', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7886, '2019-04-17 18:09:47', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7887, '2019-04-17 18:09:47', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7888, '2019-04-17 18:09:47', 17, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7889, '2019-04-17 18:09:47', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7890, '2019-04-17 18:09:47', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7891, '2019-04-17 18:09:47', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7892, '2019-04-17 18:09:47', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7893, '2019-04-17 18:09:47', 100, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7894, '2019-04-17 18:09:47', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7895, '2019-04-17 18:09:47', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7896, '2019-04-17 18:09:47', 16, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7897, '2019-04-17 18:09:47', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7898, '2019-04-17 18:09:47', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7899, '2019-04-17 18:09:47', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7900, '2019-04-17 18:09:47', 17, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7901, '2019-04-17 18:09:47', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7902, '2019-04-17 18:09:47', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7903, '2019-04-17 18:09:47', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7904, '2019-04-17 18:09:47', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7905, '2019-04-17 18:09:47', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7906, '2019-04-17 18:09:47', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7907, '2019-04-17 18:09:47', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7908, '2019-04-17 18:09:47', 16, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7909, '2019-04-17 18:09:47', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7910, '2019-04-17 18:09:47', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7911, '2019-04-17 18:09:48', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7912, '2019-04-17 18:09:48', 17, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7913, '2019-04-17 18:09:48', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7914, '2019-04-17 18:09:48', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7915, '2019-04-17 18:09:48', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7916, '2019-04-17 18:09:48', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7917, '2019-04-17 18:09:48', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7918, '2019-04-17 18:09:48', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7919, '2019-04-17 18:09:48', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7920, '2019-04-17 18:09:48', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7921, '2019-04-17 18:09:48', 107, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7922, '2019-04-17 18:09:48', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7923, '2019-04-17 18:09:48', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7924, '2019-04-17 18:09:48', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7925, '2019-04-17 18:09:48', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7926, '2019-04-17 18:09:48', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7927, '2019-04-17 18:09:48', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7928, '2019-04-17 18:09:48', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7929, '2019-04-17 18:09:48', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7930, '2019-04-17 18:09:48', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7931, '2019-04-17 18:09:48', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7932, '2019-04-17 18:09:48', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7933, '2019-04-17 18:09:48', 107, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7934, '2019-04-17 18:09:48', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7935, '2019-04-17 18:09:48', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7936, '2019-04-17 18:09:48', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7937, '2019-04-17 18:09:48', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7938, '2019-04-17 18:09:48', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7939, '2019-04-17 18:09:48', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7940, '2019-04-17 18:09:48', 19, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7941, '2019-04-17 18:09:48', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7942, '2019-04-17 18:09:48', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7943, '2019-04-17 18:09:48', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7944, '2019-04-17 18:09:48', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7945, '2019-04-17 18:09:48', 107, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7946, '2019-04-17 18:09:48', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7947, '2019-04-17 18:09:49', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7948, '2019-04-17 18:09:49', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7949, '2019-04-17 18:09:49', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7950, '2019-04-17 18:09:49', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7951, '2019-04-17 18:09:49', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7952, '2019-04-17 18:09:49', 19, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7953, '2019-04-17 18:09:49', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7954, '2019-04-17 18:09:49', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7955, '2019-04-17 18:09:49', 12, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7956, '2019-04-17 18:09:49', 19, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7957, '2019-04-17 18:09:49', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7958, '2019-04-17 18:09:49', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7959, '2019-04-17 18:09:49', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7960, '2019-04-17 18:09:49', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7961, '2019-04-17 18:09:49', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7962, '2019-04-17 18:09:49', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7963, '2019-04-17 18:09:49', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7964, '2019-04-17 18:09:49', 19, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7965, '2019-04-17 18:09:49', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7966, '2019-04-17 18:09:49', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7967, '2019-04-17 18:09:49', 12, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7968, '2019-04-17 18:09:49', 19, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7969, '2019-04-17 18:09:49', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7970, '2019-04-17 18:09:49', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7971, '2019-04-17 18:09:49', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7972, '2019-04-17 18:09:49', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7973, '2019-04-17 18:09:49', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7974, '2019-04-17 18:09:49', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7975, '2019-04-17 18:09:49', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7976, '2019-04-17 18:09:49', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7977, '2019-04-17 18:09:49', 96, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7978, '2019-04-17 18:09:49', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7979, '2019-04-17 18:09:49', 12, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7980, '2019-04-17 18:09:49', 19, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7981, '2019-04-17 18:09:49', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7982, '2019-04-17 18:09:49', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7983, '2019-04-17 18:09:50', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7984, '2019-04-17 18:09:50', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7985, '2019-04-17 18:09:50', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7986, '2019-04-17 18:09:50', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7987, '2019-04-17 18:09:50', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7988, '2019-04-17 18:09:50', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7989, '2019-04-17 18:09:50', 96, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7990, '2019-04-17 18:09:50', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7991, '2019-04-17 18:09:50', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7992, '2019-04-17 18:09:50', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7993, '2019-04-17 18:09:50', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7994, '2019-04-17 18:09:50', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7995, '2019-04-17 18:09:50', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7996, '2019-04-17 18:09:50', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7997, '2019-04-17 18:09:50', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7998, '2019-04-17 18:09:50', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7999, '2019-04-17 18:09:50', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8000, '2019-04-17 18:09:50', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8001, '2019-04-17 18:09:50', 96, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8002, '2019-04-17 18:09:50', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8003, '2019-04-17 18:09:50', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8004, '2019-04-17 18:09:50', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8005, '2019-04-17 18:09:50', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8006, '2019-04-17 18:09:50', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8007, '2019-04-17 18:09:50', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8008, '2019-04-17 18:09:50', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8009, '2019-04-17 18:09:50', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8010, '2019-04-17 18:09:50', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8011, '2019-04-17 18:09:50', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8012, '2019-04-17 18:09:50', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8013, '2019-04-17 18:09:50', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8014, '2019-04-17 18:09:50', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8015, '2019-04-17 18:09:50', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8016, '2019-04-17 18:09:50', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8017, '2019-04-17 18:09:50', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8018, '2019-04-17 18:09:50', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8019, '2019-04-17 18:09:51', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8020, '2019-04-17 18:09:51', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8021, '2019-04-17 18:09:51', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8022, '2019-04-17 18:09:51', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8023, '2019-04-17 18:09:51', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8024, '2019-04-17 18:09:51', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8025, '2019-04-17 18:09:51', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8026, '2019-04-17 18:09:51', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8027, '2019-04-17 18:09:51', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8028, '2019-04-17 18:09:51', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8029, '2019-04-17 18:09:51', 82, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8030, '2019-04-17 18:09:51', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8031, '2019-04-17 18:09:51', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8032, '2019-04-17 18:09:51', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8033, '2019-04-17 18:09:51', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8034, '2019-04-17 18:09:51', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8035, '2019-04-17 18:09:51', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8036, '2019-04-17 18:09:51', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8037, '2019-04-17 18:09:51', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8038, '2019-04-17 18:09:51', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8039, '2019-04-17 18:09:51', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8040, '2019-04-17 18:09:51', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8041, '2019-04-17 18:09:51', 82, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8042, '2019-04-17 18:09:51', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8043, '2019-04-17 18:09:51', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8044, '2019-04-17 18:09:51', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8045, '2019-04-17 18:09:51', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8046, '2019-04-17 18:09:51', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8047, '2019-04-17 18:09:51', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8048, '2019-04-17 18:09:51', 22, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8049, '2019-04-17 18:09:51', 119, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8050, '2019-04-17 18:09:51', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8051, '2019-04-17 18:09:51', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8052, '2019-04-17 18:09:51', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8053, '2019-04-17 18:09:51', 82, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8054, '2019-04-17 18:09:51', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8055, '2019-04-17 18:09:52', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8056, '2019-04-17 18:09:52', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8057, '2019-04-17 18:09:52', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8058, '2019-04-17 18:09:52', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8059, '2019-04-17 18:09:52', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8060, '2019-04-17 18:09:52', 22, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8061, '2019-04-17 18:09:52', 119, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8062, '2019-04-17 18:09:52', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8063, '2019-04-17 18:09:52', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8064, '2019-04-17 18:09:52', 23, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8065, '2019-04-17 18:09:52', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8066, '2019-04-17 18:09:52', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8067, '2019-04-17 18:09:52', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8068, '2019-04-17 18:09:52', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8069, '2019-04-17 18:09:52', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8070, '2019-04-17 18:09:52', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8071, '2019-04-17 18:09:52', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8072, '2019-04-17 18:09:52', 22, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8073, '2019-04-17 18:09:52', 119, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8074, '2019-04-17 18:09:52', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8075, '2019-04-17 18:09:52', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8076, '2019-04-17 18:09:52', 23, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8077, '2019-04-17 18:09:52', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8078, '2019-04-17 18:09:52', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8079, '2019-04-17 18:09:52', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8080, '2019-04-17 18:09:52', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8081, '2019-04-17 18:09:52', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8082, '2019-04-17 18:09:52', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8083, '2019-04-17 18:09:52', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8084, '2019-04-17 18:09:52', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8085, '2019-04-17 18:09:52', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8086, '2019-04-17 18:09:52', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8087, '2019-04-17 18:09:52', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8088, '2019-04-17 18:09:52', 23, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8089, '2019-04-17 18:09:52', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8090, '2019-04-17 18:09:52', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8091, '2019-04-17 18:09:53', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8092, '2019-04-17 18:09:53', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8093, '2019-04-17 18:09:53', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8094, '2019-04-17 18:09:53', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8095, '2019-04-17 18:09:53', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8096, '2019-04-17 18:09:53', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8097, '2019-04-17 18:09:53', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8098, '2019-04-17 18:09:53', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8099, '2019-04-17 18:09:53', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8100, '2019-04-17 18:09:53', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8101, '2019-04-17 18:09:53', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8102, '2019-04-17 18:09:53', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8103, '2019-04-17 18:09:53', 15, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8104, '2019-04-17 18:09:53', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8105, '2019-04-17 18:09:53', 107, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8106, '2019-04-17 18:09:53', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8107, '2019-04-17 18:09:53', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8108, '2019-04-17 18:09:53', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8109, '2019-04-17 18:09:53', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8110, '2019-04-17 18:09:53', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8111, '2019-04-17 18:09:53', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8112, '2019-04-17 18:09:53', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8113, '2019-04-17 18:09:53', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8114, '2019-04-17 18:09:53', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8115, '2019-04-17 18:09:53', 15, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8116, '2019-04-17 18:09:53', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8117, '2019-04-17 18:09:53', 107, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8118, '2019-04-17 18:09:53', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8119, '2019-04-17 18:09:53', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8120, '2019-04-17 18:09:53', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8121, '2019-04-17 18:09:53', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8122, '2019-04-17 18:09:53', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8123, '2019-04-17 18:09:53', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8124, '2019-04-17 18:09:53', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8125, '2019-04-17 18:09:53', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8126, '2019-04-17 18:09:53', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8127, '2019-04-17 18:09:54', 15, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8128, '2019-04-17 18:09:54', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8129, '2019-04-17 18:09:54', 107, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8130, '2019-04-17 18:09:54', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8131, '2019-04-17 18:09:54', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8132, '2019-04-17 18:09:54', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8133, '2019-04-17 18:09:54', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8134, '2019-04-17 18:09:54', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8135, '2019-04-17 18:09:54', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8136, '2019-04-17 18:09:54', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8137, '2019-04-17 18:09:54', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8138, '2019-04-17 18:09:54', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8139, '2019-04-17 18:09:54', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8140, '2019-04-17 18:09:54', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8141, '2019-04-17 18:09:54', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8142, '2019-04-17 18:09:54', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8143, '2019-04-17 18:09:54', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8144, '2019-04-17 18:09:54', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8145, '2019-04-17 18:09:54', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8146, '2019-04-17 18:09:54', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8147, '2019-04-17 18:09:54', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8148, '2019-04-17 18:09:54', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8149, '2019-04-17 18:09:54', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8150, '2019-04-17 18:09:54', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8151, '2019-04-17 18:09:54', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8152, '2019-04-17 18:09:54', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8153, '2019-04-17 18:09:54', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8154, '2019-04-17 18:09:54', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8155, '2019-04-17 18:09:54', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8156, '2019-04-17 18:09:54', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8157, '2019-04-17 18:09:54', 98, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8158, '2019-04-17 18:09:54', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8159, '2019-04-17 18:09:54', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8160, '2019-04-17 18:09:54', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8161, '2019-04-17 18:09:54', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8162, '2019-04-17 18:09:54', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8163, '2019-04-17 18:09:55', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8164, '2019-04-17 18:09:55', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8165, '2019-04-17 18:09:55', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8166, '2019-04-17 18:09:55', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8167, '2019-04-17 18:09:55', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8168, '2019-04-17 18:09:55', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8169, '2019-04-17 18:09:55', 98, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8170, '2019-04-17 18:09:55', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8171, '2019-04-17 18:09:55', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8172, '2019-04-17 18:09:55', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8173, '2019-04-17 18:09:55', 84, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8174, '2019-04-17 18:09:55', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8175, '2019-04-17 18:09:55', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8176, '2019-04-17 18:09:55', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8177, '2019-04-17 18:09:55', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8178, '2019-04-17 18:09:55', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8179, '2019-04-17 18:09:55', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8180, '2019-04-17 18:09:55', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8181, '2019-04-17 18:09:55', 98, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8182, '2019-04-17 18:09:55', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8183, '2019-04-17 18:09:55', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8184, '2019-04-17 18:09:55', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8185, '2019-04-17 18:09:55', 84, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8186, '2019-04-17 18:09:55', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8187, '2019-04-17 18:09:55', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8188, '2019-04-17 18:09:55', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8189, '2019-04-17 18:09:55', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8190, '2019-04-17 18:09:55', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8191, '2019-04-17 18:09:55', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8192, '2019-04-17 18:09:55', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8193, '2019-04-17 18:09:55', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8194, '2019-04-17 18:09:55', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8195, '2019-04-17 18:09:55', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8196, '2019-04-17 18:09:55', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8197, '2019-04-17 18:09:55', 84, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8198, '2019-04-17 18:09:55', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8199, '2019-04-17 18:09:56', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8200, '2019-04-17 18:09:56', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8201, '2019-04-17 18:09:56', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8202, '2019-04-17 18:09:56', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8203, '2019-04-17 18:09:56', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8204, '2019-04-17 18:09:56', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8205, '2019-04-17 18:09:56', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8206, '2019-04-17 18:09:56', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8207, '2019-04-17 18:09:56', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8208, '2019-04-17 18:09:56', 27, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8209, '2019-04-17 18:09:56', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8210, '2019-04-17 18:09:56', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8211, '2019-04-17 18:09:56', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8212, '2019-04-17 18:09:56', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8213, '2019-04-17 18:09:56', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8214, '2019-04-17 18:09:56', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8215, '2019-04-17 18:09:56', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8216, '2019-04-17 18:09:56', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8217, '2019-04-17 18:09:56', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8218, '2019-04-17 18:09:56', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8219, '2019-04-17 18:09:56', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8220, '2019-04-17 18:09:56', 27, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8221, '2019-04-17 18:09:56', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8222, '2019-04-17 18:09:56', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8223, '2019-04-17 18:09:56', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8224, '2019-04-17 18:09:56', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8225, '2019-04-17 18:09:56', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8226, '2019-04-17 18:09:56', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8227, '2019-04-17 18:09:56', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8228, '2019-04-17 18:09:56', 27, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8229, '2019-04-17 18:09:56', 2515, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8230, '2019-04-17 18:09:56', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8231, '2019-04-17 18:09:56', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8232, '2019-04-17 18:09:56', 27, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8233, '2019-04-17 18:09:56', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8234, '2019-04-17 18:09:56', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8235, '2019-04-17 18:09:57', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8236, '2019-04-17 18:09:57', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8237, '2019-04-17 18:09:57', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8238, '2019-04-17 18:09:57', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8239, '2019-04-17 18:09:57', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8240, '2019-04-17 18:09:57', 27, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8241, '2019-04-17 18:09:57', 2515, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8242, '2019-04-17 18:09:57', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8243, '2019-04-17 18:09:57', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8244, '2019-04-17 18:09:57', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8245, '2019-04-17 18:09:57', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8246, '2019-04-17 18:09:57', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8247, '2019-04-17 18:09:57', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8248, '2019-04-17 18:09:57', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8249, '2019-04-17 18:09:57', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8250, '2019-04-17 18:09:57', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8251, '2019-04-17 18:09:57', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8252, '2019-04-17 18:09:57', 27, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8253, '2019-04-17 18:09:57', 2515, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8254, '2019-04-17 18:09:57', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8255, '2019-04-17 18:09:57', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8256, '2019-04-17 18:09:57', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8257, '2019-04-17 18:09:57', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8258, '2019-04-17 18:09:57', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8259, '2019-04-17 18:09:57', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8260, '2019-04-17 18:09:57', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8261, '2019-04-17 18:09:57', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8262, '2019-04-17 18:09:57', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8263, '2019-04-17 18:09:57', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8264, '2019-04-17 18:09:57', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8265, '2019-04-17 18:09:57', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8266, '2019-04-17 18:09:57', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8267, '2019-04-17 18:09:57', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8268, '2019-04-17 18:09:57', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8269, '2019-04-17 18:09:57', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8270, '2019-04-17 18:09:57', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8271, '2019-04-17 18:09:58', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8272, '2019-04-17 18:09:58', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8273, '2019-04-17 18:09:58', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8274, '2019-04-17 18:09:58', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8275, '2019-04-17 18:09:58', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8276, '2019-04-17 18:09:58', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8277, '2019-04-17 18:09:58', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8278, '2019-04-17 18:09:58', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8279, '2019-04-17 18:09:58', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8280, '2019-04-17 18:09:58', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8281, '2019-04-17 18:09:58', 2478, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8282, '2019-04-17 18:09:58', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8283, '2019-04-17 18:09:58', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8284, '2019-04-17 18:09:58', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8285, '2019-04-17 18:09:58', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8286, '2019-04-17 18:09:58', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8287, '2019-04-17 18:09:58', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8288, '2019-04-17 18:09:58', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8289, '2019-04-17 18:09:58', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8290, '2019-04-17 18:09:58', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8291, '2019-04-17 18:09:58', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8292, '2019-04-17 18:09:58', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8293, '2019-04-17 18:09:58', 2478, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8294, '2019-04-17 18:09:58', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8295, '2019-04-17 18:09:58', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8296, '2019-04-17 18:09:58', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8297, '2019-04-17 18:09:58', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8298, '2019-04-17 18:09:58', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8299, '2019-04-17 18:09:58', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8300, '2019-04-17 18:09:58', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8301, '2019-04-17 18:09:58', 2487, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8302, '2019-04-17 18:09:58', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8303, '2019-04-17 18:09:58', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8304, '2019-04-17 18:09:58', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8305, '2019-04-17 18:09:58', 2478, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8306, '2019-04-17 18:09:58', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8307, '2019-04-17 18:09:59', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8308, '2019-04-17 18:09:59', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8309, '2019-04-17 18:09:59', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8310, '2019-04-17 18:09:59', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8311, '2019-04-17 18:09:59', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8312, '2019-04-17 18:09:59', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8313, '2019-04-17 18:09:59', 2487, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8314, '2019-04-17 18:09:59', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8315, '2019-04-17 18:09:59', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8316, '2019-04-17 18:09:59', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8317, '2019-04-17 18:09:59', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8318, '2019-04-17 18:09:59', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8319, '2019-04-17 18:09:59', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8320, '2019-04-17 18:09:59', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8321, '2019-04-17 18:09:59', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8322, '2019-04-17 18:09:59', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8323, '2019-04-17 18:09:59', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8324, '2019-04-17 18:09:59', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8325, '2019-04-17 18:09:59', 2487, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8326, '2019-04-17 18:09:59', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8327, '2019-04-17 18:09:59', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8328, '2019-04-17 18:09:59', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8329, '2019-04-17 18:09:59', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8330, '2019-04-17 18:09:59', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8331, '2019-04-17 18:09:59', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8332, '2019-04-17 18:09:59', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8333, '2019-04-17 18:09:59', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8334, '2019-04-17 18:09:59', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8335, '2019-04-17 18:09:59', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8336, '2019-04-17 18:09:59', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8337, '2019-04-17 18:09:59', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8338, '2019-04-17 18:09:59', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8339, '2019-04-17 18:09:59', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8340, '2019-04-17 18:09:59', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8341, '2019-04-17 18:09:59', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8342, '2019-04-17 18:09:59', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8343, '2019-04-17 18:10:00', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8344, '2019-04-17 18:10:00', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8345, '2019-04-17 18:10:00', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8346, '2019-04-17 18:10:00', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8347, '2019-04-17 18:10:00', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8348, '2019-04-17 18:10:00', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8349, '2019-04-17 18:10:00', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8350, '2019-04-17 18:10:00', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8351, '2019-04-17 18:10:00', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8352, '2019-04-17 18:10:00', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8353, '2019-04-17 18:10:00', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8354, '2019-04-17 18:10:00', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8355, '2019-04-17 18:10:00', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8356, '2019-04-17 18:10:00', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8357, '2019-04-17 18:10:00', 2510, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8358, '2019-04-17 18:10:00', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8359, '2019-04-17 18:10:00', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8360, '2019-04-17 18:10:00', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8361, '2019-04-17 18:10:00', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8362, '2019-04-17 18:10:00', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8363, '2019-04-17 18:10:00', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8364, '2019-04-17 18:10:00', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8365, '2019-04-17 18:10:00', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8366, '2019-04-17 18:10:00', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8367, '2019-04-17 18:10:01', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8368, '2019-04-17 18:10:01', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8369, '2019-04-17 18:10:01', 2510, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8370, '2019-04-17 18:10:01', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8371, '2019-04-17 18:10:01', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8372, '2019-04-17 18:10:01', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8373, '2019-04-17 18:10:01', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8374, '2019-04-17 18:10:01', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8375, '2019-04-17 18:10:01', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8376, '2019-04-17 18:10:01', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8377, '2019-04-17 18:10:01', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8378, '2019-04-17 18:10:01', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8379, '2019-04-17 18:10:01', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8380, '2019-04-17 18:10:01', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8381, '2019-04-17 18:10:01', 2510, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8382, '2019-04-17 18:10:01', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8383, '2019-04-17 18:10:01', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8384, '2019-04-17 18:10:01', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8385, '2019-04-17 18:10:01', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8386, '2019-04-17 18:10:01', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8387, '2019-04-17 18:10:01', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8388, '2019-04-17 18:10:01', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8389, '2019-04-17 18:10:01', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8390, '2019-04-17 18:10:01', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8391, '2019-04-17 18:10:01', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8392, '2019-04-17 18:10:01', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8393, '2019-04-17 18:10:01', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8394, '2019-04-17 18:10:01', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8395, '2019-04-17 18:10:01', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8396, '2019-04-17 18:10:01', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8397, '2019-04-17 18:10:01', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8398, '2019-04-17 18:10:01', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8399, '2019-04-17 18:10:01', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8400, '2019-04-17 18:10:01', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8401, '2019-04-17 18:10:01', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8402, '2019-04-17 18:10:01', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8403, '2019-04-17 18:10:02', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8404, '2019-04-17 18:10:02', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8405, '2019-04-17 18:10:02', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8406, '2019-04-17 18:10:02', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8407, '2019-04-17 18:10:02', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8408, '2019-04-17 18:10:02', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8409, '2019-04-17 18:10:02', 2494, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8410, '2019-04-17 18:10:02', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8411, '2019-04-17 18:10:02', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8412, '2019-04-17 18:10:02', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8413, '2019-04-17 18:10:02', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8414, '2019-04-17 18:10:02', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8415, '2019-04-17 18:10:02', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8416, '2019-04-17 18:10:02', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8417, '2019-04-17 18:10:02', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8418, '2019-04-17 18:10:02', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8419, '2019-04-17 18:10:02', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8420, '2019-04-17 18:10:02', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8421, '2019-04-17 18:10:02', 2494, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8422, '2019-04-17 18:10:02', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8423, '2019-04-17 18:10:02', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8424, '2019-04-17 18:10:02', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8425, '2019-04-17 18:10:02', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8426, '2019-04-17 18:10:02', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8427, '2019-04-17 18:10:02', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8428, '2019-04-17 18:10:02', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8429, '2019-04-17 18:10:02', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8430, '2019-04-17 18:10:02', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8431, '2019-04-17 18:10:02', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8432, '2019-04-17 18:10:02', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8433, '2019-04-17 18:10:02', 2494, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8434, '2019-04-17 18:10:02', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8435, '2019-04-17 18:10:02', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8436, '2019-04-17 18:10:02', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8437, '2019-04-17 18:10:02', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8438, '2019-04-17 18:10:02', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8439, '2019-04-17 18:10:03', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8440, '2019-04-17 18:10:03', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8441, '2019-04-17 18:10:03', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8442, '2019-04-17 18:10:03', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8443, '2019-04-17 18:10:03', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8444, '2019-04-17 18:10:03', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8445, '2019-04-17 18:10:03', 2497, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8446, '2019-04-17 18:10:03', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8447, '2019-04-17 18:10:03', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8448, '2019-04-17 18:10:03', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8449, '2019-04-17 18:10:03', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8450, '2019-04-17 18:10:03', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8451, '2019-04-17 18:10:03', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8452, '2019-04-17 18:10:03', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8453, '2019-04-17 18:10:03', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8454, '2019-04-17 18:10:03', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8455, '2019-04-17 18:10:03', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8456, '2019-04-17 18:10:03', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8457, '2019-04-17 18:10:03', 2497, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8458, '2019-04-17 18:10:03', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8459, '2019-04-17 18:10:03', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8460, '2019-04-17 18:10:03', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8461, '2019-04-17 18:10:03', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8462, '2019-04-17 18:10:03', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8463, '2019-04-17 18:10:03', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8464, '2019-04-17 18:10:03', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8465, '2019-04-17 18:10:03', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8466, '2019-04-17 18:10:03', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8467, '2019-04-17 18:10:03', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8468, '2019-04-17 18:10:03', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8469, '2019-04-17 18:10:03', 2497, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8470, '2019-04-17 18:10:03', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8471, '2019-04-17 18:10:03', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8472, '2019-04-17 18:10:03', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8473, '2019-04-17 18:10:03', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8474, '2019-04-17 18:10:03', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8475, '2019-04-17 18:10:04', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8476, '2019-04-17 18:10:04', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8477, '2019-04-17 18:10:04', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8478, '2019-04-17 18:10:04', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8479, '2019-04-17 18:10:04', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8480, '2019-04-17 18:10:04', 31, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8481, '2019-04-17 18:10:04', 2517, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8482, '2019-04-17 18:10:04', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8483, '2019-04-17 18:10:04', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8484, '2019-04-17 18:10:04', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8485, '2019-04-17 18:10:04', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8486, '2019-04-17 18:10:04', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8487, '2019-04-17 18:10:04', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8488, '2019-04-17 18:10:04', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8489, '2019-04-17 18:10:04', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8490, '2019-04-17 18:10:04', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8491, '2019-04-17 18:10:04', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8492, '2019-04-17 18:10:04', 31, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8493, '2019-04-17 18:10:04', 2517, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8494, '2019-04-17 18:10:04', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8495, '2019-04-17 18:10:04', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8496, '2019-04-17 18:10:04', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8497, '2019-04-17 18:10:04', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8498, '2019-04-17 18:10:04', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8499, '2019-04-17 18:10:04', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8500, '2019-04-17 18:10:04', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8501, '2019-04-17 18:10:04', 2490, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8502, '2019-04-17 18:10:04', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8503, '2019-04-17 18:10:04', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8504, '2019-04-17 18:10:04', 31, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8505, '2019-04-17 18:10:04', 2517, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8506, '2019-04-17 18:10:04', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8507, '2019-04-17 18:10:04', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8508, '2019-04-17 18:10:04', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8509, '2019-04-17 18:10:04', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8510, '2019-04-17 18:10:04', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8511, '2019-04-17 18:10:05', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8512, '2019-04-17 18:10:05', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8513, '2019-04-17 18:10:05', 2490, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8514, '2019-04-17 18:10:05', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8515, '2019-04-17 18:10:05', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8516, '2019-04-17 18:10:05', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8517, '2019-04-17 18:10:05', 2481, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8518, '2019-04-17 18:10:05', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8519, '2019-04-17 18:10:05', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8520, '2019-04-17 18:10:05', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8521, '2019-04-17 18:10:05', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8522, '2019-04-17 18:10:05', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8523, '2019-04-17 18:10:05', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8524, '2019-04-17 18:10:05', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8525, '2019-04-17 18:10:05', 2490, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8526, '2019-04-17 18:10:05', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8527, '2019-04-17 18:10:05', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8528, '2019-04-17 18:10:05', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8529, '2019-04-17 18:10:05', 2481, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8530, '2019-04-17 18:10:05', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8531, '2019-04-17 18:10:05', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8532, '2019-04-17 18:10:05', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8533, '2019-04-17 18:10:05', 2517, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8534, '2019-04-17 18:10:05', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8535, '2019-04-17 18:10:05', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8536, '2019-04-17 18:10:05', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8537, '2019-04-17 18:10:05', 2485, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8538, '2019-04-17 18:10:05', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8539, '2019-04-17 18:10:05', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8540, '2019-04-17 18:10:05', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8541, '2019-04-17 18:10:05', 2481, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8542, '2019-04-17 18:10:05', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8543, '2019-04-17 18:10:05', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8544, '2019-04-17 18:10:05', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8545, '2019-04-17 18:10:05', 2517, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8546, '2019-04-17 18:10:05', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8547, '2019-04-17 18:10:06', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8548, '2019-04-17 18:10:06', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8549, '2019-04-17 18:10:06', 2485, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8550, '2019-04-17 18:10:06', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8551, '2019-04-17 18:10:06', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8552, '2019-04-17 18:10:06', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8553, '2019-04-17 18:10:06', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8554, '2019-04-17 18:10:06', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8555, '2019-04-17 18:10:06', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8556, '2019-04-17 18:10:06', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8557, '2019-04-17 18:10:06', 2517, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8558, '2019-04-17 18:10:06', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8559, '2019-04-17 18:10:06', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8560, '2019-04-17 18:10:06', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8561, '2019-04-17 18:10:06', 2485, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8562, '2019-04-17 18:10:06', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8563, '2019-04-17 18:10:06', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8564, '2019-04-17 18:10:06', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8565, '2019-04-17 18:10:06', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8566, '2019-04-17 18:10:06', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8567, '2019-04-17 18:10:06', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8568, '2019-04-17 18:10:06', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8569, '2019-04-17 18:10:06', 2499, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8570, '2019-04-17 18:10:06', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8571, '2019-04-17 18:10:06', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8572, '2019-04-17 18:10:06', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8573, '2019-04-17 18:10:06', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8574, '2019-04-17 18:10:06', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8575, '2019-04-17 18:10:06', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8576, '2019-04-17 18:10:06', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8577, '2019-04-17 18:10:06', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8578, '2019-04-17 18:10:06', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8579, '2019-04-17 18:10:06', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8580, '2019-04-17 18:10:06', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8581, '2019-04-17 18:10:06', 2499, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8582, '2019-04-17 18:10:06', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8583, '2019-04-17 18:10:07', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8584, '2019-04-17 18:10:07', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8585, '2019-04-17 18:10:07', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8586, '2019-04-17 18:10:07', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8587, '2019-04-17 18:10:07', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8588, '2019-04-17 18:10:07', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8589, '2019-04-17 18:10:07', 2492, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8590, '2019-04-17 18:10:07', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8591, '2019-04-17 18:10:07', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8592, '2019-04-17 18:10:07', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8593, '2019-04-17 18:10:07', 2499, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8594, '2019-04-17 18:10:07', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8595, '2019-04-17 18:10:07', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8596, '2019-04-17 18:10:07', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8597, '2019-04-17 18:10:07', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8598, '2019-04-17 18:10:07', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8599, '2019-04-17 18:10:07', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8600, '2019-04-17 18:10:07', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8601, '2019-04-17 18:10:07', 2492, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8602, '2019-04-17 18:10:07', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8603, '2019-04-17 18:10:07', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8604, '2019-04-17 18:10:07', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8605, '2019-04-17 18:10:07', 2513, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8606, '2019-04-17 18:10:07', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8607, '2019-04-17 18:10:07', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8608, '2019-04-17 18:10:07', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8609, '2019-04-17 18:10:07', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8610, '2019-04-17 18:10:07', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8611, '2019-04-17 18:10:07', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8612, '2019-04-17 18:10:07', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8613, '2019-04-17 18:10:07', 2492, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8614, '2019-04-17 18:10:07', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8615, '2019-04-17 18:10:07', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8616, '2019-04-17 18:10:07', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8617, '2019-04-17 18:10:07', 2513, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8618, '2019-04-17 18:10:07', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8619, '2019-04-17 18:10:08', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8620, '2019-04-17 18:10:08', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8621, '2019-04-17 18:10:08', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8622, '2019-04-17 18:10:08', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8623, '2019-04-17 18:10:08', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8624, '2019-04-17 18:10:08', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8625, '2019-04-17 18:10:08', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8626, '2019-04-17 18:10:08', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8627, '2019-04-17 18:10:08', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8628, '2019-04-17 18:10:08', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8629, '2019-04-17 18:10:08', 2513, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8630, '2019-04-17 18:10:08', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8631, '2019-04-17 18:10:08', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8632, '2019-04-17 18:10:08', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8633, '2019-04-17 18:10:08', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8634, '2019-04-17 18:10:08', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8635, '2019-04-17 18:10:08', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8636, '2019-04-17 18:10:08', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8637, '2019-04-17 18:10:08', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8638, '2019-04-17 18:10:08', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8639, '2019-04-17 18:10:08', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8640, '2019-04-17 18:10:08', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8641, '2019-04-17 18:10:08', 2508, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8642, '2019-04-17 18:10:08', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8643, '2019-04-17 18:10:08', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8644, '2019-04-17 18:10:08', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8645, '2019-04-17 18:10:08', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8646, '2019-04-17 18:10:08', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8647, '2019-04-17 18:10:08', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8648, '2019-04-17 18:10:08', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8649, '2019-04-17 18:10:08', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8650, '2019-04-17 18:10:08', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8651, '2019-04-17 18:10:08', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8652, '2019-04-17 18:10:08', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8653, '2019-04-17 18:10:08', 2508, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8654, '2019-04-17 18:10:08', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8655, '2019-04-17 18:10:09', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8656, '2019-04-17 18:10:09', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8657, '2019-04-17 18:10:09', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8658, '2019-04-17 18:10:09', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8659, '2019-04-17 18:10:09', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8660, '2019-04-17 18:10:09', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8661, '2019-04-17 18:10:09', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8662, '2019-04-17 18:10:09', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8663, '2019-04-17 18:10:09', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8664, '2019-04-17 18:10:09', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8665, '2019-04-17 18:10:09', 2508, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8666, '2019-04-17 18:10:09', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8667, '2019-04-17 18:10:09', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8668, '2019-04-17 18:10:09', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8669, '2019-04-17 18:10:09', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8670, '2019-04-17 18:10:09', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8671, '2019-04-17 18:10:09', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8672, '2019-04-17 18:10:09', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8673, '2019-04-17 18:10:09', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8674, '2019-04-17 18:10:09', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8675, '2019-04-17 18:10:09', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8676, '2019-04-17 18:10:09', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8677, '2019-04-17 18:10:09', 2503, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8678, '2019-04-17 18:10:09', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8679, '2019-04-17 18:10:09', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8680, '2019-04-17 18:10:09', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8681, '2019-04-17 18:10:09', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8682, '2019-04-17 18:10:09', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8683, '2019-04-17 18:10:09', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8684, '2019-04-17 18:10:09', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8685, '2019-04-17 18:10:09', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8686, '2019-04-17 18:10:09', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8687, '2019-04-17 18:10:09', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8688, '2019-04-17 18:10:09', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8689, '2019-04-17 18:10:09', 2503, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8690, '2019-04-17 18:10:09', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8691, '2019-04-17 18:10:10', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8692, '2019-04-17 18:10:10', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8693, '2019-04-17 18:10:10', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8694, '2019-04-17 18:10:10', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8695, '2019-04-17 18:10:10', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8696, '2019-04-17 18:10:10', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8697, '2019-04-17 18:10:10', 2510, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8698, '2019-04-17 18:10:10', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8699, '2019-04-17 18:10:10', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8700, '2019-04-17 18:10:10', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8701, '2019-04-17 18:10:10', 2503, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8702, '2019-04-17 18:10:10', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8703, '2019-04-17 18:10:10', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8704, '2019-04-17 18:10:10', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8705, '2019-04-17 18:10:10', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8706, '2019-04-17 18:10:10', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8707, '2019-04-17 18:10:10', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8708, '2019-04-17 18:10:10', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8709, '2019-04-17 18:10:10', 2510, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8710, '2019-04-17 18:10:10', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8711, '2019-04-17 18:10:10', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8712, '2019-04-17 18:10:10', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8713, '2019-04-17 18:10:10', 2501, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8714, '2019-04-17 18:10:10', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8715, '2019-04-17 18:10:10', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8716, '2019-04-17 18:10:10', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8717, '2019-04-17 18:10:10', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8718, '2019-04-17 18:10:10', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8719, '2019-04-17 18:10:10', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8720, '2019-04-17 18:10:10', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8721, '2019-04-17 18:10:10', 2510, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8722, '2019-04-17 18:10:10', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8723, '2019-04-17 18:10:10', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8724, '2019-04-17 18:10:10', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8725, '2019-04-17 18:10:10', 2501, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8726, '2019-04-17 18:10:10', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8727, '2019-04-17 18:10:11', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8728, '2019-04-17 18:10:11', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8729, '2019-04-17 18:10:11', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8730, '2019-04-17 18:10:11', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8731, '2019-04-17 18:10:11', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8732, '2019-04-17 18:10:11', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8733, '2019-04-17 18:10:11', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8734, '2019-04-17 18:10:11', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8735, '2019-04-17 18:10:11', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8736, '2019-04-17 18:10:11', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8737, '2019-04-17 18:10:11', 2501, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8738, '2019-04-17 18:10:11', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8739, '2019-04-17 18:10:11', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8740, '2019-04-17 18:10:11', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8741, '2019-04-17 18:10:11', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8742, '2019-04-17 18:10:11', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8743, '2019-04-17 18:10:11', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8744, '2019-04-17 18:10:11', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8745, '2019-04-17 18:10:11', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8746, '2019-04-17 18:10:11', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8747, '2019-04-17 18:10:11', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8748, '2019-04-17 18:10:11', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8749, '2019-04-17 18:10:11', 2485, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8750, '2019-04-17 18:10:11', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8751, '2019-04-17 18:10:11', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8752, '2019-04-17 18:10:11', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8753, '2019-04-17 18:10:11', 2513, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8754, '2019-04-17 18:10:11', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8755, '2019-04-17 18:10:11', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8756, '2019-04-17 18:10:11', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8757, '2019-04-17 18:10:11', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8758, '2019-04-17 18:10:11', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8759, '2019-04-17 18:10:11', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8760, '2019-04-17 18:10:11', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8761, '2019-04-17 18:10:11', 2485, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8762, '2019-04-17 18:10:11', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8763, '2019-04-17 18:10:12', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8764, '2019-04-17 18:10:12', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8765, '2019-04-17 18:10:12', 2513, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8766, '2019-04-17 18:10:12', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8767, '2019-04-17 18:10:12', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8768, '2019-04-17 18:10:12', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8769, '2019-04-17 18:10:12', 2503, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8770, '2019-04-17 18:10:12', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8771, '2019-04-17 18:10:12', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8772, '2019-04-17 18:10:12', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8773, '2019-04-17 18:10:12', 2485, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8774, '2019-04-17 18:10:12', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8775, '2019-04-17 18:10:12', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8776, '2019-04-17 18:10:12', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8777, '2019-04-17 18:10:12', 2513, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8778, '2019-04-17 18:10:12', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8779, '2019-04-17 18:10:12', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8780, '2019-04-17 18:10:12', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8781, '2019-04-17 18:10:12', 2503, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8782, '2019-04-17 18:10:12', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8783, '2019-04-17 18:10:12', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8784, '2019-04-17 18:10:12', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8785, '2019-04-17 18:10:12', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8786, '2019-04-17 18:10:12', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8787, '2019-04-17 18:10:12', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8788, '2019-04-17 18:10:12', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8789, '2019-04-17 18:10:12', 2503, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8790, '2019-04-17 18:10:12', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8791, '2019-04-17 18:10:12', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8792, '2019-04-17 18:10:12', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8793, '2019-04-17 18:10:12', 2503, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8794, '2019-04-17 18:10:12', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8795, '2019-04-17 18:10:12', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8796, '2019-04-17 18:10:12', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8797, '2019-04-17 18:10:12', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8798, '2019-04-17 18:10:12', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8799, '2019-04-17 18:10:13', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8800, '2019-04-17 18:10:13', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8801, '2019-04-17 18:10:13', 2503, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8802, '2019-04-17 18:10:13', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8803, '2019-04-17 18:10:13', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8804, '2019-04-17 18:10:13', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8805, '2019-04-17 18:10:13', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8806, '2019-04-17 18:10:13', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8807, '2019-04-17 18:10:13', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8808, '2019-04-17 18:10:13', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8809, '2019-04-17 18:10:13', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8810, '2019-04-17 18:10:13', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8811, '2019-04-17 18:10:13', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8812, '2019-04-17 18:10:13', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8813, '2019-04-17 18:10:13', 2503, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8814, '2019-04-17 18:10:13', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8815, '2019-04-17 18:10:13', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8816, '2019-04-17 18:10:13', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8817, '2019-04-17 18:10:13', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8818, '2019-04-17 18:10:13', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8819, '2019-04-17 18:10:13', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8820, '2019-04-17 18:10:13', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8821, '2019-04-17 18:10:13', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8822, '2019-04-17 18:10:13', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8823, '2019-04-17 18:10:14', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8824, '2019-04-17 18:10:14', 26, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8825, '2019-04-17 18:10:14', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8826, '2019-04-17 18:10:14', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8827, '2019-04-17 18:10:14', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8828, '2019-04-17 18:10:14', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8829, '2019-04-17 18:10:14', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8830, '2019-04-17 18:10:14', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8831, '2019-04-17 18:10:14', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8832, '2019-04-17 18:10:14', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8833, '2019-04-17 18:10:14', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8834, '2019-04-17 18:10:14', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8835, '2019-04-17 18:10:14', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8836, '2019-04-17 18:10:14', 26, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8837, '2019-04-17 18:10:14', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8838, '2019-04-17 18:10:14', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8839, '2019-04-17 18:10:14', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8840, '2019-04-17 18:10:14', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8841, '2019-04-17 18:10:14', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8842, '2019-04-17 18:10:14', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8843, '2019-04-17 18:10:14', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8844, '2019-04-17 18:10:14', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8845, '2019-04-17 18:10:14', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8846, '2019-04-17 18:10:14', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8847, '2019-04-17 18:10:14', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8848, '2019-04-17 18:10:14', 26, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8849, '2019-04-17 18:10:14', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8850, '2019-04-17 18:10:14', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8851, '2019-04-17 18:10:14', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8852, '2019-04-17 18:10:14', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8853, '2019-04-17 18:10:14', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8854, '2019-04-17 18:10:14', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8855, '2019-04-17 18:10:14', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8856, '2019-04-17 18:10:14', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8857, '2019-04-17 18:10:14', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8858, '2019-04-17 18:10:14', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8859, '2019-04-17 18:10:14', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8860, '2019-04-17 18:10:14', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8861, '2019-04-17 18:10:14', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8862, '2019-04-17 18:10:14', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8863, '2019-04-17 18:10:14', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8864, '2019-04-17 18:10:14', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8865, '2019-04-17 18:10:14', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8866, '2019-04-17 18:10:14', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8867, '2019-04-17 18:10:14', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8868, '2019-04-17 18:10:14', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8869, '2019-04-17 18:10:14', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8870, '2019-04-17 18:10:14', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8871, '2019-04-17 18:10:15', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8872, '2019-04-17 18:10:15', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8873, '2019-04-17 18:10:15', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8874, '2019-04-17 18:10:15', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8875, '2019-04-17 18:10:15', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8876, '2019-04-17 18:10:15', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8877, '2019-04-17 18:10:15', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8878, '2019-04-17 18:10:15', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8879, '2019-04-17 18:10:15', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8880, '2019-04-17 18:10:15', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8881, '2019-04-17 18:10:15', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8882, '2019-04-17 18:10:15', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8883, '2019-04-17 18:10:15', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8884, '2019-04-17 18:10:15', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8885, '2019-04-17 18:10:15', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8886, '2019-04-17 18:10:15', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8887, '2019-04-17 18:10:15', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8888, '2019-04-17 18:10:15', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8889, '2019-04-17 18:10:15', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8890, '2019-04-17 18:10:15', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8891, '2019-04-17 18:10:15', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8892, '2019-04-17 18:10:15', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8893, '2019-04-17 18:10:15', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8894, '2019-04-17 18:10:15', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8895, '2019-04-17 18:10:15', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8896, '2019-04-17 18:10:15', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8897, '2019-04-17 18:10:15', 102, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8898, '2019-04-17 18:10:15', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8899, '2019-04-17 18:10:15', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8900, '2019-04-17 18:10:15', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8901, '2019-04-17 18:10:15', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8902, '2019-04-17 18:10:15', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8903, '2019-04-17 18:10:15', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8904, '2019-04-17 18:10:15', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8905, '2019-04-17 18:10:15', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8906, '2019-04-17 18:10:15', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8907, '2019-04-17 18:10:16', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8908, '2019-04-17 18:10:16', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8909, '2019-04-17 18:10:16', 102, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8910, '2019-04-17 18:10:16', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8911, '2019-04-17 18:10:16', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8912, '2019-04-17 18:10:16', 24, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8913, '2019-04-17 18:10:16', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8914, '2019-04-17 18:10:16', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8915, '2019-04-17 18:10:16', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8916, '2019-04-17 18:10:16', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8917, '2019-04-17 18:10:16', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8918, '2019-04-17 18:10:16', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8919, '2019-04-17 18:10:16', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8920, '2019-04-17 18:10:16', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8921, '2019-04-17 18:10:16', 102, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8922, '2019-04-17 18:10:16', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8923, '2019-04-17 18:10:16', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8924, '2019-04-17 18:10:16', 24, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8925, '2019-04-17 18:10:16', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8926, '2019-04-17 18:10:16', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8927, '2019-04-17 18:10:16', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8928, '2019-04-17 18:10:16', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8929, '2019-04-17 18:10:16', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8930, '2019-04-17 18:10:16', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8931, '2019-04-17 18:10:17', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8932, '2019-04-17 18:10:17', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8933, '2019-04-17 18:10:17', 93, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8934, '2019-04-17 18:10:17', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8935, '2019-04-17 18:10:17', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8936, '2019-04-17 18:10:17', 24, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8937, '2019-04-17 18:10:17', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8938, '2019-04-17 18:10:17', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8939, '2019-04-17 18:10:17', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8940, '2019-04-17 18:10:17', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8941, '2019-04-17 18:10:17', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8942, '2019-04-17 18:10:17', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8943, '2019-04-17 18:10:17', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8944, '2019-04-17 18:10:17', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8945, '2019-04-17 18:10:17', 93, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8946, '2019-04-17 18:10:17', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8947, '2019-04-17 18:10:17', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8948, '2019-04-17 18:10:17', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8949, '2019-04-17 18:10:17', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8950, '2019-04-17 18:10:17', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8951, '2019-04-17 18:10:17', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8952, '2019-04-17 18:10:17', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8953, '2019-04-17 18:10:17', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8954, '2019-04-17 18:10:17', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8955, '2019-04-17 18:10:17', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8956, '2019-04-17 18:10:17', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8957, '2019-04-17 18:10:17', 93, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8958, '2019-04-17 18:10:17', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8959, '2019-04-17 18:10:17', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8960, '2019-04-17 18:10:17', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8961, '2019-04-17 18:10:17', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8962, '2019-04-17 18:10:17', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8963, '2019-04-17 18:10:17', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8964, '2019-04-17 18:10:17', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8965, '2019-04-17 18:10:17', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8966, '2019-04-17 18:10:17', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8967, '2019-04-17 18:10:17', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8968, '2019-04-17 18:10:17', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8969, '2019-04-17 18:10:17', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8970, '2019-04-17 18:10:17', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8971, '2019-04-17 18:10:17', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8972, '2019-04-17 18:10:17', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8973, '2019-04-17 18:10:17', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8974, '2019-04-17 18:10:17', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8975, '2019-04-17 18:10:17', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8976, '2019-04-17 18:10:17', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8977, '2019-04-17 18:10:17', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8978, '2019-04-17 18:10:17', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8979, '2019-04-17 18:10:18', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8980, '2019-04-17 18:10:18', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8981, '2019-04-17 18:10:18', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8982, '2019-04-17 18:10:18', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8983, '2019-04-17 18:10:18', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8984, '2019-04-17 18:10:18', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8985, '2019-04-17 18:10:18', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8986, '2019-04-17 18:10:18', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8987, '2019-04-17 18:10:18', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8988, '2019-04-17 18:10:18', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8989, '2019-04-17 18:10:18', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8990, '2019-04-17 18:10:18', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8991, '2019-04-17 18:10:18', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8992, '2019-04-17 18:10:18', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8993, '2019-04-17 18:10:18', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8994, '2019-04-17 18:10:18', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8995, '2019-04-17 18:10:18', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8996, '2019-04-17 18:10:18', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8997, '2019-04-17 18:10:18', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8998, '2019-04-17 18:10:18', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8999, '2019-04-17 18:10:18', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9000, '2019-04-17 18:10:18', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9001, '2019-04-17 18:10:18', 112, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9002, '2019-04-17 18:10:18', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9003, '2019-04-17 18:10:18', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9004, '2019-04-17 18:10:18', 20, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9005, '2019-04-17 18:10:18', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9006, '2019-04-17 18:10:18', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9007, '2019-04-17 18:10:18', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9008, '2019-04-17 18:10:18', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9009, '2019-04-17 18:10:18', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9010, '2019-04-17 18:10:18', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9011, '2019-04-17 18:10:18', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9012, '2019-04-17 18:10:18', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9013, '2019-04-17 18:10:18', 112, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9014, '2019-04-17 18:10:18', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9015, '2019-04-17 18:10:19', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9016, '2019-04-17 18:10:19', 20, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9017, '2019-04-17 18:10:19', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9018, '2019-04-17 18:10:19', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9019, '2019-04-17 18:10:19', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9020, '2019-04-17 18:10:19', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9021, '2019-04-17 18:10:19', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9022, '2019-04-17 18:10:19', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9023, '2019-04-17 18:10:19', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9024, '2019-04-17 18:10:19', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9025, '2019-04-17 18:10:19', 112, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9026, '2019-04-17 18:10:19', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9027, '2019-04-17 18:10:19', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9028, '2019-04-17 18:10:19', 20, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9029, '2019-04-17 18:10:19', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9030, '2019-04-17 18:10:19', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9031, '2019-04-17 18:10:19', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9032, '2019-04-17 18:10:19', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9033, '2019-04-17 18:10:19', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9034, '2019-04-17 18:10:19', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9035, '2019-04-17 18:10:19', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9036, '2019-04-17 18:10:19', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9037, '2019-04-17 18:10:19', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9038, '2019-04-17 18:10:19', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9039, '2019-04-17 18:10:19', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9040, '2019-04-17 18:10:19', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9041, '2019-04-17 18:10:19', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9042, '2019-04-17 18:10:19', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9043, '2019-04-17 18:10:19', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9044, '2019-04-17 18:10:19', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9045, '2019-04-17 18:10:19', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9046, '2019-04-17 18:10:19', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9047, '2019-04-17 18:10:19', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9048, '2019-04-17 18:10:19', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9049, '2019-04-17 18:10:19', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9050, '2019-04-17 18:10:19', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9051, '2019-04-17 18:10:20', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9052, '2019-04-17 18:10:20', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9053, '2019-04-17 18:10:20', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9054, '2019-04-17 18:10:20', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9055, '2019-04-17 18:10:20', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9056, '2019-04-17 18:10:20', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9057, '2019-04-17 18:10:20', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9058, '2019-04-17 18:10:20', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9059, '2019-04-17 18:10:20', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9060, '2019-04-17 18:10:20', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9061, '2019-04-17 18:10:20', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9062, '2019-04-17 18:10:20', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9063, '2019-04-17 18:10:20', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9064, '2019-04-17 18:10:20', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9065, '2019-04-17 18:10:20', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9066, '2019-04-17 18:10:20', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9067, '2019-04-17 18:10:20', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9068, '2019-04-17 18:10:20', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9069, '2019-04-17 18:10:20', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9070, '2019-04-17 18:10:20', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9071, '2019-04-17 18:10:20', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9072, '2019-04-17 18:10:20', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9073, '2019-04-17 18:10:20', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9074, '2019-04-17 18:10:20', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9075, '2019-04-17 18:10:20', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9076, '2019-04-17 18:10:20', 18, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9077, '2019-04-17 18:10:20', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9078, '2019-04-17 18:10:20', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9079, '2019-04-17 18:10:20', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9080, '2019-04-17 18:10:20', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9081, '2019-04-17 18:10:20', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9082, '2019-04-17 18:10:20', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9083, '2019-04-17 18:10:20', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9084, '2019-04-17 18:10:20', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9085, '2019-04-17 18:10:20', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9086, '2019-04-17 18:10:20', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9087, '2019-04-17 18:10:21', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9088, '2019-04-17 18:10:21', 18, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9089, '2019-04-17 18:10:21', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9090, '2019-04-17 18:10:21', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9091, '2019-04-17 18:10:21', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9092, '2019-04-17 18:10:21', 17, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9093, '2019-04-17 18:10:21', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9094, '2019-04-17 18:10:21', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9095, '2019-04-17 18:10:21', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9096, '2019-04-17 18:10:21', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9097, '2019-04-17 18:10:21', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9098, '2019-04-17 18:10:21', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9099, '2019-04-17 18:10:21', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9100, '2019-04-17 18:10:21', 18, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9101, '2019-04-17 18:10:21', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9102, '2019-04-17 18:10:21', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9103, '2019-04-17 18:10:21', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9104, '2019-04-17 18:10:21', 17, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9105, '2019-04-17 18:10:21', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9106, '2019-04-17 18:10:21', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9107, '2019-04-17 18:10:21', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9108, '2019-04-17 18:10:21', 17, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9109, '2019-04-17 18:10:21', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9110, '2019-04-17 18:10:21', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9111, '2019-04-17 18:10:21', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9112, '2019-04-17 18:10:21', 16, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9113, '2019-04-17 18:10:21', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9114, '2019-04-17 18:10:21', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9115, '2019-04-17 18:10:21', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9116, '2019-04-17 18:10:21', 17, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9117, '2019-04-17 18:10:21', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9118, '2019-04-17 18:10:21', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9119, '2019-04-17 18:10:21', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9120, '2019-04-17 18:10:21', 17, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9121, '2019-04-17 18:10:21', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9122, '2019-04-17 18:10:21', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9123, '2019-04-17 18:10:22', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9124, '2019-04-17 18:10:22', 16, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9125, '2019-04-17 18:10:22', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9126, '2019-04-17 18:10:22', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9127, '2019-04-17 18:10:22', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9128, '2019-04-17 18:10:22', 16, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9129, '2019-04-17 18:10:22', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9130, '2019-04-17 18:10:22', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9131, '2019-04-17 18:10:22', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9132, '2019-04-17 18:10:22', 17, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9133, '2019-04-17 18:10:22', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9134, '2019-04-17 18:10:22', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9135, '2019-04-17 18:10:22', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9136, '2019-04-17 18:10:22', 16, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9137, '2019-04-17 18:10:22', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9138, '2019-04-17 18:10:22', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9139, '2019-04-17 18:10:22', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9140, '2019-04-17 18:10:22', 16, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9141, '2019-04-17 18:10:22', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9142, '2019-04-17 18:10:22', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9143, '2019-04-17 18:10:22', 9, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9144, '2019-04-17 18:10:22', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9145, '2019-04-17 18:10:22', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9146, '2019-04-17 18:10:22', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9147, '2019-04-17 18:10:22', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9148, '2019-04-17 18:10:22', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9149, '2019-04-17 18:10:22', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9150, '2019-04-17 18:10:22', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9151, '2019-04-17 18:10:22', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9152, '2019-04-17 18:10:22', 16, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9153, '2019-04-17 18:10:22', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9154, '2019-04-17 18:10:22', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9155, '2019-04-17 18:10:22', 9, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9156, '2019-04-17 18:10:22', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9157, '2019-04-17 18:10:22', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9158, '2019-04-17 18:10:22', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9159, '2019-04-17 18:10:23', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9160, '2019-04-17 18:10:23', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9161, '2019-04-17 18:10:23', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9162, '2019-04-17 18:10:23', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9163, '2019-04-17 18:10:23', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9164, '2019-04-17 18:10:23', 14, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9165, '2019-04-17 18:10:23', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9166, '2019-04-17 18:10:23', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9167, '2019-04-17 18:10:23', 9, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9168, '2019-04-17 18:10:23', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9169, '2019-04-17 18:10:23', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9170, '2019-04-17 18:10:23', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9171, '2019-04-17 18:10:23', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9172, '2019-04-17 18:10:23', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9173, '2019-04-17 18:10:23', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9174, '2019-04-17 18:10:23', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9175, '2019-04-17 18:10:23', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9176, '2019-04-17 18:10:23', 14, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9177, '2019-04-17 18:10:23', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9178, '2019-04-17 18:10:23', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9179, '2019-04-17 18:10:23', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9180, '2019-04-17 18:10:23', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9181, '2019-04-17 18:10:23', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9182, '2019-04-17 18:10:23', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9183, '2019-04-17 18:10:23', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9184, '2019-04-17 18:10:23', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9185, '2019-04-17 18:10:23', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9186, '2019-04-17 18:10:23', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9187, '2019-04-17 18:10:23', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9188, '2019-04-17 18:10:23', 14, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9189, '2019-04-17 18:10:23', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9190, '2019-04-17 18:10:23', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9191, '2019-04-17 18:10:23', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9192, '2019-04-17 18:10:23', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9193, '2019-04-17 18:10:23', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9194, '2019-04-17 18:10:23', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9195, '2019-04-17 18:10:24', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9196, '2019-04-17 18:10:24', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9197, '2019-04-17 18:10:24', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9198, '2019-04-17 18:10:24', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9199, '2019-04-17 18:10:24', 8, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9200, '2019-04-17 18:10:24', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9201, '2019-04-17 18:10:24', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9202, '2019-04-17 18:10:24', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9203, '2019-04-17 18:10:24', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9204, '2019-04-17 18:10:24', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9205, '2019-04-17 18:10:24', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9206, '2019-04-17 18:10:24', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9207, '2019-04-17 18:10:24', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9208, '2019-04-17 18:10:24', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9209, '2019-04-17 18:10:24', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9210, '2019-04-17 18:10:24', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9211, '2019-04-17 18:10:24', 8, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9212, '2019-04-17 18:10:24', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9213, '2019-04-17 18:10:24', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9214, '2019-04-17 18:10:24', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9215, '2019-04-17 18:10:24', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9216, '2019-04-17 18:10:24', 12, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9217, '2019-04-17 18:10:24', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9218, '2019-04-17 18:10:24', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9219, '2019-04-17 18:10:24', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9220, '2019-04-17 18:10:24', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9221, '2019-04-17 18:10:24', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9222, '2019-04-17 18:10:24', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9223, '2019-04-17 18:10:24', 8, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9224, '2019-04-17 18:10:24', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9225, '2019-04-17 18:10:24', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9226, '2019-04-17 18:10:24', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9227, '2019-04-17 18:10:24', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9228, '2019-04-17 18:10:24', 12, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9229, '2019-04-17 18:10:24', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9230, '2019-04-17 18:10:24', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9231, '2019-04-17 18:10:25', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9232, '2019-04-17 18:10:25', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9233, '2019-04-17 18:10:25', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9234, '2019-04-17 18:10:25', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9235, '2019-04-17 18:10:25', 6, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9236, '2019-04-17 18:10:25', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9237, '2019-04-17 18:10:25', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9238, '2019-04-17 18:10:25', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9239, '2019-04-17 18:10:25', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9240, '2019-04-17 18:10:25', 12, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9241, '2019-04-17 18:10:25', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9242, '2019-04-17 18:10:25', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9243, '2019-04-17 18:10:25', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9244, '2019-04-17 18:10:25', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9245, '2019-04-17 18:10:25', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9246, '2019-04-17 18:10:25', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9247, '2019-04-17 18:10:25', 6, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9248, '2019-04-17 18:10:25', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9249, '2019-04-17 18:10:25', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9250, '2019-04-17 18:10:25', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9251, '2019-04-17 18:10:25', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9252, '2019-04-17 18:10:25', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9253, '2019-04-17 18:10:25', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9254, '2019-04-17 18:10:25', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9255, '2019-04-17 18:10:25', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9256, '2019-04-17 18:10:25', 10, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9257, '2019-04-17 18:10:25', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9258, '2019-04-17 18:10:25', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9259, '2019-04-17 18:10:25', 6, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9260, '2019-04-17 18:10:25', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9261, '2019-04-17 18:10:25', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9262, '2019-04-17 18:10:25', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9263, '2019-04-17 18:10:25', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9264, '2019-04-17 18:10:25', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9265, '2019-04-17 18:10:25', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9266, '2019-04-17 18:10:25', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9267, '2019-04-17 18:10:26', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9268, '2019-04-17 18:10:26', 10, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9269, '2019-04-17 18:10:26', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9270, '2019-04-17 18:10:26', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9271, '2019-04-17 18:10:26', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9272, '2019-04-17 18:10:26', 9, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9273, '2019-04-17 18:10:26', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9274, '2019-04-17 18:10:26', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9275, '2019-04-17 18:10:26', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9276, '2019-04-17 18:10:26', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9277, '2019-04-17 18:10:26', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9278, '2019-04-17 18:10:26', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9279, '2019-04-17 18:10:26', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9280, '2019-04-17 18:10:26', 10, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9281, '2019-04-17 18:10:26', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9282, '2019-04-17 18:10:26', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9283, '2019-04-17 18:10:26', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9284, '2019-04-17 18:10:26', 9, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9285, '2019-04-17 18:10:26', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9286, '2019-04-17 18:10:26', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9287, '2019-04-17 18:10:26', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9288, '2019-04-17 18:10:26', 9, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9289, '2019-04-17 18:10:26', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9290, '2019-04-17 18:10:26', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9291, '2019-04-17 18:10:27', 5, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9292, '2019-04-17 18:10:27', 8, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9293, '2019-04-17 18:10:27', 82, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9294, '2019-04-17 18:10:27', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9295, '2019-04-17 18:10:27', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9296, '2019-04-17 18:10:27', 9, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9297, '2019-04-17 18:10:27', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9298, '2019-04-17 18:10:27', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9299, '2019-04-17 18:10:27', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9300, '2019-04-17 18:10:27', 9, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9301, '2019-04-17 18:10:27', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9302, '2019-04-17 18:10:27', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9303, '2019-04-17 18:10:27', 5, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9304, '2019-04-17 18:10:27', 8, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9305, '2019-04-17 18:10:27', 82, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9306, '2019-04-17 18:10:27', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9307, '2019-04-17 18:10:27', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9308, '2019-04-17 18:10:27', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9309, '2019-04-17 18:10:27', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9310, '2019-04-17 18:10:27', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9311, '2019-04-17 18:10:27', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9312, '2019-04-17 18:10:27', 9, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9313, '2019-04-17 18:10:27', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9314, '2019-04-17 18:10:27', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9315, '2019-04-17 18:10:27', 5, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9316, '2019-04-17 18:10:27', 8, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9317, '2019-04-17 18:10:27', 82, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9318, '2019-04-17 18:10:27', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9319, '2019-04-17 18:10:27', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9320, '2019-04-17 18:10:27', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9321, '2019-04-17 18:10:27', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9322, '2019-04-17 18:10:27', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9323, '2019-04-17 18:10:27', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9324, '2019-04-17 18:10:27', 7, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9325, '2019-04-17 18:10:27', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9326, '2019-04-17 18:10:27', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9327, '2019-04-17 18:10:28', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9328, '2019-04-17 18:10:28', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9329, '2019-04-17 18:10:28', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9330, '2019-04-17 18:10:28', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9331, '2019-04-17 18:10:28', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9332, '2019-04-17 18:10:28', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9333, '2019-04-17 18:10:28', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9334, '2019-04-17 18:10:28', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9335, '2019-04-17 18:10:28', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9336, '2019-04-17 18:10:28', 7, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9337, '2019-04-17 18:10:28', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9338, '2019-04-17 18:10:28', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9339, '2019-04-17 18:10:28', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9340, '2019-04-17 18:10:28', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9341, '2019-04-17 18:10:28', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9342, '2019-04-17 18:10:28', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9343, '2019-04-17 18:10:28', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9344, '2019-04-17 18:10:28', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9345, '2019-04-17 18:10:28', 86, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9346, '2019-04-17 18:10:28', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9347, '2019-04-17 18:10:28', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9348, '2019-04-17 18:10:28', 7, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9349, '2019-04-17 18:10:28', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9350, '2019-04-17 18:10:28', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9351, '2019-04-17 18:10:28', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9352, '2019-04-17 18:10:28', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9353, '2019-04-17 18:10:28', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9354, '2019-04-17 18:10:28', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9355, '2019-04-17 18:10:28', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9356, '2019-04-17 18:10:28', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9357, '2019-04-17 18:10:28', 86, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9358, '2019-04-17 18:10:28', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9359, '2019-04-17 18:10:28', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9360, '2019-04-17 18:10:28', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9361, '2019-04-17 18:10:28', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9362, '2019-04-17 18:10:28', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9363, '2019-04-17 18:10:29', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9364, '2019-04-17 18:10:29', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9365, '2019-04-17 18:10:29', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9366, '2019-04-17 18:10:29', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9367, '2019-04-17 18:10:29', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9368, '2019-04-17 18:10:29', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9369, '2019-04-17 18:10:29', 86, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9370, '2019-04-17 18:10:29', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9371, '2019-04-17 18:10:29', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9372, '2019-04-17 18:10:29', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9373, '2019-04-17 18:10:29', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9374, '2019-04-17 18:10:29', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9375, '2019-04-17 18:10:29', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9376, '2019-04-17 18:10:29', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9377, '2019-04-17 18:10:29', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9378, '2019-04-17 18:10:29', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9379, '2019-04-17 18:10:29', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9380, '2019-04-17 18:10:29', 5, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9381, '2019-04-17 18:10:29', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9382, '2019-04-17 18:10:29', 0.844848999999999961, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9383, '2019-04-17 18:10:29', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9384, '2019-04-17 18:10:29', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9385, '2019-04-17 18:10:29', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9386, '2019-04-17 18:10:29', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9387, '2019-04-17 18:10:29', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9388, '2019-04-17 18:10:29', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9389, '2019-04-17 18:10:29', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9390, '2019-04-17 18:10:29', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9391, '2019-04-17 18:10:29', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9392, '2019-04-17 18:10:29', 5, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9393, '2019-04-17 18:10:29', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9394, '2019-04-17 18:10:29', 0.844848999999999961, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9395, '2019-04-17 18:10:29', 2, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9396, '2019-04-17 18:10:29', 3, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9397, '2019-04-17 18:10:29', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9398, '2019-04-17 18:10:29', 0.844848999999999961, 'CURR', 4);


--
-- Name: measure_m_id_seq; Type: SEQUENCE SET; Schema: has_test; Owner: sinfdoc
--

SELECT pg_catalog.setval('has_test.measure_m_id_seq', 9398, true);


--
-- Data for Name: mote; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.mote VALUES (2, 'mote_kitchen', 'CM5000', 'Kitchen');
INSERT INTO has_test.mote VALUES (3, 'mote_WC', 'CM5000', 'WC');
INSERT INTO has_test.mote VALUES (4, 'mote_living_room', 'CM5000', 'Living Room');


--
-- Name: mote_mote_id_seq; Type: SEQUENCE SET; Schema: has_test; Owner: sinfdoc
--

SELECT pg_catalog.setval('has_test.mote_mote_id_seq', 4, true);


--
-- Data for Name: room; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.room VALUES ('Living Room', 'This is the living room for the HAS system ');
INSERT INTO has_test.room VALUES ('WC', 'This is the WC for the HAS system');
INSERT INTO has_test.room VALUES ('Kitchen', 'This is the Kitchen for the HAS system');


--
-- Data for Name: rule; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.rule VALUES (1, '>', 10, 1, 'TEMP', 2);
INSERT INTO has_test.rule VALUES (2, '>', 15, 1, 'TEMP', 3);
INSERT INTO has_test.rule VALUES (3, '>', 20, 1, 'TEMP', 4);


--
-- Name: rule_rule_id_seq; Type: SEQUENCE SET; Schema: has_test; Owner: sinfdoc
--

SELECT pg_catalog.setval('has_test.rule_rule_id_seq', 3, true);


--
-- Data for Name: sensor; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.sensor VALUES ('TEMP', 'Temperature Sensor');
INSERT INTO has_test.sensor VALUES ('HUM', 'Humidity Sensor');
INSERT INTO has_test.sensor VALUES ('LUM', 'Luminosity Sensor');
INSERT INTO has_test.sensor VALUES ('CURR', 'Current Sensor');


--
-- Data for Name: sensor_mote; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.sensor_mote VALUES ('TEMP', 2);
INSERT INTO has_test.sensor_mote VALUES ('HUM', 2);
INSERT INTO has_test.sensor_mote VALUES ('LUM', 2);
INSERT INTO has_test.sensor_mote VALUES ('CURR', 2);
INSERT INTO has_test.sensor_mote VALUES ('TEMP', 3);
INSERT INTO has_test.sensor_mote VALUES ('HUM', 3);
INSERT INTO has_test.sensor_mote VALUES ('LUM', 3);
INSERT INTO has_test.sensor_mote VALUES ('CURR', 3);
INSERT INTO has_test.sensor_mote VALUES ('TEMP', 4);
INSERT INTO has_test.sensor_mote VALUES ('HUM', 4);
INSERT INTO has_test.sensor_mote VALUES ('LUM', 4);
INSERT INTO has_test.sensor_mote VALUES ('CURR', 4);


--
-- Data for Name: state; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.state VALUES (72, '2019-04-17 18:09:39', 1, 1, 'Kitchen');
INSERT INTO has_test.state VALUES (73, '2019-04-17 18:09:39', 1, 1, 'WC');
INSERT INTO has_test.state VALUES (74, '2019-04-17 18:09:39', 1, 1, 'Living Room');
INSERT INTO has_test.state VALUES (75, '2019-04-17 18:09:45', 0, 1, 'Kitchen');
INSERT INTO has_test.state VALUES (76, '2019-04-17 18:09:50', 0, 1, 'WC');
INSERT INTO has_test.state VALUES (77, '2019-04-17 18:09:57', 0, 1, 'Living Room');
INSERT INTO has_test.state VALUES (78, '2019-04-17 18:10:11', 1, 1, 'Living Room');
INSERT INTO has_test.state VALUES (79, '2019-04-17 18:10:19', 1, 1, 'WC');
INSERT INTO has_test.state VALUES (80, '2019-04-17 18:10:24', 1, 1, 'Kitchen');


--
-- Name: state_s_id_seq; Type: SEQUENCE SET; Schema: has_test; Owner: sinfdoc
--

SELECT pg_catalog.setval('has_test.state_s_id_seq', 80, true);


--
-- Name: actuator actuator_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.actuator
    ADD CONSTRAINT actuator_pkey PRIMARY KEY (act_id);


--
-- Name: measure measure_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.measure
    ADD CONSTRAINT measure_pkey PRIMARY KEY (m_id);


--
-- Name: mote mote_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.mote
    ADD CONSTRAINT mote_pkey PRIMARY KEY (mote_id);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (name);


--
-- Name: rule rule_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.rule
    ADD CONSTRAINT rule_pkey PRIMARY KEY (rule_id);


--
-- Name: sensor_mote sensor_mote_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.sensor_mote
    ADD CONSTRAINT sensor_mote_pkey PRIMARY KEY (type_sens, mote_id);


--
-- Name: sensor sensor_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.sensor
    ADD CONSTRAINT sensor_pkey PRIMARY KEY (type);


--
-- Name: actuator_room state_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.actuator_room
    ADD CONSTRAINT state_pkey PRIMARY KEY (act_id, name_room);


--
-- Name: state state_pkey1; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.state
    ADD CONSTRAINT state_pkey1 PRIMARY KEY (s_id);


--
-- Name: measure fk_measure_mote; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.measure
    ADD CONSTRAINT fk_measure_mote FOREIGN KEY (mote_id) REFERENCES has_test.mote(mote_id);


--
-- Name: actuator_room fk_measure_mote; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.actuator_room
    ADD CONSTRAINT fk_measure_mote FOREIGN KEY (act_id) REFERENCES has_test.actuator(act_id);


--
-- Name: measure fk_measure_sensor; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.measure
    ADD CONSTRAINT fk_measure_sensor FOREIGN KEY (type_sens) REFERENCES has_test.sensor(type);


--
-- Name: mote fk_mote_room; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.mote
    ADD CONSTRAINT fk_mote_room FOREIGN KEY (name_room) REFERENCES has_test.room(name);


--
-- Name: sensor_mote fk_mote_sensor_fk1; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.sensor_mote
    ADD CONSTRAINT fk_mote_sensor_fk1 FOREIGN KEY (mote_id) REFERENCES has_test.mote(mote_id);


--
-- Name: rule fk_rule_actuator; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.rule
    ADD CONSTRAINT fk_rule_actuator FOREIGN KEY (act_id) REFERENCES has_test.actuator(act_id);


--
-- Name: rule fk_rule_mote; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.rule
    ADD CONSTRAINT fk_rule_mote FOREIGN KEY (mote_id) REFERENCES has_test.mote(mote_id);


--
-- Name: rule fk_rule_sensor; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.rule
    ADD CONSTRAINT fk_rule_sensor FOREIGN KEY (type_sens) REFERENCES has_test.sensor(type);


--
-- Name: sensor_mote fk_sensor_mote_fk1; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.sensor_mote
    ADD CONSTRAINT fk_sensor_mote_fk1 FOREIGN KEY (type_sens) REFERENCES has_test.sensor(type);


--
-- Name: state fk_state_actuator; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.state
    ADD CONSTRAINT fk_state_actuator FOREIGN KEY (act_id) REFERENCES has_test.actuator(act_id);


--
-- Name: actuator_room fk_state_room; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.actuator_room
    ADD CONSTRAINT fk_state_room FOREIGN KEY (name_room) REFERENCES has_test.room(name);


--
-- Name: state fk_state_room; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.state
    ADD CONSTRAINT fk_state_room FOREIGN KEY (name_room) REFERENCES has_test.room(name);


--
-- PostgreSQL database dump complete
--

