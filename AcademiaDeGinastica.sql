--Criação da tabela atividades para a Database AcademiaDeGinastica

CREATE TABLE atividades (
  id_atividade SERIAL PRIMARY KEY,
  nome_atividade VARCHAR(50) NOT NULL,
  nome_instrutor VARCHAR(50) NOT NULL
);

--Criação da tabela Alunos para a Database AcademiaDeGinastica
CREATE TABLE alunos (
  id_alunos SERIAL PRIMARY KEY,
  nome_alunos VARCHAR(50) NOT NULL,
  atividades_id INT,
  CONSTRAINT fk_atividades_id
    FOREIGN KEY (atividades_id)
    REFERENCES atividades (id_atividade)
);

--Criado insert para a tabela atividade

INSERT INTO atividades (nome_atividade, nome_instrutor) VALUES
('Musculacao', 'João Silva'),
('Yoga', 'Maria Souza'),
('Funcional', 'Carlos Oliveira');

   
INSERT INTO alunos (nome_alunos, atividades_id)
VALUES ('Paulo',1),
       ('Carol', null),
       ('Ruanito', 2),
       ('Gabriela', 1),
       ('Raimundo', null),
	   ('Mila', 2),
	   ('Marli', 1);	   
	   

-- Criando consulta utilizando o inner join para trazer dados em comum

select nome_alunos, nome_atividade from alunos
inner join atividades
on atividades.id_atividade = alunos.atividades_id;
 
-- Utilizando o left join para trazer todos os resultados da tabela a esquerda
-- que são os alunos que não estão cadastrados nas atividades

select nome_alunos, nome_atividade
from 
alunos
left join atividades
on atividades.id_atividade = alunos.atividades_id

-- Utilizando right join para mostrar todos os dados da tabela a direita
-- A matéria POO não tem alunos cadastrados

select nome_alunos, nome_atividade 
from 
alunos
right join atividades
on atividades.id_atividade = alunos.atividades_id

-- Comando union que juntas os dados da left e right join

select nome_alunos, nome_atividade 
from 
alunos
left join atividades
on atividades.id_atividade = alunos.atividades_id
union
select nome_alunos, nome_atividade 
from 
alunos
right join atividades
on atividades.id_atividade = alunos.atividades_id;
