create database loja_tech;
use loja_tech;

create table cliente (

	id_client int auto_increment primary key,
    nome varchar(100) not null ,
	cpf varchar(14) not null unique ,
	email varchar(100) not null unique, 
	telefone varchar(16) not null unique;


)






