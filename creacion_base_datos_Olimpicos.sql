CREATE DATABASE Olimpicos;
USE Olimpicos;



CREATE TABLE comisario(
    id_comisario INT(12) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    tipo VARCHAR(20) NOT NULL
);
CREATE TABLE jefe(
    id_jefe INT(10) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    titulo VARCHAR(100) NOT NULL
);
CREATE TABLE deporte(
    id_deporte INT(10) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    num_jugadores INT(8) NOT NULL
);

CREATE TABLE equipamiento(
    id_equipamiento INT(10) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    stock INT(10)
);

CREATE TABLE evento(
    id_evento INT(10) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    duracion TIME NOT NULL,
    num_participantes INT(10) NOT NULL
);


-- esta es la entiedad fuerte
CREATE TABLE info_complejo(
    id_complejo INT(10) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    area_complejo FLOAT NOT NULL,
    id_jefe INT(10) NOT NULL,
    Foreign Key (id_jefe) REFERENCES jefe(id_jefe)
);

-- este se especializa solo en un deporte entiendad  debil
CREATE TABLE complejo_deportivo (
    id_complejo_deportivo INT(10) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_deporte INT(10) NOT NULL,
    id_info_complejo INT(10) NOT NULL,
    Foreign Key (id_info_complejo) REFERENCES info_complejo(id_complejo),
    Foreign Key (id_deporte) REFERENCES deporte(id_deporte)
);


-- este puede albergar varios deportes entidad debil
CREATE TABLE complejo_polideportivo(
    id_complejo_polideportivo INT(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_deporte INT(10) NOT NULL,
    id_info_complejo INT(10) NOT NULL,
    Foreign Key (id_info_complejo) REFERENCES info_complejo(id_complejo),
    Foreign Key (id_deporte) REFERENCES deporte(id_deporte)
);

-- tablas de muchos a muchos como eventos y los diferene tipos de complejos que hay como tal

CREATE TABLE evento_equipo(
    id_evento_equipo INT(10) NOT NULL,
    id_evento INT(10) NOT NULL,
    id_equipamiento INT(10) NOT NULL,
    PRIMARY KEY (id_evento_equipo, id_evento, id_equipamiento ),
    Foreign Key (id_evento) REFERENCES evento(id_evento),
    Foreign Key (id_equipamiento) REFERENCES equipamiento(id_equipamiento)
);


CREATE TABLE evento_comisario(
    id_evento_comisario INT(10) NOT NULL,
    id_evento INT(10) NOT NULL,
    id_comisario INT(10) NOT NULL,
    PRIMARY KEY(id_evento_comisario, id_evento, id_comisario),
    Foreign Key (id_evento) REFERENCES evento(id_evento),
    Foreign Key (id_comisario) REFERENCES comisario(id_comisario)
);

CREATE TABLE evento_complejo_poli(
    id_evento_complejo INT(10) NOT NULL,
    id_evento INT(10) NOT NULL,
    id_complejo_poli INT(10) NOT NULL,
    PRIMARY KEY(id_evento_complejo, id_evento, id_complejo_poli),
    Foreign Key (id_evento) REFERENCES evento(id_evento),
    Foreign Key (id_complejo_poli) REFERENCES complejo_polideportivo(id_complejo_polideportivo)
);

CREATE TABLE evento_complejo_deportivo(
    id_evento_complejo_deportivo INT(10) NOT NULL,
    id_evento INT(10) NOT NULL,
    id_complejo_deportivo INT(10) NOT NULL,
    PRIMARY KEY(id_evento_complejo_deportivo, id_evento, id_complejo_deportivo),
    Foreign Key (id_evento) REFERENCES evento(id_evento),
    Foreign Key (id_complejo_deportivo) REFERENCES complejo_deportivo(id_complejo_deportivo)
);


-- --------------------------------------------------------
-- tablas editadas donde sede almacena informacion de cada complejo y sus diferentes aatributos por los mismo decidi que consumiera o antrajera informacion del complejo directamente.
CREATE TABLE sede(
    id_sede INT(10) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_complejo INT(10) NOT NULL,
    presupuesto FLOAT NOT NULL,
    Foreign Key (id_complejo) REFERENCES info_complejo(id_complejo)
);
