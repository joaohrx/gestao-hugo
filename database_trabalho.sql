create database gestao_departamentos_2v;
use gestao_departamentos_2v;
drop table gestao_departamentos_2v;

create table tb_departamentos(
dep_id int auto_increment primary key,
dep_nome varchar(100) not null,
dep_gerente_id int
);

create table tb_cargos(
car_id int auto_increment primary key,
car_nome varchar(100) not null,
car_salario_base decimal not null
);

create table tb_funcionarios(
fun_id int auto_increment primary key,
fun_nome varchar(100) not null,
fun_car_id int not null,
fun_dep_id int not null,
fun_data_admissao date not null,
foreign key (fun_car_id) references tb_cargos(car_id),
foreign key (fun_dep_id) references tb_departamentos(dep_id)
);

insert into tb_departamentos(dep_nome, dep_gerente_id) values
('Finanças', '1'),
('Comercial','2'),
('Logística',  NULL),
('Comercial', NULL),
('Administrativo', '3')
;

insert into tb_cargos (car_nome, car_salario_base) values
('Assistente', 2500),
('Gerente', 6500),
('Consultor', 4500),
('Analista', 5000),
('Diretor', 12000)
;

insert into tb_funcionarios (fun_nome, fun_car_id, fun_dep_id, fun_data_admissao) values
('Joaildo Campos', 2, 1, '2021-11-10'),
('Vinícius Maia', 2, 2, '2024-05-06'),
('Maria Camila', 1, 3, '2025-06-30'),
('Kafka da Silva', 3, 4, '2023-03-15'),
('Rodolfo Pires', 4, 3, '2024-06-20'),
('Luciano Lamarte', 5, 2, '2021-07-15')
;
