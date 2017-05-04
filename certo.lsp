;define tamanho da lista
(defun list-lenght (lista)
	(if (null lista)
		0
		(1+ (list-lenght (cdr lista)))
	)
)
(defun achata (lista)
  (cond ((null lista) nil)
        ((atom lista) (list lista))
        (t (mapcan #'flatten lista))))
;===========================================================   LISTAGENS   ==============================
(DEFUN EXISTE (item lista)
	(if (null lista)
		nil
		(if (equal item (car lista))
			t
			(existe item (cdr lista))
		)
	)
)
;________________________________________________________________________________________________________
(DEFUN LISTAR (lista)
;Argumentos: lista
;descricao: Listar todos elementos da lista dada
;retorna: todos elementos da lista
	(if (equal (car lista) nil)
		NIL
		(if (existe (car lista) (cdr lista))
			(listar (cdr lista))
			(cons (car lista) (listar (cdr lista)))
		)
	)
)
;________________________________________________________________________________________________________
(DEFUN encontraDic (lista diciplina)
	(if (equal nil lista)
		nil
		(if (equal (caar lista) diciplina)
	 		lista
			(encontraDic (cdr lista) diciplina)
		)
	)
)
;________________________________________________________________________________________________________
(DEFUN achaAluno (alunos lista)
	(if (equal lista nil)
		nil
		(if (EXISTE (alunos (cadar lista)))
			(cons (caar lista) (achaAluno alunos (cdr lista)))
			(achaAluno alunos (cdr lista))
		)
	)
)
;________________________________________________________________________________________________________
;________________________________________________________________________________________________________
(DEFUN listaDic (controle)
	(if (equal (car controle) nil)
		nil
		(cons (caar controle) (listaDic (cdr controle)))
	)
)
;________________________________________________________________________________________________________
(DEFUN todosAlunos (bd)
	(if (null bd)
		nil
		(cons (cadar bd) (todosAlunos (cdr bd)))
	)
)
(DEFUN ALUNOS? (BD)
; Argumentos: .
; Retorna:         Lista contendo o nome de todos os alunos cadastrados.
; Observação:  Um aluno é cadastrado quando é matriculado em alguma disciplina. Alunos não vinculados a nenhuma disciplina devem ser removidos da base.
	(listar (achata (todosAlunos BD)))
)

;________________________________________________________________________________________________________
(DEFUN PROFESSORES? (BD)
; Argumentos: .
; Retorna:         Lista contendo o nome de todos os professores cadastrados.
; Observação:  Um professor é cadastrado quando é vinculado a alguma disciplina. Professores não vinculados a nenhuma disciplina devem ser removidos da base.
	(listar (achata (todosProfessores BD)))
)
(DEFUN todosProfessores (bd)
	(if (null bd)
		nil
		(cons (cddar bd) (todosProfessores (cdr bd)))
	)
)
;________________________________________________________________________________________________________
(DEFUN DISCIPLINAS? (controle)
	(if (null controle)
		nil
		(cons (caar controle) (listaDic (cdr controle)))
	)
)
;________________________________________________________________________________________________________
(DEFUN MATRICULADOS? (DISCIPLINA BD)
; Argumentos: .
; Retorna:         Lista contendo o nome de todos os alunos matriculados na disciplina DISIPLINA.
	(listar (cadar (encontraDic bd DISCIPLINA)))
)
;________________________________________________________________________________________________________
(DEFUN VINCULADOS? (DISCIPLINA BD)
; ; Argumentos: .
; ; Retorna:         Lista contendo o nome de todos os professores vinculados à disciplina DISCIPLINA.
	(listar (cddar (encontraDic bd DISCIPLINA)))
)
;________________________________________________________________________________________________________
(DEFUN CURSA? (aluno BD)
; ; Argumentos: .
; ; Retorna:         Lista contendo o nome de todas as disciplinas cursadas pelo aluno ALUNO.
	(if (null bd)
		nil
		(if (EXISTE aluno (cadar bd))
			(cons (caar bd) (cursa? aluno (cdr bd)))
			(cursa? aluno (cdr bd))
		)
	)
)
;________________________________________________________________________________________________________
(DEFUN MINISTRA? (PROFESSOR BD)
; ; Argumentos: .
; ; Retorna:         Lista contendo o nome de todas as disciplinas ministradas pelo professor PROFESSOR.
	(if (null bd)
		nil
		(if (EXISTE professor (cddar bd))
			(cons (caar bd) (ministra? professor (cdr bd)))
			(ministra? professor (cdr bd))
		)
	)
)


;==========================================================================="MAIN"==========================

;FUNCAO QUE VERIFICA SE EXISTE A DISCIPLINA EXISTE E RETORNA A POSICAO
(defun pertence (disciplina bd)
	(if (null bd)
		nil
		(if (equal (caar bd) disciplina)
			0
			(if (null (pertence disciplina (cdr bd)))
				nil
				(+ 1 (pertence disciplina (cdr bd)))
			)
		)
	)
)
;devolve a lista com os novos elementos nao respetidos
(defun novaLista (lista elementos)
	(if (null elementos)
		lista
		(if (OR (eql nil (car elementos)) (EXISTE (car elementos) lista))
			(novaLista lista (cdr elementos))
			(novaLista (cons (car elementos) lista) (cdr elementos))
		)
	)
)
;FUNCAO CRIA DISCIPLINA E RETORNA O BD ATUALIZADO
(defun criaDisciplina (disciplina bd)
	(if (null bd)
		(cons (cons disciplina nil) nil)
		(cons (car bd) (criaDisciplina disciplina (cdr bd)))
	)
)
;_______________________________________________________________________________________________________________
;FUNCAO QUE INSERE ALUNOS A DISCIPLINA
(defun insereEm (dist alunos bd)
	(if (equal dist 0)
		(cons (cons (caar bd) (cons (novaLista alunos (cadar bd)) (cddar bd))) (cdr bd))
		(cons (car bd) (insereEm (1- dist) alunos (cdr bd)))
	)
)
;FUNCAO AUXILIAR PARA INSERCAO
(defun matriculando (alunos disciplinas bd)
	(if (null disciplinas)
		bd
		(if (pertence (car disciplinas) bd)
			(matriculando alunos (cdr disciplinas) (insereEm (pertence (car disciplinas) bd) alunos bd));insere em uma disciplina que ja existe
			(matriculando alunos (cdr disciplinas) (insereEm (list-lenght bd) alunos (criaDisciplina (car disciplinas) bd)));cria disciplina e insere alunos nela
		)
	)
)

;FUNÇÃO QUE MATRICULA ALUNOS EM DISCILINAS
(defun matricular (alunos disciplinas bd)
	(if (null bd)
		(if (null disciplinas)
			NIL
			(cons(cons (car disciplinas) (cons alunos NIL))
			(matricular alunos (cdr disciplinas) bd))
		)
		(if (null disciplinas)
			bd
			(matriculando alunos disciplinas bd)
		)
	)
)
;_______________________________________________________________________________________________________________
(defun cancelar-matricula (alunos disciplinas bd)
	(if (null (car alunos))
		nil
		(if (null (car disciplinas))
			nil
			(if (equal (car disciplinas) (caar bd))
				(if (null (set-difference (cadar bd) alunos))
					(cancelar-matricula alunos disciplinas (cdr bd))

					(cons (cons (car disciplinas)
					(cons (set-difference (cadar bd) alunos :test 'equal)
					(caddr bd)))(cancelar-matricula (cdr alunos)
					(cdr disciplinas) (cdr bd)))
				)
				(cons (car bd) (cancelar-matricula (cdr alunos) (cdr disciplinas) (cdr bd)));else
			)
		)
	)
)

;=====================================================  PROFESSORES  ===========================================
(defun insereProfEm (dist professores bd)
	(if (equal dist 0)
		(cons (cons (caar bd) (cons (cadar bd) (novaLista (cddar bd) professores))) (cdr bd))
		(cons (car bd) (insereProfEm (1- dist) professores (cdr bd)))
	)
)
;FUNCAO AUXILIAR PARA vincular
(defun vinculando (professores disciplinas bd)
	(if (null disciplinas)
		bd
		(if (pertence (car disciplinas) bd)
			(vinculando professores (cdr disciplinas) (insereProfEm (pertence (car disciplinas) bd) professores bd));insere em uma disciplina que ja existe
			(vinculando professores (cdr disciplinas) (insereProfEm (list-lenght bd) professores (criaDisciplina (car disciplinas) bd)));cria disciplina e insere professores nela
		)
	)
)
;FUNÇÃO QUE VINCULA PROFESSOR EM DISCILINAS
(defun vincular (professores disciplinas bd)
	(if (null bd)
		(if (null disciplinas)
			NIL
			(cons(cons (car disciplinas) professores)
			(vincular professores (cdr disciplinas) bd))
		)
		(if (null disciplinas)
			bd
			(vinculando professores disciplinas bd)
		)
	)
)
