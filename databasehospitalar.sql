create database sistema_hospitalar;

use sistema_hospitalar;



create table  hospitais (
id int auto_increment primary key,
nome varchar(150) not null, 
cidade varchar(100),
estado char(2),
tipo varchar(30), 
capacidade_de_leitos int,
telefone varchar(20)

);

create table convenios (
id int auto_increment primary key,
nome varchar(100) not null,
tipo varchar(50),
cobertura_porcentual int,
telefone varchar(20)
);


create table medicos (
id int auto_increment primary key,
nome varchar(100) not null,
crm varchar(100) not null,
especialidade_id int,
hospital_id int, 
telefone varchar(20),
email varchar(100),
salario decimal(10, 2),
data_contratacao date,
sexo char(1)

);


create table pacientes (
id int auto_increment primary key,
nome varchar(100) not null,
cpf varchar(20) not null unique,
data_nascimento date, 
sexo char(1),
telefone varchar(20),
email varchar(100),
endereco varchar(200), 
cidadade varchar(100),
estado char(2),
tipo_sanguineo char(3),
convenio_id int, 
data_cadastro date

);

create table medicamentos (
id int auto_increment primary key,
nome varchar(100) not null,
principio_ativo varchar(100),
fabricante varchar(100),
tipo varchar(100),
preco decimal(8, 2), 
controlado tinyint(1)
);

create table consultas (
id int auto_increment primary key,
paciente_id int not null,
medico_id int not null,
hospital_id int,
convenio_id int,
data_consulta date,
hora_consulta time,
tipo_consulta varchar(50),
status varchar(20),
valor decimal(8, 2)
);

create table exames (
id int auto_increment primary key,
paciente_id int not null,
medico_id int,
tipo_exame varchar(100),
data_exame date,
resultado_exame varchar (30),
valor decimal(8, 2),
status varchar(20)
);

create table prescricoes (
id int auto_increment primary key,
consulta_id int not null,
medicamentos_id int not null,
dosagem varchar(50),
frequencia varchar(50),
duracao_dias int
);

create table internacoes (
id int auto_increment primary key,
paciente_id int not null, 
medico_id int, 
hospital_id int, 
data_entrada date, 
data_saida date, 
motivo varchar(100),
quarto varchar(100),
valor_diaria decimal(10, 2),
status varchar(20)
);



INSERT INTO especialidades (id, nome, descricao) VALUES(1, 'Cardiologia', 'Diagnóstico e tratamento de doenças do coração e sistema circulatório'),(2, 'Pediatria', 'Cuidados médicos voltados para crianças e adolescentes'),(3, 'Ortopedia', 'Tratamento de lesões e doenças do sistema musculoesquelético'),(4, 'Dermatologia', 'Diagnóstico e tratamento de doenças da pele'),(5, 'Ginecologia', 'Saúde do sistema reprodutor feminino'),(6, 'Neurologia', 'Tratamento de doenças do sistema nervoso'),(7, 'Oftalmologia', 'Diagnóstico e tratamento de doenças oculares'),(8, 'Psiquiatria', 'Tratamento de transtornos mentais e emocionais'),(9, 'Endocrinologia', 'Tratamento de distúrbios hormonais e metabólicos'),(10, 'Urologia', 'Tratamento do sistema urinário e reprodutor masculino'),(11, 'Oncologia', 'Diagnóstico e tratamento de cânceres'),(12, 'Otorrinolaringologia', 'Tratamento de ouvido, nariz e garganta'),(13, 'Gastroenterologia', 'Tratamento do sistema digestivo'),(14, 'Pneumologia', 'Tratamento de doenças respiratórias'),(15, 'Reumatologia', 'Tratamento de doenças autoimunes e articulares'),(16, 'Clínica Geral', 'Atendimento médico geral e preventivo'),(17, 'Anestesiologia', 'Administração de anestesia em procedimentos cirúrgicos'),(18, 'Cirurgia Geral', 'Procedimentos cirúrgicos diversos'),(19, 'Nefrologia', 'Tratamento de doenças renais'),(20, 'Infectologia', 'Tratamento de doenças infecciosas');


INSERT INTO convenios (id, nome, tipo, cobertura_percentual, telefone) VALUES(1, 'Unimed', 'Cooperativa Médica', 80, '(24) 95889-9317'),(2, 'Bradesco Saúde', 'Seguradora', 70, '(88) 94258-3504'),(3, 'Amil', 'Operadora de Saúde', 75, '(58) 93646-9837'),(4, 'SulAmérica Saúde', 'Seguradora', 65, '(78) 91009-6310'),(5, 'Hapvida', 'Operadora de Saúde', 60, '(73) 91319-2832'),(6, 'NotreDame Intermédica', 'Operadora de Saúde', 70, '(57) 96038-4923'),(7, 'Golden Cross', 'Operadora de Saúde', 55, '(18) 94946-2290'),(8, 'Porto Seguro Saúde', 'Seguradora', 68, '(21) 98962-2133'),(9, 'São Francisco Saúde', 'Operadora de Saúde', 50, '(79) 93060-3103'),(10, 'Prevent Senior', 'Operadora de Saúde', 85, '(95) 98787-3705'),(11, 'Cassi', 'Autogestão', 90, '(44) 99645-7932'),(12, 'Ipasgo', 'Autogestão', 78, '(38) 99835-4295'),(13, 'SUS - Particular', 'Público', 0, '(50) 97537-7118'),(14, 'Care Plus', 'Operadora Premium', 95, '(67) 99479-8397'),(15, 'Central Nacional Unimed', 'Cooperativa Médica', 82, '(26) 95061-4681');

