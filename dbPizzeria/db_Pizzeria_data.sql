-- Eliminar la base de dato dbCurso
DROP DATABASE dbPizzaJava;

-- Crear base de datos dbPizzaJava
CREATE DATABASE IF NOT EXISTS dbPizzaJava
DEFAULT CHARACTER SET utf8;

-- Poner en uso la base de datos
USE dbPizzaJava;

-- Crear la tabla UBIGEO
CREATE TABLE UBIGEO 
(
    CODUBI CHAR(6),
    DEPAUBI VARCHAR(50) NOT NULL,
    PROVUBI VARCHAR(50) NOT NULL,
    DISTUBI VARCHAR(50) NOT NULL,
    CONSTRAINT CODUBI_PK PRIMARY KEY(CODUBI)
);

-- Crear la tabla CLIENTE
CREATE TABLE CLIENTE 
(
    CODCLI CHAR(4),
    NOMCLI VARCHAR(20) NOT NULL,
    APECLI VARCHAR(20) NOT NULL,
    FECNACICLI date NOT NULL,
    TELFCLI CHAR(9),
    DIRRECCLI VARCHAR(80),
    DNICLI CHAR(8) NOT NULL,
    SEXCLI CHAR(1) NOT NULL,
    ESTCLI CHAR(1) NOT NULL,
    CODUBI CHAR(6),
    CONSTRAINT CODCLI_PK PRIMARY KEY(CODCLI)
);

-- Crear la tabla VENDEDOR
CREATE TABLE VENDEDOR 
(
    CODVEN CHAR(4),
    NOMVEN VARCHAR(20) NOT NULL,
    APEVEN VARCHAR(20) NOT NULL,
    SEXVEN CHAR(1) NOT NULL,
    TELFVEN CHAR(9),
    DIRRECVEN VARCHAR(80),
    DNIVEN CHAR(8) NOT NULL,
    ESTVEN CHAR(1) NOT NULL,
    CONSTRAINT CODVEN_PK PRIMARY KEY(CODVEN)
);

-- Crear la tabla BOLETA
CREATE TABLE BOLETA
(
	CODBOL CHAR(4),
    FECBOL DATE NOT NULL,
    CODCLI CHAR(4),
    CODVEN CHAR(4),
    CONSTRAINT CODBOL_PK PRIMARY KEY(CODBOL)
);

-- Crear la tabla PIZZA
CREATE TABLE PIZZA
(
	CODPIZ CHAR(4),
    TIPPIZ VARCHAR(50) NOT NULL,
    TAMPIZ CHAR(10) NOT NULL,
    PRECPIZ DECIMAL(10,2) NOT NULL,
    ESTPIZ CHAR(1) NOT NULL,
    CONSTRAINT CODPIZ_PK PRIMARY KEY(CODPIZ)
);

-- Crear la tabla BOLETA_DETALLE
CREATE TABLE BOLETA_DETALLE
(
	CODBOLDET CHAR(4),
    CANTPROD INT NOT NULL,
    CODBOL CHAR(4),
    CODPIZ CHAR(4),
    CONSTRAINT CODBOLDET_PK PRIMARY KEY(CODBOLDET)
);

-- Relacionar la tabla UBIGEO con CLIENTE
ALTER TABLE CLIENTE
ADD CONSTRAINT UBIGEO_CLIENTE_CODUBI
FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI);

-- Relacionar la tabla CLIENTE con BOLETA
ALTER TABLE BOLETA
ADD CONSTRAINT CLIENTE_BOLETA_CODCLI
FOREIGN KEY (CODCLI) REFERENCES CLIENTE (CODCLI);

-- Relacionar la tabla VENDEDOR con BOLETA
ALTER TABLE BOLETA
ADD CONSTRAINT VENDEDOR_BOLETA_CODVEN
FOREIGN KEY (CODVEN) REFERENCES VENDEDOR (CODVEN);

-- Relacionar la tabla BOLETA con BOLETA_DETALLE
ALTER TABLE BOLETA_DETALLE
ADD CONSTRAINT BOLETA_BOLETA_DETALLE_CODBOL
FOREIGN KEY (CODBOL) REFERENCES BOLETA (CODBOL);

-- Relacionar la tabla PIZZA con BOLETA_DETALLE
ALTER TABLE BOLETA_DETALLE
ADD CONSTRAINT PIZZA_BOLETA_DETALLE_CODPIZ
FOREIGN KEY (CODPIZ) REFERENCES PIZZA (CODPIZ);

-- Insertar registro a la tabla UBIGEO
INSERT INTO UBIGEO
    (CODUBI, DEPAUBI, PROVUBI, DISTUBI)
VALUES
    ("140401", "Lima", "Cañete", "San Vicente"),
    ("140411", "Lima", "Cañete", "Quilmana"),
    ("140408", "Lima", "Cañete", "Mala"),
    ("140407", "Lima", "Cañete", "Lunahuana"),
    ("140414", "Lima", "Cañete", "SANTA CRUZ DE FLORES"),
    ("140413", "Lima", "Cañete", "San Luis"),
    ("140406", "Lima", "Cañete", "Imperial"),
    ("140416", "Lima", "Cañete", "Asia"),
    ("140409", "Lima", "Cañete", "Nuevo Imperial"),
    ("140403", "Lima", "Cañete", "Cerro Azul");

-- Insertar registro a la tabla CLIENTE
INSERT INTO CLIENTE
    (CODCLI, NOMCLI, APECLI, FECNACICLI, TELFCLI, DIRRECCLI, DNICLI, SEXCLI, ESTCLI, CODUBI)
VALUES
    ("C001", "Andrés", "Avelino", '02-01-09', "984763098", "Av. Siempre viva", "83792017", "M", "A", "140401"),
    ("C002", "Carlos", "Guerrero", '01-01-10', "934063098", "Av. Los Rosales", "80012017", "M", "A", "140411"),
    ("C003", "Ana", "Quispe", '98-01-11', "920017658", "Av. Ramos", "39017017", "F", "A", "140408"),
    ("C004", "Javier", "Guzman", '84-01-12', "939992808", "Av. Iquitos", "13812017", "F", "A", "140407"),
    ("C005", "Carla", "Campos", '94-01-13', "937810209", "Av. Los Olivos", "80013990", "F", "A", "140414"),
    ("C006", "Esteban", "Perez", '98-01-14', "934228170", "Av. Lima", "36618729", "M", "A", "140413"),
    ("C007", "Paula", "Guerrero", '99-01-15', "934022009", "Av. Junin", "10092846", "F", "A", "140406"),
    ("C008", "Ramon", "Sanchez", '89-01-16', "933966098", "Av. Nazca", "80012017", "M", "A", "140416"),
    ("C009", "Julia", "Ramos", '90-01-17', "920018098", "Av. 28 de Julio", "12387787", "F", "A", "140409"),
    ("C010", "Marta", "Gonzales", '97-01-18', "927748390", "Av. Italia", "80588479", "F", "A", "140403");
    
-- Insertar registro a la tabla VENDEDOR
INSERT INTO VENDEDOR
    (CODVEN, NOMVEN, APEVEN, SEXVEN, TELFVEN, DIRRECVEN, DNIVEN, ESTVEN)
VALUES
    ("V001", "Renato", "Sanchez", "M", "928982706", "Av. Lima", "73934789", "A"),
    ("V002", "Fernanda", "García", "F", "926661198", "Av. Campos", "82201876", "A"),
    ("V003", "Gabriel", "Cahuin", "M", "944587375", "Av. Lima", "76399207", "A"),
    ("V004", "Andrés", "Casas", "M", "984388093", "Av. Los olvidos", "85530091", "A"),
    ("V005", "Paul", "Balboa", "M", "984762236", "Av. Ramires", "33662817", "A"),
    ("V006", "Julian", "Huamán", "M", "982210987", "Av. Las Peras", "45678234", "A"),
    ("V007", "Rosa", "Quispe", "F", "966789045", "Av. La Parca", "87609023", "A"),
    ("V008", "Isabel", "Gomez", "F", "978726371", "Av. Siempre Viva", "45637892", "A"),
    ("V009", "Carol", "Espinoza", "F", "955392761", "Av. Olivos", "34526719", "A"),
    ("V010", "Marco", "Huaman", "M", "922001926", "Av. Los Jardines", "44590387", "A");
    
-- Insertar registro a la tabla BOLETA
INSERT INTO BOLETA
    (CODBOL, FECBOL, CODCLI, CODVEN)
VALUES
    ("B001", '21-01-08', "C001", "V001"),
    ("B002", '21-01-09', "C002", "V002"),
    ("B003", '21-01-10', "C003", "V003"),
    ("B004", '21-01-11', "C004", "V004"),
    ("B005", '21-01-12', "C005", "V005"),
    ("B006", '21-01-13', "C006", "V006"),
    ("B007", '21-01-14', "C007", "V007"),
    ("B008", '21-01-15', "C008", "V008"),
    ("B009", '21-01-16', "C009", "V009"),
    ("B010", '21-01-17', "C010", "V010");
    
-- Insertar registro a la tabla PIZZA
INSERT INTO PIZZA
    (CODPIZ, TIPPIZ, TAMPIZ, PRECPIZ, ESTPIZ)
VALUES
    ("P001", "Americana", "Familiar", "32.00", "A"),
    ("P002", "Hawaiana", "Grande", "28.00", "A"),
    ("P003", "Vegetal", "Familiar", "32.00", "A"),
    ("P004", "Americana", "Mediano", "22.00", "A"),
    ("P005", "Napolitana", "Familiar", "35.00", "A"),
    ("P006", "Muzzarella", "Pequeño", "12.00", "A"),
    ("P007", "Vegetal", "Mediano", "24.00", "A"),
    ("P008", "Americana", "Pequeño", "11.00", "A"),
    ("P009", "Fugazzeta", "Familiar", "45.00", "A"),
    ("P010", "Hawaiana", "Mediano", "23.00", "A");
    
-- Insertar registro a la tabla BOLETA_DETALLE
INSERT INTO BOLETA_DETALLE
    (CODBOLDET, CANTPROD, CODBOL, CODPIZ)
VALUES
    ("P001", 1, "B001", "P001"),
    ("P002", 2, "B002", "P002"),
    ("P003", 1, "B003", "P003"),
    ("P004", 1, "B004", "P004"),
    ("P005", 2, "B005", "P005"),
    ("P006", 2, "B006", "P006"),
    ("P007", 1, "B007", "P007"),
    ("P008", 1, "B008", "P008"),
    ("P009", 1, "B009", "P009"),
    ("P010", 2, "B010", "P010");