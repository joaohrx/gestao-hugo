create database gestao_departamentos_2v;
use gestao_departamentos_2v;

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
fun_car_id int,
fun_dep_id int not null,
fun_data_admissao date not null,
foreign key (fun_car_id) references tb_cargos(car_id),
foreign key (fun_dep_id) references tb_departamentos(dep_id)
);

create table tb_transferencias (
tra_id int auto_increment primary key,
tra_fun_id int not null,
tra_dep_origem int,
tra_dep_destino int not null,
tra_data date not null,
foreign key (tra_fun_id) references tb_funcionarios(fun_id),
foreign key (tra_dep_origem) references tb_departamentos(dep_id),
foreign key (tra_dep_destino) references tb_departamentos(dep_id)
);

insert into tb_departamentos(dep_nome, dep_gerente_id) values
('Finanças', '1'),
('Comercial','2'),
('Logística',  NULL),
('Marketing', NULL),
('Administrativo', '3')
;

insert into tb_cargos (car_nome, car_salario_base) values
('Assistente', 2500),
('Gerente', 6500),
('Consultor', 5000),
('Analista', 4500),
('Diretor', 12000)
;

insert into tb_funcionarios (fun_nome, fun_car_id, fun_dep_id, fun_data_admissao) values
('Joaildo Campos', 2, 1, '2021-11-10'),
('Vinícius Maia', 2, 2, '2024-05-06'),
('Maria Camila', 1, 3, '2025-06-30'),
('Kafka da Silva', 3, 4, '2023-03-15'),
('Rodolfo Pires', 4, 3, '2024-06-20'),
('Luciano Lamarte', 2, 5, '2021-07-15'),
('Fernando Ferraz', 5, 5, '2021-03-16'),
('Mônica Maurício', 1, 4, '2024-06-10'),
('Josef K', NULL, 4, '2025-11-02')
('Jorge de Burgos', 1, 2, '2022-09-05'),
('Clausemira Creus', 1, 3, '2023-12-11'),
('Renato Moscou', 1, 5, '2024-02-28');
;

insert into tb_transferencias (tra_fun_id, tra_dep_origem, tra_dep_destino, tra_data) values
(1, 2, 1, '2024-01-10'),
(4, 3, 4, '2024-07-01'),
(5, 1, 3, '2025-02-12');

-- 1
select fun_nome, dep_nome from tb_funcionarios
join tb_cargos on fun_car_id = car_id
join tb_departamentos on fun_dep_id = dep_id;

-- 2
select fun_nome, dep_nome from tb_funcionarios
join tb_cargos on fun_car_id = car_id
join tb_departamentos on fun_dep_id = dep_id
where car_id = 2;

-- 3
select car_nome, car_salario_base from tb_cargos

