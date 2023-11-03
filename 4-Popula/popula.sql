USE desafio2;


iNSERT INTO CATEGORIA VALUES
	(10, 'Hatch-Back'),
    (11, 'Sedan'),
    (12, 'Van'),
    (13, 'Coupé'),
    (14, 'SUV');

INSERT INTO MODELO VALUES
	(111111, 'VolksWagen', 'Golf TSI 1.4'),
	(222222, 'Chevrolet', 'Cruze LTZ'),
	(333333, 'Fiat', 'Argo Drive 1.0'),
	(444444, 'CAOA Cherry', 'Tiggo 8'),
	(555555, 'Renault', 'Fluence Gt 2.0 16v');

INSERT INTO TIPOINFRACAO (valor, nome) VALUES
	(293.43, 'Avanço de Sinal Vermelho'),
	(586.94, 'Dirigir veículo com CNH de categoria diferente'),
	(586.94, 'Permitir que uma pessoa sem habilitação dirija o seu veículo'),
	(880.41, 'Transitar em velocidade superior à máxima permitida em mais de 50%'),
	(2934.70, 'Disputar corrida');

INSERT INTO PROPRIETARIO VALUES
	(11111111111, 'Fernando Moura', 'Brasília', 'Lago Norte', 'DF', 'Rua 3 casa 6', '2000-03-12', 'M'),
	(22222222222, 'Leticia Lemos', 'Brasília', 'Vila Planalto', 'DF', 'Rua 1 casa 1', '1999-02-01', 'F'),
	(33333333333, 'Gabriela Fernandes', 'Brasília', 'Asa Sul', 'DF', 'Rua 9 casa 17', '2004-06-24', 'F'),
	(44444444444, 'Dacielle Alvez', 'Brasília', 'Sobradinho', 'DF', 'Condominio seito casa 5', '2001-08-12', 'M'),
	(55555555555, 'Renato Macedo', 'Brasília', 'Sobradinho', 'DF', 'Rua 2 casa 9', '1965-12-31', 'M');


INSERT INTO telefone VALUES
	(061999999999, 11111111111),
	(061988888888, 22222222222),
	(061977777777, 33333333333),
	(061966666666, 44444444444),
	(061955555555, 55555555555);

INSERT INTO VEICULO VALUES
	('LAK2458', 'Branco', 'FNA97FAP9W7G12S82', 2013, 111111, 10),
	('VPS3S59', 'Azul', 'EQ698E4F654F984WA', 2022, 222222, 11),
	('VSI3215', 'Vermelho', '56ZZ63541F6Z84ESF', 2017, 333333, 12),
	('OEE9K20', 'Cinza', 'SE687TGX684GX38X5', 2023, 444444, 13),
	('PAW0245', 'Preto', '6A87FR6F46A54F6A8', 2015, 555555, 14);
    
INSERT INTO possui VALUE
	(11111111111, 'LAK2458'),
	(22222222222, 'VPS3S59'),
	(33333333333, 'VSI3215'),
	(44444444444, 'OEE9K20'),
	(55555555555, 'PAW0245');

INSERT INTO LOCALIDADE VALUES 
	(),
	latitude VARCHAR(9) NOT NULL,
    longitude VARCHAR(9) NOT NULL,
    velocidadePermitida NUMERIC(3) NOT NULL,
    CONSTRAINT LOCALIDADE_PK PRIMARY KEY (latitude, longitude)
) ENGINE = InnoDB;

CREATE TABLE AGENTE(
	matricula NUMERIC(11) NOT NULL,
    nomeCompleto VARCHAR(50) NOT NULL,
    dataContratacao DATE NOT NULL, 
    CONSTRAINT AGENTE_PK PRIMARY KEY (matricula)
) ENGINE = InnoDB;

CREATE TABLE INFRACAO(
	idInfracao TINYINT NOT NULL AUTO_INCREMENT,
    dataHora DATETIME NOT NULL,
    velocidadeAferida NUMERIC(3), 
    idTipoInfracao TINYINT NOT NULL,
    matricula NUMERIC(11) NOT NULL,
    latitude VARCHAR(9) NOT NULL,
    longitude VARCHAR(30) NOT NULL,
    CONSTRAINT AGENTE_PK PRIMARY KEY (idInfracao),
    CONSTRAINT INFRACAO_TIPOINFRACAO_FK FOREIGN KEY (idTipoInfracao) REFERENCES TIPOINFRACAO (idTipoInfracao),
    CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matricula) REFERENCES AGENTE (matricula),
    CONSTRAINT INFRACAO_LOCALIDADE_FK FOREIGN KEY (latitude, longitude) REFERENCES LOCALIDADE (latitude, longitude)
) ENGINE = InnoDB AUTO_INCREMENT=1;

CREATE TABLE comete(
	placa VARCHAR(9) NOT NULL,
    idInfracao TINYINT NOT NULL,
    CONSTRAINT comete_VEICULO_FK FOREIGN KEY (placa) REFERENCES VEICULO (placa),
    CONSTRAINT comete_INFRACAO_FK FOREIGN KEY (idInfracao) REFERENCES INFRACAO (idInfracao)
) ENGINE = InnoDB;