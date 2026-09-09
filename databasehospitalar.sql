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


INSERT INTO convenios (id, nome, tipo, cobertura_porcentual, telefone) VALUES(1, 'Unimed', 'Cooperativa Médica', 80, '(24) 95889-9317'),(2, 'Bradesco Saúde', 'Seguradora', 70, '(88) 94258-3504'),(3, 'Amil', 'Operadora de Saúde', 75, '(58) 93646-9837'),(4, 'SulAmérica Saúde', 'Seguradora', 65, '(78) 91009-6310'),(5, 'Hapvida', 'Operadora de Saúde', 60, '(73) 91319-2832'),(6, 'NotreDame Intermédica', 'Operadora de Saúde', 70, '(57) 96038-4923'),(7, 'Golden Cross', 'Operadora de Saúde', 55, '(18) 94946-2290'),(8, 'Porto Seguro Saúde', 'Seguradora', 68, '(21) 98962-2133'),(9, 'São Francisco Saúde', 'Operadora de Saúde', 50, '(79) 93060-3103'),(10, 'Prevent Senior', 'Operadora de Saúde', 85, '(95) 98787-3705'),(11, 'Cassi', 'Autogestão', 90, '(44) 99645-7932'),(12, 'Ipasgo', 'Autogestão', 78, '(38) 99835-4295'),(13, 'SUS - Particular', 'Público', 0, '(50) 97537-7118'),(14, 'Care Plus', 'Operadora Premium', 95, '(67) 99479-8397'),(15, 'Central Nacional Unimed', 'Cooperativa Médica', 82, '(26) 95061-4681');

INSERT INTO medicos (id, nome, crm, especialidade_id, hospital_id, telefone, email, salario, data_contratacao, sexo) VALUES(1, 'Dr. Sérgio Santos', 'CRM-PR 87128', 8, 1, '(20) 91964-4750', 'sérgio.rodrigues1@sistemahospitalar.com.br', 32446.34, '2024-04-13', 'M'),(2, 'Dra. Camila Gonçalves', 'CRM-PR 46500', 16, 7, '(80) 93167-8744', 'camila.lopes2@sistemahospitalar.com.br', 29184.72, '2023-02-11', 'F'),(3, 'Dra. Elaine Alves', 'CRM-RJ 96374', 14, 12, '(65) 97735-8651', 'elaine.souza3@sistemahospitalar.com.br', 26180.84, '2019-06-30', 'F'),(4, 'Dr. Gabriel Nunes', 'CRM-BA 24322', 8, 7, '(35) 99786-8350', 'gabriel.lima4@sistemahospitalar.com.br', 19390.8, '2011-04-01', 'M'),(5, 'Dra. Helena Rodrigues', 'CRM-CE 82132', 4, 2, '(94) 99856-1241', 'helena.ferreira5@sistemahospitalar.com.br', 33011.91, '2024-01-14', 'F'),(6, 'Dr. Felipe Marques', 'CRM-CE 73092', 7, 13, '(18) 93697-7209', 'felipe.silva6@sistemahospitalar.com.br', 34603.34, '2010-12-13', 'M'),(7, 'Dra. Karina Machado', 'CRM-CE 30289', 7, 10, '(38) 91958-9883', 'karina.souza7@sistemahospitalar.com.br', 28195.34, '2006-04-14', 'F'),(8, 'Dr. Marcelo Cardoso', 'CRM-MG 17455', 17, 3, '(34) 92122-2113', 'marcelo.lopes8@sistemahospitalar.com.br', 18901.94, '2024-12-20', 'M'),(9, 'Dr. Marcelo Moura', 'CRM-SP 91183', 3, 14, '(95) 99565-6183', 'marcelo.soares9@sistemahospitalar.com.br', 13515.0, '2021-01-24', 'M'),(10, 'Dra. Helena Soares', 'CRM-PE 27154', 10, 15, '(51) 92188-1152', 'helena.freitas10@sistemahospitalar.com.br', 24771.3, '2017-08-18', 'F'),(11, 'Dr. Mateus Teixeira', 'CRM-PR 76307', 9, 5, '(55) 92127-5002', 'mateus.andrade11@sistemahospitalar.com.br', 15694.66, '2014-10-30', 'M'),(12, 'Dra. Joana Correia', 'CRM-SP 97538', 18, 10, '(95) 92697-3200', 'joana.soares12@sistemahospitalar.com.br', 11116.57, '2007-05-27', 'F'),(13, 'Dr. Nelson Vieira', 'CRM-PR 54942', 7, 22, '(92) 95325-9280', 'nelson.ramos13@sistemahospitalar.com.br', 14780.27, '2023-12-24', 'M'),(14, 'Dr. Rafael Machado', 'CRM-RS 15778', 1, 11, '(27) 95291-3647', 'rafael.mendes14@sistemahospitalar.com.br', 22895.37, '2014-08-05', 'M'),(15, 'Dr. Carlos Rodrigues', 'CRM-MG 81511', 2, 12, '(85) 93426-8041', 'carlos.lima15@sistemahospitalar.com.br', 9129.38, '2013-03-07', 'M'),(16, 'Dr. Tiago Carvalho', 'CRM-PR 97416', 4, 12, '(82) 97658-3532', 'tiago.lopes16@sistemahospitalar.com.br', 31344.35, '2022-12-10', 'M'),(17, 'Dr. André Santos', 'CRM-MG 53540', 14, 22, '(42) 95371-3608', 'andré.alves17@sistemahospitalar.com.br', 18328.63, '2005-11-14', 'M'),(18, 'Dra. Gabriela Martins', 'CRM-CE 55830', 10, 8, '(39) 91387-4164', 'gabriela.nunes18@sistemahospitalar.com.br', 16863.07, '2024-05-21', 'F'),(19, 'Dr. Breno Fernandes', 'CRM-BA 94080', 17, 13, '(97) 99785-6425', 'breno.santos19@sistemahospitalar.com.br', 11114.23, '2010-11-10', 'M'),(20, 'Dr. Marcelo Soares', 'CRM-SP 24208', 20, 14, '(55) 96139-8149', 'marcelo.moura20@sistemahospitalar.com.br', 34574.37, '2007-08-06', 'M'),(21, 'Dra. Giovanna Martins', 'CRM-RS 15817', 14, 1, '(77) 99821-4228', 'giovanna.andrade21@sistemahospitalar.com.br', 19645.03, '2019-11-25', 'F'),(22, 'Dra. Joana Rocha', 'CRM-RJ 49363', 17, 10, '(96) 97691-6344', 'joana.nunes22@sistemahospitalar.com.br', 26824.63, '2017-06-08', 'F'),(23, 'Dr. Henrique Marques', 'CRM-PE 98777', 6, 20, '(83) 95930-7653', 'henrique.pinto23@sistemahospitalar.com.br', 30510.58, '2011-10-26', 'M'),(24, 'Dra. Fabiana Machado', 'CRM-BA 70946', 15, 15, '(97) 94501-9375', 'fabiana.cardoso24@sistemahospitalar.com.br', 29430.86, '2022-11-09', 'F'),(25, 'Dr. Samuel Ferreira', 'CRM-RS 77561', 20, 11, '(22) 94848-6085', 'samuel.almeida25@sistemahospitalar.com.br', 29777.2, '2008-04-22', 'M'),(26, 'Dr. Lucas Lopes', 'CRM-CE 90120', 3, 15, '(64) 94185-7291', 'lucas.ramos26@sistemahospitalar.com.br', 18790.63, '2008-04-23', 'M'),(27, 'Dr. Adriano Alves', 'CRM-PE 38683', 6, 17, '(70) 91822-5082', 'adriano.pereira27@sistemahospitalar.com.br', 20324.47, '2022-12-23', 'M'),(28, 'Dra. Michele Correia', 'CRM-BA 68008', 20, 17, '(65) 99976-8305', 'michele.costa28@sistemahospitalar.com.br', 28078.7, '2015-08-25', 'F'),(29, 'Dra. Isabela Lopes', 'CRM-RS 78327', 16, 21, '(41) 95499-8206', 'isabela.rodrigues29@sistemahospitalar.com.br', 27265.71, '2010-04-05', 'F'),(30, 'Dra. Natália Rocha', 'CRM-RJ 28136', 5, 8, '(60) 93503-4505', 'natália.rodrigues30@sistemahospitalar.com.br', 19201.43, '2012-06-03', 'F'),(31, 'Dra. Sandra Souza', 'CRM-PR 65069', 13, 19, '(13) 97232-8814', 'sandra.silva31@sistemahospitalar.com.br', 33454.02, '2011-09-13', 'F'),(32, 'Dra. Sandra Teixeira', 'CRM-PR 73993', 8, 9, '(66) 98956-1475', 'sandra.moreira32@sistemahospitalar.com.br', 17075.5, '2020-03-26', 'F'),(33, 'Dra. Raquel Costa', 'CRM-CE 26728', 20, 18, '(14) 97455-1444', 'raquel.ferreira33@sistemahospitalar.com.br', 25354.24, '2008-01-17', 'F'),(34, 'Dra. Débora Souza', 'CRM-RS 59689', 11, 7, '(69) 96355-6529', 'débora.moreira34@sistemahospitalar.com.br', 15512.93, '2023-08-30', 'F'),(35, 'Dra. Isabela Ferreira', 'CRM-CE 12540', 18, 2, '(55) 94673-2124', 'isabela.oliveira35@sistemahospitalar.com.br', 28364.3, '2010-07-19', 'F'),(36, 'Dr. Pedro Araújo', 'CRM-MG 41266', 5, 16, '(96) 92874-4571', 'pedro.freitas36@sistemahospitalar.com.br', 26885.55, '2022-03-15', 'M'),(37, 'Dra. Carolina Moura', 'CRM-RJ 31465', 10, 4, '(85) 91420-6111', 'carolina.cavalcanti37@sistemahospitalar.com.br', 26288.38, '2013-06-02', 'F'),(38, 'Dra. Priscila Martins', 'CRM-RJ 87607', 8, 4, '(49) 92983-1672', 'priscila.nascimento38@sistemahospitalar.com.br', 22384.12, '2019-11-03', 'F'),(39, 'Dra. Camila Gonçalves', 'CRM-BA 11658', 14, 16, '(24) 98102-6934', 'camila.freitas39@sistemahospitalar.com.br', 27097.33, '2014-10-08', 'F'),(40, 'Dr. Wagner Correia', 'CRM-RS 90728', 18, 16, '(70) 98136-5397', 'wagner.rocha40@sistemahospitalar.com.br', 30996.26, '2023-08-20', 'M'),(41, 'Dr. Nelson Mendes', 'CRM-PR 70910', 19, 20, '(96) 97209-6511', 'nelson.santos41@sistemahospitalar.com.br', 21346.28, '2012-04-16', 'M'),(42, 'Dr. Geraldo Carvalho', 'CRM-BA 43862', 11, 9, '(87) 95526-1166', 'geraldo.correia42@sistemahospitalar.com.br', 33597.69, '2006-12-03', 'M'),(43, 'Dr. Wagner Marques', 'CRM-CE 82768', 8, 16, '(93) 99041-8342', 'wagner.santos43@sistemahospitalar.com.br', 10512.44, '2009-12-21', 'M'),(44, 'Dra. Olívia Lopes', 'CRM-RS 97026', 19, 12, '(71) 99698-6632', 'olívia.machado44@sistemahospitalar.com.br', 34909.05, '2017-05-06', 'F'),(45, 'Dra. Otávia Freitas', 'CRM-RS 50189', 9, 8, '(26) 94155-6169', 'otávia.pereira45@sistemahospitalar.com.br', 28057.79, '2022-02-04', 'F'),(46, 'Dr. Henrique Carvalho', 'CRM-CE 46241', 19, 17, '(87) 95636-2647', 'henrique.martins46@sistemahospitalar.com.br', 15998.65, '2013-02-04', 'M'),(47, 'Dr. Paulo Silva', 'CRM-MG 45954', 2, 2, '(81) 95786-3068', 'paulo.ramos47@sistemahospitalar.com.br', 10769.87, '2005-04-11', 'M'),(48, 'Dra. Amanda Cardoso', 'CRM-CE 54657', 6, 2, '(43) 98827-2869', 'amanda.rodrigues48@sistemahospitalar.com.br', 18819.1, '2006-08-30', 'F'),(49, 'Dr. Eduardo Gomes', 'CRM-RS 21164', 8, 4, '(82) 97818-4697', 'eduardo.correia49@sistemahospitalar.com.br', 18270.21, '2014-12-06', 'M'),(50, 'Dra. Heloísa Machado', 'CRM-RS 84531', 20, 2, '(89) 92625-4404', 'heloísa.carvalho50@sistemahospitalar.com.br', 15145.45, '2006-10-28', 'F'),(51, 'Dr. Leonardo Ribeiro', 'CRM-RJ 30517', 1, 14, '(68) 98699-5771', 'leonardo.oliveira51@sistemahospitalar.com.br', 14249.86, '2020-11-09', 'M'),(52, 'Dra. Olívia Freitas', 'CRM-RJ 40595', 9, 21, '(86) 94241-7965', 'olívia.pereira52@sistemahospitalar.com.br', 22703.18, '2019-07-12', 'F'),(53, 'Dr. Nelson Gomes', 'CRM-RJ 17816', 6, 10, '(87) 95728-8195', 'nelson.pereira53@sistemahospitalar.com.br', 20654.85, '2011-10-28', 'M'),(54, 'Dra. Jaqueline Gonçalves', 'CRM-CE 67377', 3, 20, '(16) 98078-6280', 'jaqueline.moura54@sistemahospitalar.com.br', 14759.93, '2007-01-19', 'F'),(55, 'Dr. Thiago Cavalcanti', 'CRM-SP 98117', 9, 19, '(16) 93870-8708', 'thiago.correia55@sistemahospitalar.com.br', 25590.76, '2011-03-29', 'M'),(56, 'Dr. Marcelo Machado', 'CRM-CE 21959', 16, 12, '(63) 96460-6260', 'marcelo.alves56@sistemahospitalar.com.br', 31158.79, '2012-05-25', 'M'),(57, 'Dra. Olívia Ramos', 'CRM-RS 96846', 13, 18, '(15) 98451-2442', 'olívia.rocha57@sistemahospitalar.com.br', 14814.77, '2007-08-08', 'F'),(58, 'Dra. Cristina Silva', 'CRM-CE 64165', 2, 7, '(77) 96927-9167', 'cristina.mendes58@sistemahospitalar.com.br', 28519.74, '2009-07-26', 'F'),(59, 'Dra. Flávia Lima', 'CRM-RS 67424', 16, 4, '(14) 94920-3594', 'flávia.barbosa59@sistemahospitalar.com.br', 22872.65, '2017-05-22', 'F'),(60, 'Dra. Beatriz Almeida', 'CRM-RJ 70482', 4, 21, '(30) 99165-5781', 'beatriz.gonçalves60@sistemahospitalar.com.br', 27046.11, '2014-04-27', 'F');

