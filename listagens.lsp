(DEFUN EXISTE (item lista)
	(if (eql nil (car lista))
		nil
		(if (eql item (car lista))
			t
			(existe item (cdr lista))
		)
	)
)
;=================================================================================================================
(DEFUN LISTAR (lista)
;Argumentos: lista
;descricao: Listar todos elementos da lista dada
;retorna: todos elementos da lista
	(if (eql (car lista) nil)
		NIL
		(if (existe (car lista) (cdr lista))
			(listar (cdr lista))
			(cont (car lista) (lista (cdr lista)))
	)
)
;=================================================================================================================
(DEFUN encontraDic (lista diciplina)
	(if (eql nil lista)
		nil
		(if (eql (caar lista) diciplina)
	 		lista
			(encontraDic (cdr lista) diciplina)
		)
	)
)
;=================================================================================================================
(DEFUN achaAluno (aluno lista)
	(if (eql lista nil)
		nil
		(if (EXISTE (aluno (cadar lista)))
			(cons (caar lista) (achaAluno aluno (cdr lista)))
			(achaAluno aluno (cdr lista))
		)
	)
)
;=================================================================================================================
(DEFUN achaprofessor (professor lista)
	(if (eql lista nil)
		nil
		(if (EXISTE (professor (cddar lista)))
			(cons (caar lista) (achaprofessor professor (cdr lista)))
			(achaprofessor professor (cdr lista))
		)
	)
)
(DEFUN listaDic (controle)
	(if (eql (car controle) nil)
		nil
		(cons (caar controle) (listaDic (cdr controle)))
	)
)
;=================================================================================================================
;=================================================================================================================
(DEFUN ALUNOS? (BD)
; Argumentos: .
; Retorna:         Lista contendo o nome de todos os alunos cadastrados.
; Observação:  Um aluno é cadastrado quando é matriculado em alguma disciplina. Alunos não vinculados a nenhuma disciplina devem ser removidos da base.
	(listar (cadr BD))
)
;=================================================================================================================
(DEFUN PROFESSORES? (BD)
; Argumentos: .
; Retorna:         Lista contendo o nome de todos os professores cadastrados.
; Observação:  Um professor é cadastrado quando é vinculado a alguma disciplina. Professores não vinculados a nenhuma disciplina devem ser removidos da base.
	(listar (caddr BD))
)
;=================================================================================================================
(DEFUN DISCIPLINAS? (BD)
; Argumentos: .
; Retorna:         Lista contendo o nome de todas as disciplinas cadastradas.
; Observação:  Uma disciplina é cadastrada quando é associada a algum aluno ou professor. Disciplinas não vinculados a nenhum professor ou aluno devem ser removidas da base.
	(listaDic (car BD))
)
;=================================================================================================================
(DEFUN MATRICULADOS? (DISCIPLINA BD)
; Argumentos: .
; Retorna:         Lista contendo o nome de todos os alunos matriculados na disciplina DISIPLINA.
	(listar (cadar (encontraDic (car bd) diciplina)))
) 
;=================================================================================================================
(DEFUN VINCULADOS? (DISCIPLINA BD)
; ; Argumentos: .
; ; Retorna:         Lista contendo o nome de todos os professores vinculados à disciplina DISCIPLINA.
	(listar (cddar (encontraDic (car bd) diciplina)))
)
;=================================================================================================================
(DEFUN CURSA? (ALUNO BD)
; ; Argumentos: .
; ; Retorna:         Lista contendo o nome de todas as disciplinas cursadas pelo aluno ALUNO.
	(achaAluno aluno (car bd))
)
;=================================================================================================================
(DEFUN MINISTRA? (PROFESSOR BD)
; ; Argumentos: .
; ; Retorna:         Lista contendo o nome de todas as disciplinas ministradas pelo professor PROFESSOR.
	(achaprofessor professor (car bd))
)
