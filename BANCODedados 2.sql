create database loja_tech;
use loja_tech;

create table cliente (
	id_client int auto_increment primary key,
	nome varchar(100) not null,
	cpf varchar(14) not null unique,
	email varchar(100) not null unique,
	telefone varchar(16) not null unique,
	data_nascimento date not null,
	cidade varchar(100) not null,
	estado char(2) not null,
	data_cadastro date not null default (current_date)
);

create table funcionario (
	id_funcionario int auto_increment primary key,
	nome varchar(100) not null,
	cpf varchar(14) not null unique,
	email varchar(100) not null unique,
	telefone varchar(16) not null unique,
	data_nascimento date not null,
	cidade varchar(100) not null,
	estado char(2) not null,
	data_cadastro date not null default (current_date),
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

create table categoria (
	id_categoria int auto_increment primary key,
	nome varchar(100) not null unique,
	descricao varchar(255)
);

create table produto (
	id_produto int auto_increment primary key,
	id_categoria int not null,
	id_fornecedor int not null,
	nome varchar(150) not null,
	descricao text,
	preco decimal(10, 2) not null,
	custo decimal(10, 2) not null,
	codigo_barras varchar(100) not null,
	data_cadastro date not null default (current_date),
	constraint fk_produto_categoria foreign key (id_categoria) references categoria(id_categoria),
	constraint fk_produto_fornecedor foreign key (id_fornecedor) references fornecedor(id_fornecedor)
);

create table estoque (
	id_estoque int auto_increment primary key,
	id_produto int not null unique,
	quantidade int not null default 0,
	estoque_minimo int not null default 5,
	ultima_atualizacao datetime not null default current_timestamp on update current_timestamp,
	foreign key (id_produto) references produto(id_produto)
);

create table pedido (
	id_pedido int auto_increment primary key,
	id_cliente int not null,
	id_funcionario int not null,
	data_pedido datetime not null default current_timestamp,
	status varchar(50) not null,
	constraint fk_pedido_cliente foreign key (id_cliente) references cliente(id_client),
	constraint fk_pedido_funcionario foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table item_pedido (
	id_item int auto_increment primary key,
	id_pedido int not null,
	id_produto int not null,
	quantidade int not null,
	preco_unitario decimal(10, 2) not null,
	constraint fk_item_pedido foreign key (id_pedido) references pedido(id_pedido),
	constraint fk_item_produto foreign key (id_produto) references produto(id_produto)
);
