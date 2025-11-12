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
('Josef K', NULL, 4, '2025-11-02'),
('Jorge de Burgos', 1, 2, '2022-09-05'),
('Clausemira Creuzodete', 1, 3, '2023-12-11'),
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
select car_nome, car_salario_base from tb_cargos;

-- 4
select fun_nome, fun_data_admissao from tb_funcionarios
where fun_data_admissao < '2024-01-01';

-- 5 
select car_nome,fun_nome from tb_funcionarios
join tb_cargos on fun_car_id = car_id
order by car_nome;

-- 6 
select fun_nome, car_nome from tb_funcionarios
join tb_cargos on fun_car_id = car_id
where car_nome in ('gerente', 'diretor');

-- 7
SELECT dep_nome FROM tb_departamentos
WHERE dep_gerente_id IS NULL;

-- 8
SELECT dep_nome, COUNT(tb_funcionarios.fun_id)
FROM tb_departamentos LEFT JOIN tb_funcionarios ON tb_departamentos.dep_id = tb_funcionarios.fun_dep_id
GROUP BY tb_departamentos.dep_id, tb_departamentos.dep_nome
ORDER BY tb_departamentos.dep_nome;

-- 9
SELECT dep_nome, SUM(tb_cargos.car_salario_base)
FROM tb_departamentos LEFT JOIN tb_funcionarios ON tb_departamentos.dep_id = tb_funcionarios.fun_dep_id
LEFT JOIN tb_cargos ON tb_funcionarios.fun_car_id = tb_cargos.car_id
GROUP BY tb_departamentos.dep_id, tb_departamentos.dep_nome
ORDER BY tb_departamentos.dep_nome;

-- 11

SELECT tb_cargos.car_nome, count(tb_funcionarios.fun_id) as 'total' from tb_cargos join tb_funcionarios on tb_cargos.car_id = tb_funcionarios.fun_car_id having 'total' > 5;
-- 12.

SELECT tb_funcionarios.fun_nome as 'funcionario', tb_departamentos_origem.dep_nome as 'departamento de origem', tb_departamentos_destino.dep_nome as 'departamento de destino', tb_transferencias.tra_data as 'data' from tb_transferencias join tb_funcionarios on tb_transferencias.tra_fun_id = tb_funcionarios.fun_id join tb_departamentos as tb_departamentos_origem on tb_transferencias.tra_dep_origem = tb_departamentos_origem.dep_id join tb_departamentos as tb_departamentos_destino on tb_transferencias.tra_dep_destino = tb_departamentos_destino.dep_id;

-- 13.

SELECT tb_cargos.car_nome as 'nome do cargo', tb_departamentos.dep_nome as 'nome do departamento'from tb_cargos join tb_funcionarios on tb_cargos.car_id = tb_funcionarios.fun_car_id join tb_departamentos on tb_funcionarios.fun_dep_id = tb_departamentos.dep_id;