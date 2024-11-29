-- 1
DELIMITER $$
create procedure ExibirAlunosPorTurma (in codigoTurma varchar(15))
begin
 select 
 aluno.nro_matricula as NumeroMatricula,
 aluno.nome_aluno as NomeAluno
 from  
 aluno
 where 
 aluno.codigo_turma = codigoTurma;
end $$
DELIMITER ;

call ExibirAlunosPorTurma('TURMA001');

-- 2
alter table aluno add column status_aluno varchar(20);
DELIMITER $$

create procedure AtualizarStatusAluno(
    in nro_matricula_param int,
    in novo_status varchar(20)
)
begin
    update aluno
    set status_aluno = novo_status
   where nro_matricula = nro_matricula_param;
end$$

DELIMITER ;

-- 3

DELIMITER $$

create procedure ExibirProfessoresPorDisciplina(in codigo_disciplina_param varchar(15))
begin
    select professor.nro_registro_professor, professor.nome
    from professor
    where professor.codigo_disciplina = codigo_disciplina_param;
end$$

DELIMITER ;

-- 4

DELIMITER $$

create procedure InserirNovaTurma(
    in nro_alunos_param int,
    in sigla_curso_param varchar(10),
    in nro_registro_professor_param varchar(15),
    in periodo_param varchar(20),
    in semestre_param int
)
begin
    declare novo_codigo_turma varchar(15);

   set novo_codigo_turma = CONCAT('TURMA_', UUID());

   insert into turma (codigo_turma, nro_alunos, sigla_curso, nro_registro_professor, periodo)
    values (novo_codigo_turma, nro_alunos_param, sigla_curso_param, nro_registro_professor_param, periodo_param);
    
    select CONCAT('Nova turma criada com código: ', novo_codigo_turma) as Mensagem;
end$$

DELIMITER ;

-- 5

DELIMITER $$

create procure AtualizarEspecialidadeProfessor(
    in nro_registro_professor_param varchar(15),
    in nova_especialidade varchar(50)
)
begin
    update professor
    set especialidade = nova_especialidade
    where nro_registro_professor = nro_registro_professor_param;
end$$

DELIMITER ;