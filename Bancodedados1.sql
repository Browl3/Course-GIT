create database loja_tech;
use loja_tech;

create table cliente (
	id_client int auto_increment primary key,
	nome varchar(100) not null ,
	cpf varchar(14) not null unique ,
	email varchar(100) not null unique, 
	telefone varchar(16) not null unique,
	data_nascimento date not null, 
	cidade varchar(100) not null, 
	estado char(2) not null ,
	data_cadastro date not null

);


create table funcionario (
	
	id_client int auto_increment primary key,
	nome varchar(100) not null ,
	cpf varchar(14) not null unique ,
	email varchar(100) not null unique, 
	telefone varchar(16) not null unique,
	data_nascimento date not null, 
	cidade varchar(100) not null, 
	estado char(2) not null ,
	data_cadastro date not null,
    cargo varchar(50) not null,
	salario decimal(18, 2) not null,
    data_admissao date not null

);


create table fornecedor (
	
    id_fornecedor int auto_increment primary key, 
    razao_social varchar(150) not null, 
    nome_fantasia varchar(150) not null, 
    cnpj varchar(19) not null unique,
    email varchar(50) not null,
    telefone varchar(20) not null,
	cidade varchar(50) not null,
    estado char(2) not null
);
show tables; 






