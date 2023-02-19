--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.3

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA IF NOT EXISTS public;


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


--
-- Name: abm; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.abm (
    id_abm_usuario integer NOT NULL,
    fk_id_usuario integer,
    id_usuario_mod integer,
    motivo character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: abm_id_abm_usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.abm_id_abm_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: abm_id_abm_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.abm_id_abm_usuario_seq OWNED BY public.abm.id_abm_usuario;


--
-- Name: aptitudes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aptitudes (
    id integer NOT NULL,
    nombre_aptitud character varying(255),
    descripcion character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: aptitudes_id_aptitud_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.aptitudes_id_aptitud_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aptitudes_id_aptitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.aptitudes_id_aptitud_seq OWNED BY public.aptitudes.id;


--
-- Name: aptitudes_ofertas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aptitudes_ofertas (
    id integer NOT NULL,
    fk_id_aptitud integer,
    fk_id_oferta integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: aptitudes_ofertas_id_aptitudes_oferta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.aptitudes_ofertas_id_aptitudes_oferta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aptitudes_ofertas_id_aptitudes_oferta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.aptitudes_ofertas_id_aptitudes_oferta_seq OWNED BY public.aptitudes_ofertas.id;


--
-- Name: aptitudes_postulantes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aptitudes_postulantes (
    id integer NOT NULL,
    fk_id_aptitud integer,
    fk_id_usuario integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: aptitudes_postulantes_id_aptitudes_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.aptitudes_postulantes_id_aptitudes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aptitudes_postulantes_id_aptitudes_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.aptitudes_postulantes_id_aptitudes_seq OWNED BY public.aptitudes_postulantes.id;


--
-- Name: carreras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carreras (
    id integer NOT NULL,
    nombre_carrera character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: carreras_id_carrera_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.carreras_id_carrera_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carreras_id_carrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.carreras_id_carrera_seq OWNED BY public.carreras.id;


--
-- Name: ciudades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ciudades (
    id integer,
    nombre character varying(255),
    fk_id_provincia integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


--
-- Name: contratos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contratos (
    id integer NOT NULL,
    nombre_contrato character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: contratos_id_contrato_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contratos_id_contrato_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contratos_id_contrato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contratos_id_contrato_seq OWNED BY public.contratos.id;


--
-- Name: empresas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.empresas (
    id bigint NOT NULL,
    fk_id_usuario integer,
    fk_id_rubro integer,
    fk_id_estado integer,
    nombre_empresa character varying(255),
    descripcion character varying(1024),
    pais character varying(255),
    fk_id_provincia integer,
    fk_id_ciudad integer,
    calle character varying(255),
    nro integer,
    piso integer,
    depto character varying(255),
    cp character varying(255),
    telefono integer,
    web character varying(255),
    nombre_representante character varying(255),
    email_representante character varying(255),
    logo character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: estado_empresas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estado_empresas (
    id integer NOT NULL,
    nombre_estado character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: estado_empresas_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.estado_empresas_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estado_empresas_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.estado_empresas_id_estado_seq OWNED BY public.estado_empresas.id;


--
-- Name: estado_ofertas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estado_ofertas (
    id integer NOT NULL,
    nombre_estado character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: estado_ofertas_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.estado_ofertas_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estado_ofertas_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.estado_ofertas_id_estado_seq OWNED BY public.estado_ofertas.id;


--
-- Name: estado_postulantes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estado_postulantes (
    id integer NOT NULL,
    nombre_estado character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: estado_postulantes_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.estado_postulantes_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estado_postulantes_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.estado_postulantes_id_estado_seq OWNED BY public.estado_postulantes.id;


--
-- Name: estudios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.estudios (
    id integer NOT NULL,
    nombre_estudio character varying(255),
    estado_estudio character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: estudios_id_estudio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.estudios_id_estudio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estudios_id_estudio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.estudios_id_estudio_seq OWNED BY public.estudios.id;


--
-- Name: grupos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grupos (
    id integer NOT NULL,
    descripcion character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: grupos_id_grupo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grupos_id_grupo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grupos_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grupos_id_grupo_seq OWNED BY public.grupos.id;


--
-- Name: idiomas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.idiomas (
    id integer NOT NULL,
    nombre_idioma character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: idiomas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.idiomas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: idiomas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.idiomas_id_seq OWNED BY public.idiomas.id;


--
-- Name: idiomas_ofertas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.idiomas_ofertas (
    id integer NOT NULL,
    fk_id_idioma integer,
    fk_id_oferta integer,
    fk_id_nivel integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: idiomas_ofertas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.idiomas_ofertas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: idiomas_ofertas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.idiomas_ofertas_id_seq OWNED BY public.idiomas_ofertas.id;


--
-- Name: idiomas_postulantes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.idiomas_postulantes (
    id integer NOT NULL,
    fk_id_idioma integer,
    fk_id_postulante integer,
    fk_id_nivel integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: idiomas_postulantes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.idiomas_postulantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: idiomas_postulantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.idiomas_postulantes_id_seq OWNED BY public.idiomas_postulantes.id;


--
-- Name: jornadas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jornadas (
    id integer NOT NULL,
    nombre_jornada character varying(255),
    detalle character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: jornadas_id_jornada_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jornadas_id_jornada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jornadas_id_jornada_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jornadas_id_jornada_seq OWNED BY public.jornadas.id;


--
-- Name: niveles_idiomas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.niveles_idiomas (
    id integer NOT NULL,
    nivel character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: niveles_idiomas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.niveles_idiomas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: niveles_idiomas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.niveles_idiomas_id_seq OWNED BY public.niveles_idiomas.id;


--
-- Name: ofertas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ofertas (
    id integer NOT NULL,
    fk_id_empresa bigint,
    fk_id_jornada integer,
    fk_id_contrato integer,
    fk_id_estudio integer,
    fk_id_carrera integer,
    fk_id_estado integer,
    fecha_vigencia timestamp with time zone,
    titulo_oferta character varying(255),
    descripcion character varying(2048),
    edad_desde integer,
    edad_hasta integer,
    experiencia_previa_desc character varying(255),
    zona_trabajo character varying(255),
    areas_estudio character varying(255),
    otros_detalles character varying(1024),
    beneficios character varying(1024),
    remuneracion double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    horario_laboral_desde character varying(255),
    horario_laboral_hasta character varying(255)
);


--
-- Name: ofertas_id_oferta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ofertas_id_oferta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ofertas_id_oferta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ofertas_id_oferta_seq OWNED BY public.ofertas.id;


--
-- Name: postulaciones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.postulaciones (
    id integer NOT NULL,
    fk_id_postulante integer,
    fk_id_oferta integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    fk_id_empresa bigint,
    contactado boolean
);


--
-- Name: postulaciones_id_postulaciones_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.postulaciones_id_postulaciones_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: postulaciones_id_postulaciones_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.postulaciones_id_postulaciones_seq OWNED BY public.postulaciones.id;


--
-- Name: postulantes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.postulantes (
    id integer NOT NULL,
    fk_id_tipo_documento integer,
    fk_id_usuario integer,
    fk_id_estudios integer,
    fk_id_carrera integer,
    fk_id_estado integer,
    nombre character varying(255),
    apellido character varying(255),
    nacionalidad character varying(255),
    fecha_nac timestamp with time zone,
    pais character varying(255),
    fk_id_provincia integer,
    fk_id_ciudad integer,
    calle character varying(255),
    nro integer,
    piso integer,
    depto character varying(255),
    cp character varying(255),
    telefono integer,
    cant_materias integer,
    alumno_unahur boolean,
    presentacion character varying(255),
    cv character varying(255),
    foto character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: provincias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.provincias (
    id integer NOT NULL,
    nombre character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: provincias_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.provincias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: provincias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.provincias_id_seq OWNED BY public.provincias.id;


--
-- Name: rubros; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rubros (
    id integer NOT NULL,
    nombre_rubro character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: rubros_id_rubro_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rubros_id_rubro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rubros_id_rubro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rubros_id_rubro_seq OWNED BY public.rubros.id;


--
-- Name: tipos_documentos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipos_documentos (
    id integer NOT NULL,
    tipo_documento character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: tipos_documentos_id_tipo_documento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipos_documentos_id_tipo_documento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipos_documentos_id_tipo_documento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipos_documentos_id_tipo_documento_seq OWNED BY public.tipos_documentos.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    fk_id_grupo integer,
    usuario character varying(255),
    password character varying(255),
    estado boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id;


--
-- Name: abm id_abm_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.abm ALTER COLUMN id_abm_usuario SET DEFAULT nextval('public.abm_id_abm_usuario_seq'::regclass);


--
-- Name: aptitudes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aptitudes ALTER COLUMN id SET DEFAULT nextval('public.aptitudes_id_aptitud_seq'::regclass);


--
-- Name: aptitudes_ofertas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aptitudes_ofertas ALTER COLUMN id SET DEFAULT nextval('public.aptitudes_ofertas_id_aptitudes_oferta_seq'::regclass);


--
-- Name: aptitudes_postulantes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aptitudes_postulantes ALTER COLUMN id SET DEFAULT nextval('public.aptitudes_postulantes_id_aptitudes_seq'::regclass);


--
-- Name: carreras id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carreras ALTER COLUMN id SET DEFAULT nextval('public.carreras_id_carrera_seq'::regclass);


--
-- Name: contratos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contratos ALTER COLUMN id SET DEFAULT nextval('public.contratos_id_contrato_seq'::regclass);


--
-- Name: estado_empresas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estado_empresas ALTER COLUMN id SET DEFAULT nextval('public.estado_empresas_id_estado_seq'::regclass);


--
-- Name: estado_ofertas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estado_ofertas ALTER COLUMN id SET DEFAULT nextval('public.estado_ofertas_id_estado_seq'::regclass);


--
-- Name: estado_postulantes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estado_postulantes ALTER COLUMN id SET DEFAULT nextval('public.estado_postulantes_id_estado_seq'::regclass);


--
-- Name: estudios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudios ALTER COLUMN id SET DEFAULT nextval('public.estudios_id_estudio_seq'::regclass);


--
-- Name: grupos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupos ALTER COLUMN id SET DEFAULT nextval('public.grupos_id_grupo_seq'::regclass);


--
-- Name: idiomas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas ALTER COLUMN id SET DEFAULT nextval('public.idiomas_id_seq'::regclass);


--
-- Name: idiomas_ofertas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas_ofertas ALTER COLUMN id SET DEFAULT nextval('public.idiomas_ofertas_id_seq'::regclass);


--
-- Name: idiomas_postulantes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas_postulantes ALTER COLUMN id SET DEFAULT nextval('public.idiomas_postulantes_id_seq'::regclass);


--
-- Name: jornadas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jornadas ALTER COLUMN id SET DEFAULT nextval('public.jornadas_id_jornada_seq'::regclass);


--
-- Name: niveles_idiomas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.niveles_idiomas ALTER COLUMN id SET DEFAULT nextval('public.niveles_idiomas_id_seq'::regclass);


--
-- Name: ofertas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ofertas ALTER COLUMN id SET DEFAULT nextval('public.ofertas_id_oferta_seq'::regclass);


--
-- Name: postulaciones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postulaciones ALTER COLUMN id SET DEFAULT nextval('public.postulaciones_id_postulaciones_seq'::regclass);


--
-- Name: provincias id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provincias ALTER COLUMN id SET DEFAULT nextval('public.provincias_id_seq'::regclass);


--
-- Name: rubros id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rubros ALTER COLUMN id SET DEFAULT nextval('public.rubros_id_rubro_seq'::regclass);


--
-- Name: tipos_documentos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipos_documentos ALTER COLUMN id SET DEFAULT nextval('public.tipos_documentos_id_tipo_documento_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."SequelizeMeta" (name) FROM stdin;
20220602164615-create-empresas.js
20220602164624-create-ofertas.js
20220602164632-create-postulantes.js
20220602164654-create-estado-empresas.js
20220602164654-create-rubros.js
20220602164655-create-aptitudes-ofertas.js
20220602164655-create-aptitudes.js
20220602164656-create-aptitudes-postulantes.js
20220602164656-create-jornadas.js
20220602164657-create-contratos.js
20220602164657-create-idiomas.js
20220602164658-create-idiomas-ofertas.js
20220602164658-create-idiomas-postulantes.js
20220602164659-create-estudios.js
20220602164659-create-tipos-documentos.js
20220602164700-create-carreras.js
20220602164700-create-usuarios.js
20220602164701-create-abm.js
20220602164701-create-grupos.js
20220602164702-create-estado-postulantes.js
20220602164702-create-postulaciones.js
20220602164703-create-estado-ofertas.js
addConstrait-abm-usuarios.js
addConstrait-aptitudes_ofertas-aptitudes.js
addConstrait-aptitudes_ofertas-ofertas.js
addConstrait-aptitudes_postulantes-aptitudes.js
addConstrait-aptitudes_postulantes-postulantes.js
addConstrait-empresas-estado_empresas.js
addConstrait-empresas-rubros.js
addConstrait-empresas-usuarios_accesos.js
addConstrait-idiomas_ofertas-idiomas.js
addConstrait-idiomas_ofertas-ofertas.js
addConstrait-idiomas_postulantes-idiomas.js
addConstrait-idiomas_postulantes-postulantes.js
addConstrait-ofertas-carreras.js
addConstrait-ofertas-contratos.js
addConstrait-ofertas-empresas.js
addConstrait-ofertas-estado_ofertas.js
addConstrait-ofertas-estudios.js
addConstrait-ofertas-jornadas.js
addConstrait-postulaciones-empresa.js
addConstrait-postulaciones-ofertas.js
addConstrait-postulaciones-postulantes.js
addConstrait-postulantes-carreras.js
addConstrait-postulantes-estado_postulantes.js
addConstrait-postulantes-estudios.js
addConstrait-postulantes-tipos_documentos.js
addConstrait-postulantes-usuarios.js
addConstrait-usuarios-grupos.js
20220809231126-create-provincias.js
20220809231202-create-departamentos.js
addConstrait_Provincia_Deptos.js
20220809231202-create-ciudades.js
20221010013710-create-niveles-idiomas.js
20221010014738-create-idiomas.js
20221010020138-create-idiomas-postulantes.js
20221010020149-create-idiomas-ofertas.js
addConstrait_Provincias_Ciudades.js
addConstrait_idiomas_ofertas-idiomas.js
addConstrait_idiomas_ofertas-niveles_idiomas.js
addConstrait_idiomas_ofertas-ofertas.js
addConstrait_idiomas_postulantes-idiomas.js
addConstrait_idiomas_postulantes-niveles_idiomas.js
addConstrait_idiomas_postulantes-postulantes.js
\.


--
-- Data for Name: abm; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.abm (id_abm_usuario, fk_id_usuario, id_usuario_mod, motivo, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: aptitudes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.aptitudes (id, nombre_aptitud, descripcion, "createdAt", "updatedAt") FROM stdin;
1	Python	Desarrollo en Python	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	NodeJS	Desarrollo en NodeJS	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	ReactJS	Desarrollo en ReactJS	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: aptitudes_ofertas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.aptitudes_ofertas (id, fk_id_aptitud, fk_id_oferta, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: aptitudes_postulantes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.aptitudes_postulantes (id, fk_id_aptitud, fk_id_usuario, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carreras (id, nombre_carrera, "createdAt", "updatedAt") FROM stdin;
1	Tecnicatura en informatica	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	Licenciatura en informatica	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	Tecnicatura en laboratorio	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
4	Licenciatura en biotecnologia	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
5	Tecnicatura universitaria en gestion ambiental	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
6	Tecnicatura universitaria en tecnologia de los alimentos	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
7	Tecnicatura universitaria en viverismo	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
8	Profesorado universitario de letras	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
9	Profesorado universitario en educacion fisica	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
10	Profesorado universitario de ingles	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
11	Profesorado universitario de matematica	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
12	Profesorado universitario de biologia	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
13	Tecnicatura universitaria en programacion	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
14	Tecnicatura universitaria en redes y operaciones informaticas	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
15	Tecnicatura universitaria en diseño industrial	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ciudades (id, nombre, fk_id_provincia, "createdAt", "updatedAt") FROM stdin;
6412	Jose C. Paz	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22112	O Higgins	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42147	Trenel	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6014	Adolfo Gonzales Chaves	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6315	General Juan Madariaga	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6791	Tandil	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86014	Alberdi	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42119	Quemu Quemu	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42021	Capital	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86154	Rivadavia	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86098	Juan F. Ibarra	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86077	General Taboada	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50042	La Paz	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6196	Coronel Pringles	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6805	Tigre	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42028	Catrilo	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42007	Atreuco	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42070	Guatrache	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42154	Utracan	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42098	Loventue	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42077	Hucal	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42049	Chalileo	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42063	Chical Co	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18049	Esquina	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18175	Sauce	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18035	Curuzu Cuatia	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18147	San Martin	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26077	Rawson	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18105	Mercedes	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18119	Paso de los Libres	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18056	General Alvear	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86063	Choya	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50112	Santa Rosa	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50084	Rivadavia	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6819	Tornquist	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46035	Chamical	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46007	Arauco	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6126	Campana	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10098	Santa Rosa	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10070	La Paz	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
78042	Magallanes	78	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
78007	Corpen Aike	78	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62028	Conesa	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22154	Sargento Cabral	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22070	Independencia	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22098	Mayor Luis J. Fontana	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22043	Fray Justo Santa Maria de Oro	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22126	1ro de Mayo	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
74007	Ayacucho	74	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6511	Maipu	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22036	12 de Octubre	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14147	Santa Maria	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14126	San Alberto	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14119	Rio Segundo	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14140	San Justo	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14182	Union	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14161	Tercero Arriba	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66035	Cerrillos	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14098	Rio Cuarto	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50126	Tupungato	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
34042	Pilagas	34	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
34021	Laishi	34	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
34056	Pirane	34	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22063	General Guemes	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62056	norquinco	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6007	Adolfo Alsina	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6651	Puan	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6875	Villarino	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14084	Presidente Roque Saenz Pena	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6392	General Villegas	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14035	General Roca	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50014	General Alvear	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86147	Rio Hondo	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6770	San Pedro	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66133	Rivadavia	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66147	Rosario de Lerma	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38035	Ledesma	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18021	Capital	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54028	Capital	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54063	Iguazu	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54091	Obera	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54098	San Ignacio	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46014	Capital	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14112	Rio Seco	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62014	Avellaneda	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62042	General Roca	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22140	San Fernando	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
74014	Belgrano	74	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58070	Los Lagos	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10035	Belen	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58035	Confluencia	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58105	Picunches	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58014	Anelo	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58063	Loncopue	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58084	norquin	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10049	Capital	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10014	Ancasti	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58091	Pehuenches	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58077	Minas	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58042	Chos Malal	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26014	Cushamen	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
78035	Lago Buenos Aires	78	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2014	Comuna 2	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2056	Comuna 8	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
34063	Ramon Lista	34	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14154	Sobremonte	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86035	Banda	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6224	Chivilcoy	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82028	Villa Constitucion	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26063	Martires	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86182	Sarmiento	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
78014	Deseado	78	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26056	Languineo	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86042	Belgrano	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86007	Aguirre	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2098	Comuna 14	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86084	Guasayan	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14014	Capital	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10028	Antofagasta de la Sierra	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50091	San Carlos	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26035	Futaleufu	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
78049	Rio Chico	78	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
78028	Lago Argentino	78	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62035	El Cuy	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50049	Las Heras	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50056	Lavalle	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62063	Pichi Mahuida	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62007	Adolfo Alsina	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2021	Comuna 3	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86049	Capital	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6287	General Alvear	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86105	Loreto	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30113	Villaguay	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6168	Castelli	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30088	San Salvador	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6028	Almirante Brown	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30077	Nogoya	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30091	Tala	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30070	La Paz	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22147	San Lorenzo	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6441	La Plata	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6119	Brandsen	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6854	25 de Mayo	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6609	Pehuajo	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6301	General Belgrano	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10042	Capayan	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6547	Monte	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6693	Roque Perez	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6638	Pilar	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6497	Lujan	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6049	Azul	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54035	Concepcion	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6539	Merlo	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6210	Chacabuco	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6161	Carmen de Areco	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6364	General Rodriguez	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6266	Exaltacion de la Cruz	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6760	San Miguel	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6728	San Andres de Giles	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6413	Junin	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6525	Marcos Paz	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14056	Juarez Celman	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42084	Lihuel Calel	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6532	Mercedes	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22039	2 de Abril	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6408	Hurlingham	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6568	Moron	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6371	Ciudad Libertador San Martin	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66084	La Candelaria	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6410	Ituzaingo	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82063	La Capital	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18168	Santo Tome	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18126	Saladas	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18063	General Paz	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6784	Suipacha	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6840	Tres de Febrero	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46028	Coronel Felipe Varela	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6021	Alberti	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6434	Lanus	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6329	General Las Heras	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6490	Lomas de Zamora	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6574	Navarro	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6134	Canuelas	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66063	Guachipas	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66021	Cafayate	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6483	Lobos	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6658	Quilmes	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6630	Pila	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6322	General La Madrid	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6105	Bolivar	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6063	Balcarce	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6406	Hipolito Yrigoyen	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6238	Dolores	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6847	Tres Lomas	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6042	Ayacucho	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18007	Bella Vista	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22161	Tapenaga	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30015	Concordia	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30035	Federal	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30056	Gualeguaychu	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30063	Islas del Ibicuy	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6351	General Pinto	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6399	Guamini	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6035	Avellaneda	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70021	Calingasta	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70126	25 de Mayo	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6175	Colon	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6742	San Cayetano	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6833	Tres Arroyos	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86070	Figueroa	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6700	Saavedra	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6553	Monte Hermoso	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6476	Loberia	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6098	Berisso	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6812	Tordillo	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6665	Ramallo	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6763	San Nicolas	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86119	Moreno	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6308	General Guido	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22028	Chacabuco	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50028	Guaymallen	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66028	Capital	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22168	25 de Mayo	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6203	Coronel Suarez	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6189	Coronel Dorrego	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6581	Necochea	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46105	Independencia	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50070	Maipu	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50007	Capital	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50021	Godoy Cruz	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10021	Andalgala	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10007	Ambato	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6056	Bahia Blanca	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6280	General Alvarado	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6357	General Pueyrredon	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6518	Mar Chiquita	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6868	Villa Gesell	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50035	Junin	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46021	Castro Barros	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22133	Quitilipi	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6644	Pinamar	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6336	General Lavalle	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6420	La Costa	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6505	Magdalena	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46126	Sanagasta	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6861	Vicente Lopez	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46042	Chilecito	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22119	Presidencia de la Plaza	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30105	Victoria	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46056	General angel V. Penaloza	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30021	Diamante	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30098	Uruguay	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30084	Parana	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6707	Saladillo	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6455	Las Flores	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6686	Rojas	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6252	Escobar	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6623	Pergamino	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46070	General Juan F. Quiroga	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90063	Lules	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90119	Yerba Buena	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90105	Tafi Viejo	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90007	Burruyacu	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46112	Rosario Vera Penaloza	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82133	Vera	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82077	9 de Julio	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70049	Iglesia	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70119	Valle Fertil	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70112	Ullum	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70007	Albardon	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70133	Zonda	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
74042	Gobernador Dupuy	74	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66014	Cachi	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66042	Chicoana	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66098	La Vina	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6672	Rauch	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66112	Metan	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66119	Molinos	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6721	Salliquelo	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6091	Berazategui	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66049	General Guemes	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66154	San Carlos	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42126	Rancul	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42035	Conhelo	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10063	Fray Mamerto Esquiu	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46084	General Ocampo	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6648	Presidente Peron	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62049	9 de julio	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46091	General San Martin	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86021	Atamisqui	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6182	Coronel de Marina Leonardo Rosales	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46049	Famatina	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22077	Libertad	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
94011	Tolhuin	94	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46119	San Blas de Los Sauces	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82035	Garay	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82070	Las Colonias	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42133	Realico	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
34014	Formosa	34	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10077	Paclin	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10056	El Alto	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22021	Comandante Fernandez	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6462	Leandro N. Alem	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22049	General Belgrano	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22056	General Donovan	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26098	Tehuelches	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26021	Escalante	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14049	Ischilin	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14168	Totoral	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14042	General San Martin	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14133	San Javier	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6294	General Arenales	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6679	Rivadavia	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2063	Comuna 9	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70014	Angaco	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70035	Caucete	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58098	Picun Leufu	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58007	Alumine	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26091	Sarmiento	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6343	General Paz	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18154	San Miguel	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2049	Comuna 7	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62091	25 de Mayo	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2070	Comuna 10	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
94028	Antartida Argentina	94	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
94021	Islas del Atlantico Sur	94	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26105	Telsen	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2077	Comuna 11	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6735	San Antonio de Areco	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6560	Moreno	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6427	La Matanza	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62070	Pilcaniyeu	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86126	Ojo de Agua	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6466	Lezama	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6655	Punta Indio	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38014	El Carmen	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10091	Santa Maria	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26042	Gaiman	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46077	General Lamadrid	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14077	Pocho	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18070	Goya	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18091	Lavalle	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18161	San Roque	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2042	Comuna 6	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14175	Tulumba	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14028	Cruz del Eje	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14091	Punilla	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14070	Minas	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62084	Valcheta	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62077	San Antonio	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6616	Pellegrini	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22105	9 de Julio	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66077	La Caldera	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50105	San Rafael	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66007	Anta	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46063	General Belgrano	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86056	Copo	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
46098	Vinchina	46	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58056	Lacar	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2091	Comuna 13	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
94008	Rio Grande	94	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
94015	Ushuaia	94	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10084	Poman	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90035	Graneros	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66140	Rosario de la Frontera	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26070	Paso de Indios	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22007	Almirante Brown	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10112	Valle Viejo	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22091	Maipu	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86161	Robles	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30008	Colon	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50119	Tunuyan	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50063	Lujan de Cuyo	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26084	Rio Senguer	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
62021	Bariloche	62	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58049	Huiliches	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58021	Catan Lil	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58028	Collon Cura	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6154	Carlos Tejedor	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6077	Arrecifes	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6140	Capitan Sarmiento	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6714	Salto	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30049	Gualeguay	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30028	Federacion	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
30042	Feliciano	30	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6588	9 de Julio	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6826	Trenque Lauquen	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6147	Carlos Casares	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6595	Olavarria	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6260	Esteban Echeverria	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6385	General Viamonte	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6515	Malvinas Argentinas	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6469	Lincoln	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6798	Tapalque	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42140	Toay	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18112	Monte Caseros	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6112	Bragado	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6270	Jose M. Ezeiza	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42042	Curaco	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42091	Limay Mahuida	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42112	Puelen	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6274	Florencio Varela	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86189	Silipica	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54119	25 de Mayo	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6778	San Vicente	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6231	Daireaux	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70063	9 de Julio	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70077	Rawson	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6245	Ensenada	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6448	Laprida	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6756	San Isidro	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6084	Benito Juarez	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38056	San Antonio	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22084	Libertador General San Martin	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26049	Gastre	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6749	San Fernando	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6882	Zarate	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86168	Salavina	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86133	Pellegrini	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86028	Avellaneda	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
22014	Bermejo	22	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
74049	Junin	74	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50098	San Martin	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
58112	Zapala	58	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14021	Colon	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82014	Caseros	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82084	Rosario	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82119	San Lorenzo	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82056	Iriondo	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82007	Belgrano	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82105	San Jeronimo	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86112	Mitre	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66161	Santa Victoria	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66056	General Jose de San Martin	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
34049	Pilcomayo	34	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14105	Rio Primero	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
10105	Tinogasta	10	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14063	Marcos Juarez	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
14007	Calamuchita	14	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
74028	Chacabuco	74	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
74056	Juan Martin de Pueyrredon	74	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
74035	General Pedernera	74	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6602	Patagones	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
74063	Libertador General San Martin	74	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
74021	Coronel Pringles	74	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2007	Comuna 1	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2028	Comuna 4	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2035	Comuna 5	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42014	Caleu Caleu	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70056	Jachal	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86140	Quebrachos	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18098	Mburucuya	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18042	Empedrado	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18084	Ituzaingo	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18133	San Cosme	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18077	Itati	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2084	Comuna 12	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54105	San Javier	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54007	Apostoles	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54042	Eldorado	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54112	San Pedro	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54084	Montecarlo	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6217	Chascomus	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
2105	Comuna 15	2	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86175	San Martin	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
86091	Jimenez	86	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6070	Baradero	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38028	Humahuaca	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38112	Yavi	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38077	Santa Catalina	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38063	San Pedro	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38105	Valle Grande	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
34035	Patino	34	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
34007	Bermejo	34	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38084	Susques	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66070	Iruya	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
34028	Matacos	34	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66105	Los Andes	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66126	Oran	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38094	Tilcara	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38042	Palpala	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38007	Cochinoca	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38098	Tumbaya	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38021	Dr. Manuel Belgrano	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38070	Santa Barbara	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
38049	Rinconada	38	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
66091	La Poma	66	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90021	Chicligasta	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90070	Monteros	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90056	Leales	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90028	Famailla	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90084	Capital	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90014	Cruz Alta	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90112	Trancas	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90098	Tafi del Valle	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82126	San Martin	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18140	San Luis del Palmar	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18014	Beron de Astrada	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82021	Castellanos	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82112	San Justo	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82091	San Cristobal	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82098	San Javier	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82049	General Obligado	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70042	Chimbas	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70091	San Martin	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26007	Biedma	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
6277	Florentino Ameghino	6	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
26028	Florentino Ameghino	26	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90049	La Cocha	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90042	Juan Bautista Alberdi	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90077	Rio Chico	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
90091	Simoca	90	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
82042	General Lopez	82	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54021	Candelaria	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54014	Cainguas	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54077	Libertador General San Martin	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54049	General Manuel Belgrano	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54056	Guarani	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70084	Rivadavia	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70098	Santa Lucia	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70070	Pocito	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70105	Sarmiento	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
70028	Capital	70	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42056	Chapaleufu	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
42105	Maraco	42	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
18028	Concepcion	18	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
54070	Leandro N. Alem	54	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
78021	Guer Aike	78	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
50077	Malargue	50	2022-06-05 12:00:01+00	2022-06-05 12:00:01+00
\.


--
-- Data for Name: contratos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contratos (id, nombre_contrato, "createdAt", "updatedAt") FROM stdin;
1	Temporal	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	Freelance	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	Relacion de dependencia	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: empresas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.empresas (id, fk_id_usuario, fk_id_rubro, fk_id_estado, nombre_empresa, descripcion, pais, fk_id_provincia, fk_id_ciudad, calle, nro, piso, depto, cp, telefono, web, nombre_representante, email_representante, logo, "createdAt", "updatedAt") FROM stdin;
20128928420	467	1	2	Red Bull GmbH	Red Bull GmbH es una compañía con sede en Austria que comercializa la bebida energética	Argentina	30	30021	Chacabuco	32	1	1	1232	123332532	https://www.redbull.com	Dietrich Mateschitz	redbull@redbull.com	logo.jpg	2022-12-07 03:06:29.06+00	2022-12-07 17:10:39.422+00
3010203041	465	1	2	Shell	Shell es una empresa energética integrada que tiene el objetivo de satisfacer la creciente demanda energética mundial de manera responsable desde los puntos de vista económico, medioambiental y social.	Argentina	6	6134	Arroyo	53	1	5	1124	1120338290	https://www.shell.com.ar	Jorma Ollila	shell@shell.com	image/png|d0d5113e-9950-448c-aa04-7cf911f3211d.png	2022-12-07 02:58:33.695+00	2022-12-07 17:30:18.359+00
30182432120	466	1	2	Telefónica S.A	Telefónica es una empresa multinacional española de telecomunicaciones, con sede central en Madrid. Es la cuarta compañía de telecomunicaciones más importante de Europa y la decimotercera a nivel mundial.	Argentina	2	2063	Dante	3510	1	4	1686	1232819290	https://www.telefonica.com.ar/	José María Álvarez-Pallete	telefonica@telefonica.com	image/jpeg|587473f1-5f99-46e5-a1b3-26b8cd81074c.jpeg	2022-12-07 03:04:01.104+00	2022-12-07 22:35:34.226+00
3012837892	468	1	1	Bayer AG	Bayer AG es una empresa químico-farmacéutica alemana fundada en Barmen, Alemania en 1863.​ Hoy en día, tiene su sede en Leverkusen, Renania del Norte-Westfalia, Alemania.​ Es bien conocida a nivel mundial por su marca original de la aspirina.	Argentina	50	50098	Cangallo	120	1	1	23212	1234235261	https://www.bayer.com	Werner Baumann	bayer@bayer.com	image/png|66f0e0b2-ded9-4b16-b553-6fbc9f0bc625.png	2022-12-07 03:08:07.938+00	2022-12-07 16:44:31.766+00
30123993201	515	1	1	Apple	Vendemos compus caras	Argentina	30	30077	Cangallo	413	1	4	1654	123214352	https://www.apple.com	Tim Cook	apple@apple.com	logo.jpg	2022-12-07 22:47:15.922+00	2022-12-07 23:58:37.55+00
\.


--
-- Data for Name: estado_empresas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.estado_empresas (id, nombre_estado, "createdAt", "updatedAt") FROM stdin;
1	activo	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	observado	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	baja	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: estado_ofertas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.estado_ofertas (id, nombre_estado, "createdAt", "updatedAt") FROM stdin;
1	activa	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	vencida	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	pendiente	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
5	finalizada	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
4	observada	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: estado_postulantes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.estado_postulantes (id, nombre_estado, "createdAt", "updatedAt") FROM stdin;
1	activo	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	observado	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	baja	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: estudios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.estudios (id, nombre_estudio, estado_estudio, "createdAt", "updatedAt") FROM stdin;
1	Primario	Incompleto	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	Primario	Completo	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	Secundario	Incompleto	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
4	Secundario	Completo	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
5	Terciario	Incompleto	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
6	Terciario	Completo	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
7	Universitario	Incompleto	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
8	Universitario	Completo	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.grupos (id, descripcion, "createdAt", "updatedAt") FROM stdin;
1	postulante	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	empresa	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	administrador	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: idiomas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.idiomas (id, nombre_idioma, "createdAt", "updatedAt") FROM stdin;
1	Español	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	Inglés	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	Portugués	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
4	Francés	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
5	Alemán	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: idiomas_ofertas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.idiomas_ofertas (id, fk_id_idioma, fk_id_oferta, fk_id_nivel, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: idiomas_postulantes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.idiomas_postulantes (id, fk_id_idioma, fk_id_postulante, fk_id_nivel, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: jornadas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.jornadas (id, nombre_jornada, detalle, "createdAt", "updatedAt") FROM stdin;
1	Part-time	Trabajas 4hs	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	Full-time	Trabajas 9hs	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: niveles_idiomas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.niveles_idiomas (id, nivel, "createdAt", "updatedAt") FROM stdin;
1	Inicial	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	Intermedio	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	Avanzado	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: ofertas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ofertas (id, fk_id_empresa, fk_id_jornada, fk_id_contrato, fk_id_estudio, fk_id_carrera, fk_id_estado, fecha_vigencia, titulo_oferta, descripcion, edad_desde, edad_hasta, experiencia_previa_desc, zona_trabajo, areas_estudio, otros_detalles, beneficios, remuneracion, "createdAt", "updatedAt", horario_laboral_desde, horario_laboral_hasta) FROM stdin;
61	3010203041	2	3	7	4	5	2022-12-23 00:00:00+00	Laboratorista - Industria Petrolera	El puesto de Laboratorista requiere de una persona responsable, prolija y activa. \n\nEs requisito excluyente tener título 'técnico químico' o conocimientos relacionados.\nSus tareas serán:\n\nControl de calidad\n\nControl y registro de documentación de análisis.\n\nControl de materias primas e insumos.\n\nOrden, limpieza, conocimiento de normas de seguridad del laboratorio.\n\nControl de muestras y contra muestra.\n	22	23	1 año de experiencia	La Matanza	Quimica, Biotecnología	Conocimientos en tratamientos de agua\n\nRequerimientos- Educación mínima: Técnico\n	Varios	100000	2022-12-07 03:46:16.745+00	2022-12-07 14:46:23.797+00	4	12
60	3010203041	2	3	7	4	4	2022-12-31 00:00:00+00	Ingeniero de Operaciones - Industria Petrolera	Nuestro cliente, una multinacionaldd  de servicios ambientales y gestión integral de residuos industriales, para asignar en un cliente petrolero en la zona de La Plata, nos ha encargado la búsqueda de un:  INGENIERO PARA EL ÁREA DE OPERACIONES  Debe residir o tener fácil acceso a la zona de Ringuelet y Ensenada, la empresa explorará las opciones de otorgar un vehículo compañía, o asumir los gastos de traslado del ingresante  Reportará en forma directa al Directorio  Se valorará especialmente conocimientos y experiencia en refinación y en la industria petrolera	22	33	3 a 5 años de experiencia en las tareas y en la industria	La Plata	Ingeniería en Petróleo, Biotecnología	Se valorarán conocimientos en Excel y PPT	Comedor en planta	300000	2022-12-07 03:25:56.411+00	2022-12-07 17:12:29.025+00	12	22
64	30182432120	2	3	8	2	5	2023-01-14 00:00:00+00	Diseñador de redes	Telefónica se encuentra en la búsqueda de estudiantes o recientemente graduados de ARQUITECTURA/INGENIERÍA o carreras afines para DISEÑO DE REDES FIBRA ÓPTICA.\n\nRequisitos:\n• Estudiante universitario de Arquitectura o Ingeniería.\n• Manejo de AUTOCAD avanzado.\n• Idioma: Inglés.\n• Disponibilidad Full Time.\n	23	33	Sin experiencia	Martínez	Informática, Redes, Telecomunicaciones	Residir en Zona Norte Bs.As. (Excluyente)\n	Varios	400000	2022-12-07 17:21:23.772+00	2022-12-07 18:21:54.999+00	10	22
65	30182432120	2	3	7	14	1	2022-12-30 00:00:00+00	Jefe de mantenimiento eléctrico	\nNos encontramos en búsqueda de un Jefe de mantenimiento eléctrico, para sumarse a nuestro equipo.\n\nSerá tu objetivo garantizar el buen funcionamiento eléctrico / electronico de la planta\n\n¿Qué desafíos te esperan?\n\n1.Liderar y capacitar al equipo de mantenimiento eléctrico, para lograr el mejor resultado operativo de todos los equipos eléctricos, dando instrucciones claras, previendo eventos nocivos, planificando y previniendo preventivamente cualquier accion que afecte la productividad de la planta en terminos elctricos electrónicos.\n\n2. Analisis de predictivos y preventivos sobre equipos electricos, electronicos.\n\n3.Preever stock de repuestos.\n\n4.Liderar el equipo de trabajo trabajar sobre mejoras continuas y ssyhh.\n\n5.Optimizar y mejorar los indicadores del sector	24	24	5 años de experiencia en puestos similares.	Haedo	Ingeniería eléctrica	no	Varios	220300	2022-12-07 18:19:53.756+00	2022-12-07 18:23:30.587+00	10	22
62	30182432120	2	3	6	2	2	2022-12-30 00:00:00+00	Ingeniero en Telecomunicaciones	Somos una empresa en crecimiento constante y estamos ampliando nuestro equipo de trabajo.\n\nBuscamos profesionales que tengan muchas ganas de aprender nuevas tecnologías ,apasionados, que quieran desarrollarse y agregarle valor a la compañía!\n\nEn esta posición será parte de un grupo de profesionales de amplia trayectoria responsables de desarrollar y mantener diferentes plataformas y soluciones utilizando múltiples tecnologías.\n\nResponsabilidades\n\n• Brindar soporte sobre las diferentes soluciones de software OSS desarrolladas por Stechs.\n\n• Participar del soporte a los clientes de las soluciones/equipamiento de terceros comercializadas por Stechs (Equipamiento de acceso DOCSIS/GPON, CPE (CM, ONT, STB), equipamientos de VIDEO, router, etc).\n\n• Colaborar con los especialistas de las diferentes áreas en la evolución y desarrollo de las soluciones OSS propias.	20	23	Sin experiencia	CABA	Telecomunicaciones, Electrónica, Informática	Requisitos mínimos\n\n• Conocimiento general sobre las redes y servicios de proveedores de CATV e Internet.\n\n• Conocimiento de diseño, operación y gestión capacidad de redes de datos en sus distintos componentes, capas y tecnologías tales como: DOCSIS, GPON/EPON, Ethernet, IP.\n\n• Conocimiento general y experiencia en administración de sistemas Unix.\n\n• Conocimientos generales de programación y scripting.\n	Varios	2020000	2022-12-07 12:28:00.488+00	2022-12-07 22:50:24.068+00	10	18
63	30182432120	2	3	8	2	1	2022-12-23 00:00:00+00	Administrador de Redes - SSR	Buscamos un especialista para integrarse a un equipo de trabajo de infraestrutcura.\n\nInstalar, asegurar el funcionamiento y maximizar el rendimiento de la RED WAN/LAN\n\nAdministrar las soluciones de seguridad y las buenas prácticas.-\n\nAdministracion de usuarios y documentación.\n\nDiagnóstico de problemas y diseño de soluciones.\n\nPERFIL\n\nExperiencia en arquitectura de redes LAN y WAN\n\nConocimiento de sistemas operativos y ambientes de virtualización.\n\nConocimiento en servicios SaaS, O365, Azure.\n\nConocimiento en Bases de datos. MS SQL\n\nCapacidades analíticas y de resolución de problemas de las funciones de la red (seguridad, servidores, enrutamiento)\n\nHabilidades en Organización y documentación.\n\nCapacidad de trabajo en equipo\n	22	33	3 años de experiencia	Ciudad Evita	Informática, Redes	No	Varios	1235534	2022-12-07 17:18:26.558+00	2022-12-07 18:23:33.811+00	10	14
67	3010203041	2	3	8	2	1	2022-12-30 00:00:00+00	Desarrollador Haskell SR	Buscamos un desarrollador Haskell para nuestra empresa	25	33	5 años de experiencia en desarrollo Haskell	San Martin	Informática, Sistemas	no	Varios	432122	2022-12-07 18:33:29.543+00	2022-12-07 18:33:51.7+00	10	22
66	3010203041	2	3	8	4	1	2022-12-31 00:00:00+00	Ingeniero reservorios	\n¿Qué buscamos?\n\n• Formación académica: Ingeniería o afines\n\n• Experiencia profesional: mínimo 3 años en la industria y posición (no excluyente)\n\n• Actitud / personalidad: adaptabilidad y flexibilidad, trabajo en equipo, iniciativa, proactividad.\n\n• Conocimientos informáticos: Sahara; manejo paquete office; PowerBi (no excluyente)\n\n	20	24	3 años en la industria (no excluyente)	San Isidro	Ingeniería en Petróleo, Biotecnología	no	Varios	125222	2022-12-07 18:31:17.318+00	2022-12-07 18:33:54.973+00	10	18
69	3012837892	2	3	7	4	2	2022-12-30 00:00:00+00	Supervisor de Laboratorio	Seleccionaremos\n\nSupervisor de Laboratorio\n\nPerfil:\n\n•Nivel de Educación Técnico químico o similar.\n\n•Experiencia Previa Técnico de laboratorio 4 años\n\n•Nivel de Informática Nivel office medio\n\n•Nivel de Idioma Ingles Medio. No excluyente\n\nTareas:\n\n•Supervisar a los técnicos de laboratorio y los técnicos de Recepción Calidad\n\n•Generar la información para todas las reuniones en los clientes, participar según requerimiento.\n\n•Verificar la correcta ejecución de los ensayos y sus registros de acuerdo con el Plan de Control y las necesidades de los procesos\n\n•Gestionar los indicadores del sector\n\n•Recepción de componentes, materias Primas y las pinturas, gestionar reclamo ante los proveedores.\n\n•Confeccionar las polivalencias de su sector.\n\n•Aplicación de TPM\n\nPolivalencias:\n\n•Conocimientos IATF 16949.\n\n•Conocimientos ISO 14001.\n\n•Conocimiento de 5S /TPM\n\n	30	35	No necesita experiencia previa 	Hurlingham	Biotecnología	no	Muchos	40000	2022-12-07 21:43:14.063+00	2022-12-07 21:43:14.063+00	14	19
71	3012837892	2	3	5	4	1	2023-12-31 00:00:00+00	Soporte Técnico de Laboratorio	Buscamos perfiles de Soporte Técnico de Laboratorio para formar parte de nuestro equipo.\n\nLos principales desafíos del puesto son:\n\nInstalación y configuración de sistemas operativos (Windows)\n\nAnálisis y asignación de activos, en base a la demanda de la bandeja de tickets\n\nPreparación y configuración de hardware para derivar a demanda\n\nParticipación activa en el control de inventario\n\nReuniones con dirección para analizar casos, oportunidades y desvíos.\n\nOrden, control y distrubución del HW en el depósito.\n\nGestión y seguimiento de reparaciones por entidades externas\n\nControl, verificación y asignación de estado final del HW ingresante	24	30	No necesita experiencia previa 	Caseros	Biotecnología	No	Muchos	39999	2022-12-07 21:46:00.922+00	2022-12-07 21:47:49.507+00	14	22
70	3012837892	2	3	7	4	1	2023-12-23 00:00:00+00	Analista de control de calidad físico químico	Nos encontramos en búsqueda de un Analista de control de calidad físico químico para formar parte de nuestro staff\n\nSerán sus funciones principales:\n\n-Análisis de producto terminado y semieleborado según técnicas analíticas y Farmacopeas.\n\n-Análisis de materias primas\n\n-Gestión de contramuestras\n\n-Estabilidades\n\n	20	31	No necesita experiencia previa 	Quilmes	Biotecnología	No	Muchos	303030	2022-12-07 21:44:41.271+00	2022-12-07 21:52:45.444+00	10	21
68	3012837892	2	3	7	4	1	2023-12-30 00:00:00+00	Analista de Laboratorio	Importante industria alimenticia se encuentra en la búsqueda de un Analista de Laboratorio.\n\nSus principales tareas serán:\n\nCumplimiento de Instructivos de trabajo del área.\n Efectúa análisis físico – químicos y bacteriológicos de producto final, elaborados, semi\nelaborados y efluentes\n Efectúa calibraciones de equipos de medición y ensayo en planta y laboratorio.\n Efectúa análisis de materias primas, bienes de cambio y productos de empaque.\n Efectúa tomas de muestras de producto final, elaborados y semi elaborados.\n Prepara y valida soluciones analíticas y medios de cultivo\n Realiza el asiento y registro de resultados que surgen de los controles y autocontroles de\nlos procedimientos del área.\n Incorpora al sistema de laboratorio los resultados que surgen de los controles y\nautocontroles de los procedimientos del área.\n Participa en el desarrollo y mejora de procedimientos para el área.\n Informa a sus superiores sobre las desviaciones.\n Informa a sus superiores sobre detecciones de anomalías.\n Reporta a sus superiores de cualquier tipo de anomalía detectada en los procesos y en los\nlaboratorios.\n Responsable del cumplimiento de las normas calidad, de seguridad e higiene,\nprocedimientos de accidentes, reglamento interno etc.\n Ordenamiento y limpieza del material de laboratorio y del sector\n Responsable de cumplimiento de Normas de Calidad e Inocuidad\n\n	20	22	No necesita experiencia previa 	Merlo	Biotecnología	no	Muchos	300000	2022-12-07 21:40:36.948+00	2022-12-07 21:52:49.035+00	10	19
72	30182432120	2	3	3	4	1	2022-12-30 00:00:00+00	Desarrollador Python	Necesitamos un desarrollador Python 	20	24	No	Hurlingham	Informatica	no	Varios	300000	2022-12-08 00:02:13.532+00	2022-12-08 00:02:48.36+00	13	21
\.


--
-- Data for Name: postulaciones; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.postulaciones (id, fk_id_postulante, fk_id_oferta, "createdAt", "updatedAt", fk_id_empresa, contactado) FROM stdin;
162	41744111	61	2022-12-07 14:15:23.354+00	2022-12-07 14:15:23.354+00	3010203041	f
165	25647424	62	2022-12-07 18:57:52.45+00	2022-12-07 18:57:52.45+00	30182432120	f
166	42781646	62	2022-12-07 20:50:19.547+00	2022-12-07 20:50:19.547+00	30182432120	f
167	41744111	63	2022-12-07 23:54:55.759+00	2022-12-08 00:00:55.037+00	30182432120	t
168	25647424	67	2022-12-08 18:01:00.024+00	2022-12-08 18:01:00.024+00	3010203041	f
\.


--
-- Data for Name: postulantes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.postulantes (id, fk_id_tipo_documento, fk_id_usuario, fk_id_estudios, fk_id_carrera, fk_id_estado, nombre, apellido, nacionalidad, fecha_nac, pais, fk_id_provincia, fk_id_ciudad, calle, nro, piso, depto, cp, telefono, cant_materias, alumno_unahur, presentacion, cv, foto, "createdAt", "updatedAt") FROM stdin;
41232451	1	514	5	2	1	Juan Roman	Riquelme	Argentina	2000-11-23 00:00:00+00	Argentina	34	34028	Mate	3310	0	0		122341823	12	t				2022-12-07 22:37:42.178+00	2022-12-07 22:37:42.178+00
41744111	1	469	7	2	1	Joel	Yturrieta	Argentina	1997-12-23 00:00:00+00	Argentina	6	6408	Vidt	2165	0	0		123242580	12	f		application/pdf|5ee9a8e2-5f28-48e8-9fa7-6dff1910435a.pdf	image/png|c362eb31-1a72-4cf5-8ae3-e7bed2634a37.png	2022-12-07 03:12:29.528+00	2022-12-07 23:55:55.858+00
12783917	1	516	8	2	1	Carlos	Lombari	Argentina	1995-01-10 00:00:00+00	Argentina	38	38056	Rancho	4095	0	0		1140667933	231	t				2022-12-08 00:38:20.577+00	2022-12-08 00:38:20.577+00
25647424	1	472	7	2	1	Sebastian	Brandariz	Argentino	1977-03-17 00:00:00+00	Argentina	6	6410	Defilippi	1862	0	0		1132349584	19	f		application/pdf|72679a88-70b0-4f0f-bd06-f583e03a77fe.pdf	image/jpeg|76553d63-29ff-4335-b8cd-0773ccba6841.jpg	2022-12-07 14:09:03.896+00	2022-12-07 14:11:21.058+00
42781646	1	473	7	2	1	Agustin	Cuevas	Argentina	2000-07-31 00:00:00+00	Argentina	6	6410	Ranchos	4095	0	0		1140667933	22	f		application/pdf|07666d4a-7443-41aa-8aea-ad2f7de6a83a.pdf	image/jpeg|4bf6612b-0ba2-47a1-8c80-37392c06139d.jpg	2022-12-07 16:26:06.364+00	2022-12-07 16:32:37.523+00
12341234	1	511	6	4	1	Pablo	Perez	Argentina	1997-07-18 00:00:00+00	Argentina	6	6408	Origone	151	0	0		1124083782	12	t				2022-12-07 19:11:48.515+00	2022-12-07 19:11:48.515+00
41744112	1	513	1	2	1	Hannah	Baker	Argentina	1988-12-23 00:00:00+00	Argentina	42	42070	Dante	3510	0	0		123212232	\N	t				2022-12-07 19:20:02.47+00	2022-12-07 19:20:02.47+00
\.


--
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.provincias (id, nombre, "createdAt", "updatedAt") FROM stdin;
54	Misiones	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
74	San Luis	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
70	San Juan	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
30	Entre Ríos	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
78	Santa Cruz	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
62	Río Negro	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
26	Chubut	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
14	Córdoba	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
50	Mendoza	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
46	La Rioja	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
10	Catamarca	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
42	La Pampa	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
86	Santiago del Estero	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
18	Corrientes	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
82	Santa Fe	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
90	Tucumán	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
58	Neuquén	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
66	Salta	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
22	Chaco	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
34	Formosa	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
38	Jujuy	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	Ciudad Autónoma de Buenos Aires	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
6	Buenos Aires	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
94	Tierra del Fuego	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: rubros; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rubros (id, nombre_rubro, "createdAt", "updatedAt") FROM stdin;
1	desarrollo	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	automotriz	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	farmaceutica	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
4	telecomunicaciones	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: tipos_documentos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tipos_documentos (id, tipo_documento, "createdAt", "updatedAt") FROM stdin;
1	DNI	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
2	PASAPORTE	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
3	LC	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
4	LE	2022-06-05 12:00:00+00	2022-06-05 12:00:00+00
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.usuarios (id, fk_id_grupo, usuario, password, estado, "createdAt", "updatedAt") FROM stdin;
467	1	redbull@redbull.com	$2b$10$0T6Ne6.sC0HOzhgStBGe.uESCx15RE5ituNPNgSv.fs3LcW5M3e.q	f	2022-12-07 03:05:01.222+00	2022-12-07 03:05:01.222+00
465	2	shell@shell.com	$2b$10$eRrpoSWNMe7QbgNIPrVUvOl/KXYkADNXpYeXp6MFb1Yn4DwIjJtBm	t	2022-12-07 02:56:29.044+00	2022-12-07 03:09:50.616+00
469	1	joelyturrieta@gmail.com	$2b$10$pe6NURnRkf8uRtBZd7o2Ve0M2hg/mHtO1CqBFQrA4p6NIyZ7pHI6S	t	2022-12-07 03:11:21.855+00	2022-12-07 03:12:29.529+00
472	1	sebastian.brandariz@gmail.com	$2b$10$Z9JGGftIu6awh61Scjj5.uNZBRURTNIp.wYJxY9A43ENAFqcblqzK	t	2022-12-07 14:07:17.479+00	2022-12-07 14:09:03.896+00
510	1	aysa@aysa.com	$2b$10$RukRvqdc9wIXxWnNXu386OCX1ihL8OhSfUZxJvTFzNA.mo/MnW80.	f	2022-12-07 19:09:07.294+00	2022-12-07 19:09:07.294+00
512	1	curryhaskell@gmail.com	$2b$10$T3eEA9909umTlLjimURiX.A4MNoJ3RQ9Q05Xk/Dhx8unNWnoyX/0.	f	2022-12-07 19:15:09.618+00	2022-12-07 19:15:09.618+00
514	1	pizza@pizza.com	$2b$10$93vog5pRS9l/0so0r9NDcepyBKFH9oPmHQ5xD6j6bWgfoCln9cs2S	t	2022-12-07 22:36:47.402+00	2022-12-07 22:37:42.179+00
516	1	clombardi@gmail.com	$2b$10$/aGV1SOjD4E.sIlMcm4auOrXnvtNGa1dgP0L9qXPq22/Q0tfTkC.2	t	2022-12-08 00:37:17.8+00	2022-12-08 00:38:20.577+00
1	3	admin@unahur.edu.ar	$2b$10$0w5QCKjGuwAXmNBCNGXjD.dm3Hx6/B4tmwGQbe2mdufpocRnkRASG	t	2022-08-23 00:52:55.693+00	2022-08-23 00:52:55.693+00
468	2	bayer@bayer.com	$2b$10$PMZLd/oMi18nHLQ9SjG0M.hD7JbdX6hZPXpmhekd3FmMlRUvh3pZu	t	2022-12-07 03:07:00.113+00	2022-12-07 03:10:03.714+00
466	2	telefonica@telefonica.com	$2b$10$/Ch96TdnRiqBw3/NBeOQsOZzYAWHjCmlqJor567HId1SI/6GerjQK	t	2022-12-07 03:02:41.984+00	2022-12-07 03:10:14.631+00
470	1	empresa1@empresa.com	$2b$10$my431b3HlKxPuHoRcCrP9Oje9pCWUo9M8C.k26fcUQU1iLMgwvbAi	f	2022-12-07 04:19:54.58+00	2022-12-07 04:19:54.58+00
471	1	msguser@gmail.com	$2b$10$9quG6za2EGGhYZm2zWRPs.tv19S1J3cASS4BTOF4EBn5tR//Msb6u	t	2022-12-07 13:52:12.366+00	2022-12-07 13:56:08.265+00
473	1	cuevasagustin168@gmail.com	$2b$10$tW0BvMgE6BISMNPzHhNT/utpnXaSweqdDuFSJZmJ3BV4iWu7PFYwq	t	2022-12-07 16:24:34.019+00	2022-12-07 16:26:06.367+00
511	1	pabloperez@gmail.com	$2b$10$xWgMopGO0qz.iglD/OqZnO3JEd9uCiuE0meuerOeI1i6.2DSHpfhW	t	2022-12-07 19:10:26.991+00	2022-12-07 19:11:48.516+00
513	1	queso@queso.com	$2b$10$gzOLxQPi66fSZ5spwV3jvOn.pi4scIJn9FZ0fH1A/lfO0hglZCks2	t	2022-12-07 19:19:30.001+00	2022-12-07 19:20:02.47+00
515	1	apple@apple.com	$2b$10$nwh/1LqsDSYmLxHLLQLmx.bbI6RxPu1Zjd1WPEnur2AMq0t5IJqYG	f	2022-12-07 22:46:13.558+00	2022-12-07 22:46:13.558+00
518	1	nivea@nivea.com	$2b$10$FkccNNOSly6A8nxq0ToPqOuzc4WgoCGhujr/Lx4azEuT8WV7Dq8wG	f	2022-12-26 01:27:35.585+00	2022-12-26 01:27:35.585+00
\.


--
-- Name: abm_id_abm_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.abm_id_abm_usuario_seq', 1, false);


--
-- Name: aptitudes_id_aptitud_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.aptitudes_id_aptitud_seq', 1, false);


--
-- Name: aptitudes_ofertas_id_aptitudes_oferta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.aptitudes_ofertas_id_aptitudes_oferta_seq', 4, true);


--
-- Name: aptitudes_postulantes_id_aptitudes_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.aptitudes_postulantes_id_aptitudes_seq', 5, true);


--
-- Name: carreras_id_carrera_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.carreras_id_carrera_seq', 1, false);


--
-- Name: contratos_id_contrato_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contratos_id_contrato_seq', 1, false);


--
-- Name: estado_empresas_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estado_empresas_id_estado_seq', 1, false);


--
-- Name: estado_ofertas_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estado_ofertas_id_estado_seq', 1, false);


--
-- Name: estado_postulantes_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estado_postulantes_id_estado_seq', 1, false);


--
-- Name: estudios_id_estudio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.estudios_id_estudio_seq', 1, false);


--
-- Name: grupos_id_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.grupos_id_grupo_seq', 1, false);


--
-- Name: idiomas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.idiomas_id_seq', 1, false);


--
-- Name: idiomas_ofertas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.idiomas_ofertas_id_seq', 2, true);


--
-- Name: idiomas_postulantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.idiomas_postulantes_id_seq', 1, true);


--
-- Name: jornadas_id_jornada_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jornadas_id_jornada_seq', 1, false);


--
-- Name: niveles_idiomas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.niveles_idiomas_id_seq', 1, false);


--
-- Name: ofertas_id_oferta_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ofertas_id_oferta_seq', 72, true);


--
-- Name: postulaciones_id_postulaciones_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.postulaciones_id_postulaciones_seq', 168, true);


--
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.provincias_id_seq', 1, false);


--
-- Name: rubros_id_rubro_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.rubros_id_rubro_seq', 1, false);


--
-- Name: tipos_documentos_id_tipo_documento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipos_documentos_id_tipo_documento_seq', 1, false);


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 518, true);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: abm abm_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.abm
    ADD CONSTRAINT abm_pkey PRIMARY KEY (id_abm_usuario);


--
-- Name: aptitudes_ofertas aptitudes_ofertas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aptitudes_ofertas
    ADD CONSTRAINT aptitudes_ofertas_pkey PRIMARY KEY (id);


--
-- Name: aptitudes aptitudes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aptitudes
    ADD CONSTRAINT aptitudes_pkey PRIMARY KEY (id);


--
-- Name: aptitudes_postulantes aptitudes_postulantes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aptitudes_postulantes
    ADD CONSTRAINT aptitudes_postulantes_pkey PRIMARY KEY (id);


--
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (id);


--
-- Name: contratos contratos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contratos
    ADD CONSTRAINT contratos_pkey PRIMARY KEY (id);


--
-- Name: empresas empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id);


--
-- Name: estado_empresas estado_empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estado_empresas
    ADD CONSTRAINT estado_empresas_pkey PRIMARY KEY (id);


--
-- Name: estado_ofertas estado_ofertas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estado_ofertas
    ADD CONSTRAINT estado_ofertas_pkey PRIMARY KEY (id);


--
-- Name: estado_postulantes estado_postulantes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estado_postulantes
    ADD CONSTRAINT estado_postulantes_pkey PRIMARY KEY (id);


--
-- Name: estudios estudios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.estudios
    ADD CONSTRAINT estudios_pkey PRIMARY KEY (id);


--
-- Name: grupos grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (id);


--
-- Name: idiomas_ofertas idiomas_ofertas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas_ofertas
    ADD CONSTRAINT idiomas_ofertas_pkey PRIMARY KEY (id);


--
-- Name: idiomas idiomas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas
    ADD CONSTRAINT idiomas_pkey PRIMARY KEY (id);


--
-- Name: idiomas_postulantes idiomas_postulantes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas_postulantes
    ADD CONSTRAINT idiomas_postulantes_pkey PRIMARY KEY (id);


--
-- Name: jornadas jornadas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jornadas
    ADD CONSTRAINT jornadas_pkey PRIMARY KEY (id);


--
-- Name: niveles_idiomas niveles_idiomas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.niveles_idiomas
    ADD CONSTRAINT niveles_idiomas_pkey PRIMARY KEY (id);


--
-- Name: ofertas ofertas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT ofertas_pkey PRIMARY KEY (id);


--
-- Name: postulaciones postulaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postulaciones
    ADD CONSTRAINT postulaciones_pkey PRIMARY KEY (id);


--
-- Name: postulantes postulantes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postulantes
    ADD CONSTRAINT postulantes_pkey PRIMARY KEY (id);


--
-- Name: provincias provincias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT provincias_pkey PRIMARY KEY (id);


--
-- Name: rubros rubros_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rubros
    ADD CONSTRAINT rubros_pkey PRIMARY KEY (id);


--
-- Name: tipos_documentos tipos_documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipos_documentos
    ADD CONSTRAINT tipos_documentos_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuario_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuario_unique UNIQUE (usuario);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: abm abm_fk_id_usuario_usuarios_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.abm
    ADD CONSTRAINT abm_fk_id_usuario_usuarios_fk FOREIGN KEY (fk_id_usuario) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: aptitudes_ofertas aptitudes_ofertas_fk_id_aptitud_aptitudes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aptitudes_ofertas
    ADD CONSTRAINT aptitudes_ofertas_fk_id_aptitud_aptitudes_fk FOREIGN KEY (fk_id_aptitud) REFERENCES public.aptitudes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: aptitudes_ofertas aptitudes_ofertas_fk_id_oferta_ofertas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aptitudes_ofertas
    ADD CONSTRAINT aptitudes_ofertas_fk_id_oferta_ofertas_fk FOREIGN KEY (fk_id_oferta) REFERENCES public.ofertas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: aptitudes_postulantes aptitudes_postulantes_fk_id_aptitud_aptitudes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aptitudes_postulantes
    ADD CONSTRAINT aptitudes_postulantes_fk_id_aptitud_aptitudes_fk FOREIGN KEY (fk_id_aptitud) REFERENCES public.aptitudes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: aptitudes_postulantes aptitudes_postulantes_fk_id_documento_postulantes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aptitudes_postulantes
    ADD CONSTRAINT aptitudes_postulantes_fk_id_documento_postulantes_fk FOREIGN KEY (fk_id_usuario) REFERENCES public.postulantes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ciudades ciudades_fk_id_provincia_provincias_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_fk_id_provincia_provincias_fk FOREIGN KEY (fk_id_provincia) REFERENCES public.provincias(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: empresas empresas_fk_id_estado_estado_empresas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_fk_id_estado_estado_empresas_fk FOREIGN KEY (fk_id_estado) REFERENCES public.estado_empresas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: empresas empresas_fk_id_rubro_rubros_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_fk_id_rubro_rubros_fk FOREIGN KEY (fk_id_rubro) REFERENCES public.rubros(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: empresas empresas_fk_id_usuario_usuarios_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresas
    ADD CONSTRAINT empresas_fk_id_usuario_usuarios_fk FOREIGN KEY (fk_id_usuario) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: idiomas_ofertas idiomas_ofertas_fk_id_idioma_idiomas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas_ofertas
    ADD CONSTRAINT idiomas_ofertas_fk_id_idioma_idiomas_fk FOREIGN KEY (fk_id_idioma) REFERENCES public.idiomas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: idiomas_ofertas idiomas_ofertas_fk_id_nivel_niveles_idiomas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas_ofertas
    ADD CONSTRAINT idiomas_ofertas_fk_id_nivel_niveles_idiomas_fk FOREIGN KEY (fk_id_nivel) REFERENCES public.niveles_idiomas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: idiomas_ofertas idiomas_ofertas_fk_id_oferta_ofertas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas_ofertas
    ADD CONSTRAINT idiomas_ofertas_fk_id_oferta_ofertas_fk FOREIGN KEY (fk_id_oferta) REFERENCES public.ofertas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: idiomas_postulantes idiomas_postulantes_fk_id_idioma_idiomas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas_postulantes
    ADD CONSTRAINT idiomas_postulantes_fk_id_idioma_idiomas_fk FOREIGN KEY (fk_id_idioma) REFERENCES public.idiomas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: idiomas_postulantes idiomas_postulantes_fk_id_nivel_niveles_idiomas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas_postulantes
    ADD CONSTRAINT idiomas_postulantes_fk_id_nivel_niveles_idiomas_fk FOREIGN KEY (fk_id_nivel) REFERENCES public.niveles_idiomas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: idiomas_postulantes idiomas_postulantes_fk_id_postulante_postulantes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.idiomas_postulantes
    ADD CONSTRAINT idiomas_postulantes_fk_id_postulante_postulantes_fk FOREIGN KEY (fk_id_postulante) REFERENCES public.postulantes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ofertas ofertas_fk_id_carrera_carreras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT ofertas_fk_id_carrera_carreras_fk FOREIGN KEY (fk_id_carrera) REFERENCES public.carreras(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ofertas ofertas_fk_id_contrato_contratos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT ofertas_fk_id_contrato_contratos_fk FOREIGN KEY (fk_id_contrato) REFERENCES public.contratos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ofertas ofertas_fk_id_cuit_empresas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT ofertas_fk_id_cuit_empresas_fk FOREIGN KEY (fk_id_empresa) REFERENCES public.empresas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ofertas ofertas_fk_id_estado_estado_ofertas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT ofertas_fk_id_estado_estado_ofertas_fk FOREIGN KEY (fk_id_estado) REFERENCES public.estado_ofertas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ofertas ofertas_fk_id_estudio_estudios_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT ofertas_fk_id_estudio_estudios_fk FOREIGN KEY (fk_id_estudio) REFERENCES public.estudios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ofertas ofertas_fk_id_jornada_jornadas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ofertas
    ADD CONSTRAINT ofertas_fk_id_jornada_jornadas_fk FOREIGN KEY (fk_id_jornada) REFERENCES public.jornadas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postulaciones postulaciones_fk_id_documento_postulantes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postulaciones
    ADD CONSTRAINT postulaciones_fk_id_documento_postulantes_fk FOREIGN KEY (fk_id_postulante) REFERENCES public.postulantes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postulaciones postulaciones_fk_id_oferta_ofertas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postulaciones
    ADD CONSTRAINT postulaciones_fk_id_oferta_ofertas_fk FOREIGN KEY (fk_id_oferta) REFERENCES public.ofertas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postulantes postulantes_fk_id_carrera_carreras_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postulantes
    ADD CONSTRAINT postulantes_fk_id_carrera_carreras_fk FOREIGN KEY (fk_id_carrera) REFERENCES public.carreras(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postulantes postulantes_fk_id_estado_estado_postulantes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postulantes
    ADD CONSTRAINT postulantes_fk_id_estado_estado_postulantes_fk FOREIGN KEY (fk_id_estado) REFERENCES public.estado_postulantes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postulantes postulantes_fk_id_estudios_estudios_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postulantes
    ADD CONSTRAINT postulantes_fk_id_estudios_estudios_fk FOREIGN KEY (fk_id_estudios) REFERENCES public.estudios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postulantes postulantes_fk_id_tipo_documento_tipos_documentos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postulantes
    ADD CONSTRAINT postulantes_fk_id_tipo_documento_tipos_documentos_fk FOREIGN KEY (fk_id_tipo_documento) REFERENCES public.tipos_documentos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postulantes postulantes_fk_id_usuario_usuarios_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postulantes
    ADD CONSTRAINT postulantes_fk_id_usuario_usuarios_fk FOREIGN KEY (fk_id_usuario) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: usuarios usuarios_fk_id_grupo_grupos_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_fk_id_grupo_grupos_fk FOREIGN KEY (fk_id_grupo) REFERENCES public.grupos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT USAGE ON SCHEMA public TO postgres;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON LANGUAGE plpgsql TO postgres;


--
-- PostgreSQL database dump complete
--

