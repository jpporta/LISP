(load("listagens.lsp"))
;=================================================================================================================
;Modelo de Lista
;=================================================================================================================
; BD
; [ | ]->[  |  ]------------------------> [  |  ] ------------------------------>[   |nil]
;  |			 |															  |																			 |
;  |			 v                                v																			 v
;  |		   [Alunos Cadastrados| ...]        [Professores Cadastrados| ...]         [Materias Cadastrados| ...]
;  v
; [Controle]->[Controle]->[Controle]-> ... ->[Controle]->[Controle | nil]  (um controle para cada materia)
;  |
;  v
;	[DICIPLINA |      ]
;								|
;								V
;				  		[        	|					]
;						  		|						|
;				 					|						v
;				 					|						[lista professores | ]->...->[professor|nil]
;				 					v
;				 					[lista alunos | ]->...->[aluno|nil]

;=================================================================================================================
;(DEFUN MATRICULAR (ALUNOS DISCIPLINAS BD)
; Argumentos:  ALUNOS: Lista contendo nomes de alunos; 
; DISCIPLINA: Lista com nomes de disciplinas; 
; BD: Lista contendo a base de dados.
; Retorna:         Nova lista contendo a BD atualizada
; Descrição:      Matricula cada um dos alunos na lista ALUNOS em todas as disciplinas da lista DISCIPLINAS.

;)
 ;=================================================================================================================
;(DEFUN CANCELAR-MATRíCULA (ALUNOS DISCIPLINAS BD)
; Argumentos:  ...
; Retorna:         Nova lista contendo a BD atualizada
; Descrição:      Cancelar a matrícula cada um dos alunos na lista ALUNOS de todas as disciplinas da lista DISCIPLINAS.

;)
;=================================================================================================================
;(DEFUN VINCULAR (PROFESSORES DISCIPLINAS BD)
; Argumentos:   ...
; Descrição:      Vincular cada um dos professores na lista PROFESSORES  a cada uma das disciplinas na lista DISCIPLINAS;
; Retorna:         Nova lista contendo a BD atualizada
; Observações: Um professor vinculado a um disciplina está apto a ministrá-la.

;)
;=================================================================================================================
;(DEFUN REMOVER-VINCULO (PROFESSORES DISCIPLINAS BD)
; Argumentos:   ...
; Descrição:      Remover o vínculo de cada um dos professores na lista PROFESSORES  a cada uma das disciplinas na lista DISCIPLINAS;
; Retorna:         Nova lista contendo a BD atualizada

;)
