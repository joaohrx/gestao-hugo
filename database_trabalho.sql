create database gestao_departamentos_2v;
use gestao_departamentos_2v;
##- tb_departamentos (dep_id, dep_nome, dep_gerente_id)
## tb_cargos (car_id, car_nome, car_salario_base)
## tb_funcionarios (fun_id, fun_nome, fun_cargo_id, fun_dep_id, fun_data_admissao)

create table tb_departamentos (
dep_id INT AUTO_INCREMENT PRIMARY KEY,
dep_nome varchar(50)NOT NULL,	
dep_gerente_id INT NOT NULL
);	