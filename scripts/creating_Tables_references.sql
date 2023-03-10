CREATE TABLE CLIENTE (
	idcliente int NOT NULL,
	nome char(90) NOT NULL,
	datadenascimento date NOT NULL,
	email char(50) NOT NULL,
	telefone char(12) NULL,
	PRIMARY KEY (idcliente) );
CREATE TABLE CURSO (
	idcurso int NOT NULL,
	nome char(90) NOT NULL,
	cargahoraria int NOT NULL,
	descricao char(120) NOT NULL,
	PRIMARY KEY (idcurso) );
CREATE TABLE INSCRICAO (
	idcliente int NOT NULL,
	idcurso int NOT NULL,
	datadeinscricao date NOT NULL,
	datadecancelamento date NULL,
	PRIMARY KEY (idcliente, idcurso),
	FOREIGN KEY (idcurso) REFERENCES CURSO (idcurso),
	FOREIGN KEY (idcliente) REFERENCES CLIENTE (idcliente));

insert into CLIENTE 
values (1, 'Ruan Afonso', '1996-07-31', 'ruan_email@email.com', '(21)91234-4321');
insert into CURSO 
values (1, 'SQL', 20, 'Curso de SQL básico');
insert into INSCRICAO 
values (1, 1, '2023-02-21', null);
values (1, 1, '2023-02-21', '2024-02-21'); --Curso será cancelado automaticamente depois de 1 ano