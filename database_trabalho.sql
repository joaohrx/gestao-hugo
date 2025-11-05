create database gestao_departamentos_2v;
use gestao_departamentos_2v;

create table tb_departamentos(
dep_id int auto_increment primary key,
dep_nome varchar(100) not null,
dep_gerente_id int not null
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

insert into tb_departamentos(dep_nome, dep_gerente_id)values
('Finanças', '1'),
('Comercial','3'),
('Logística', '8'),
('Compras', '9'),
('Administrativo','11')
;