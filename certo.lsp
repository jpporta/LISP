;FUNÇÃO QUE MATRICULA ALUNOS EM DISCILINAS
(defun matricular (alunos disciplinas bd)
	(if (null bd)
		(if (null disciplinas)
			NIL
			(cons(cons (car disciplinas) (cons (cons (car alunos) (cdr alunos)) NIL)) (matricular alunos (cdr disciplinas) bd)) 
		)
		(matriculando alunos disciplinas bd)	
	)
)	
(defun matriculando (alunos diciplinas bd)
	(if (null diciplinas)
		nil
		(matricular_existe alunos (car diciplinas) bd)
	)

;SE O BD JÁ ESXISTE
(defun matricular_existe (alunos disciplinas bd)
	(if (equal (car disciplinas) (caar bd))
		(matricular_existe2  alunos disciplinas bd)
		(cons bd (cons (car disciplinas) 
		(cons(cons (car alunos) (cdr alunos)) NIL)))
	)
)

;SE DISCIPLINA JÁ EXISTE
(defun matricular_existe2 (alunos disciplinas bd)
	(cons (car bd) ())
)


;FUNÇÃO QUE VERIFICA SE A DISCIPLINA JÁ EXISTE NO BD
(defun verifica_disciplinas (disciplinas bd)
	
		1
		NIL
	)
)




(SETQ BD1 (MATRICULAR '("João Paulo" "Ana Maria") '("APC" "Cálculo I")  BD1 ))