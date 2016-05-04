/*
	FÉRIAS

     Problema: Féiras - Olimpíada Brasileira de Informática – OBI2008 – Modalidade Iniciação Nível 1 – Fase 2
     (http://olimpiada.ic.unicamp.br/passadas/OBI2008/res_fase2_inic/iniciacao_n1/pdf/provas/ProvaOBI2008_inic_f2n1.pdf)

		Seis amigos, A, B, C, D, E e F, querem aproveitar suas férias escolares jogando video-game. 
		Eles vão se reunir cada dia na casa de um deles, durante seis dias seguidos da semana. 
		Eles não podem se reunir mais de uma vez na casa da mesma pessoa, e as seguintes
		condições são também aplicadas:

		1. A reunião na casa de A deve ser imediatamente antes ou imediatamente depois da reunião na casa de E.
		2. Existe exatamente um dia entre os dias das reuniões nas casas de A e B, 
		independentemente se a reunião na casa de A ocorre antes ou depois da reunião da casa de B.
		3. Se a reunião na casa de D ocorre antes da reunião na casa de C, então a sexta reunião é na casa de F.
		4. A quarta reunião é na casa de C.
*/

% CONDIÇÕES

% 1.
regra1(E) :- E = [_,_,_,_,a,e].
regra1(E) :- E = [_,_,_,a,e,_].
regra1(E) :- E = [_,_,a,e,_,_].
regra1(E) :- E = [_,a,e,_,_,_].
regra1(E) :- E = [a,e,_,_,_,_].
regra1(E) :- E = [e,a,_,_,_,_].
regra1(E) :- E = [_,e,a,_,_,_].
regra1(E) :- E = [_,_,e,a,_,_].
regra1(E) :- E = [_,_,_,e,a,_].
regra1(E) :- E = [_,_,_,_,e,a].


% 2.

regra2(E) :- E = [_,_,_,a,_,b].
regra2(E) :- E = [_,_,a,_,b,_].
regra2(E) :- E = [_,a,_,b,_,_].
regra2(E) :- E = [a,_,b,_,_,_].
regra2(E) :- E = [b,_,a,_,_,_].
regra2(E) :- E = [_,b,_,a,_,_].
regra2(E) :- E = [_,_,b,_,a,_].
regra2(E) :- E = [_,_,_,b,_,a].


% 3.
regra3(E) :- E = [d,_,_,_,c,f].
regra3(E) :- E = [_,d,_,_,c,f].
regra3(E) :- E = [_,_,d,_,c,f].
regra3(E) :- E = [_,_,_,d,c,f].
regra3(E) :- E = [d,_,_,c,_,f].
regra3(E) :- E = [_,d,_,c,_,f].
regra3(E) :- E = [_,_,d,c,_,f].
regra3(E) :- E = [d,_,c,_,_,f].
regra3(E) :- E = [_,d,c,_,_,f].
regra3(E) :- E = [d,c,_,_,_,f].


% 4.
regra4(E) :- E = [_,_,_,c,_,_].

% 5. (Na regra 3 caso o D não venha antes do C, é executada uma operação de "ou")
regra5(E) :- E = [c,_,_,_,_,d].
regra5(E) :- E = [_,c,_,_,_,d].
regra5(E) :- E = [_,_,c,_,_,d].
regra5(E) :- E = [_,_,_,c,_,d].
regra5(E) :- E = [_,_,_,_,c,d].
regra5(E) :- E = [c,_,_,_,d,_].
regra5(E) :- E = [_,c,_,_,d,_].
regra5(E) :- E = [_,_,c,_,d,_].
regra5(E) :- E = [_,_,_,c,d,_].
regra5(E) :- E = [c,_,_,d,_,_].
regra5(E) :- E = [_,c,_,d,_,_].
regra5(E) :- E = [_,_,c,d,_,_].
regra5(E) :- E = [c,_,d,_,_,_].
regra5(E) :- E = [_,c,d,_,_,_].
regra5(E) :- E = [c,d,_,_,_,_].


% permutacoes
perm(List, [H|Perm]) :- delete(H, List, Rest), perm(Rest, Perm).
perm([],[]).
   
delete(X, [X|T], T).
delete(X, [H|T], [H|NT]) :- delete(X, T, NT).


% regras combinadas

reuniao(E) :- E = [_,_,_,_,_,_],
		Amigos = [a,b,c,d,e,f],
			perm(Amigos, E),
				regra1(E),
				regra2(E),
				(regra3(E);regra5(E)),
				regra4(E).

/*
# Questão 1. #
Qual das seguintes opções é uma lista completa e correta da ordem das reuniões da primeira a sexta?

reuniao([a,f,b,c,d,e]). -> false.
reuniao([b,e,a,c,f,d]). -> true.
reuniao([d,b,c,a,e,f]). -> false.
reuniao([e,a,d,c,b,f]). -> false.
reuniao([f,d,b,c,a,e]). -> false.

	Resposta: (B) B, E, A, C, F, D.


# Questão 2. #
Se a reunião na casa de B é a terceira, entãao a reunião na casa de F pode ser em qualquer uma das ordens 
de qual das opções abaixo?

reuniao([f,_,b,_,_,_]). -> false.
reuniao([_,f,b,_,_,_]). -> false.
reuniao([_,_,b,f,_,_]). -> false.
reuniao([_,_,b,_,f,_]). -> true.
reuniao([_,_,b,_,_,f]). -> true.

	Resposta: (E) A quinta ou a sexta.


# Questão 3. #
Se a reunião na casa de B é imediatamente antes ou imediatamente depois da reunião na casa de F, 
então qual das seguintes opções deve ser a ordem da reunião na casa de D?

reuniao([d,_,_,_,f,b]). -> false.
reuniao([_,d,_,_,f,b]). -> false.
reuniao([_,_,d,_,f,b]). -> false.
reuniao([_,_,_,d,f,b]). -> false.
reuniao([d,_,_,f,b,_]). -> false.
reuniao([_,d,_,f,b,_]). -> false.
reuniao([_,_,d,f,b,_]). -> false.
reuniao([_,_,_,f,b,d]). -> false.
reuniao([d,_,f,b,_,_]). -> false.
reuniao([_,d,f,b,_,_]). -> false.
reuniao([_,_,f,b,d,_]). -> false.
reuniao([_,_,f,b,_,d]). -> false.
reuniao([d,f,b,_,_,_]). -> false.
reuniao([_,f,b,d,_,_]). -> false.
reuniao([_,f,b,_,d,_]). -> false.
reuniao([_,f,b,_,_,d]). -> false.
reuniao([f,b,d,_,_,_]). -> false.
reuniao([f,b,_,d,_,_]). -> false.
reuniao([f,b,_,_,d,_]). -> false.
reuniao([f,b,_,_,_,d]). -> false.
reuniao([b,f,d,_,_,_]). -> false.
reuniao([b,f,_,d,_,_]). -> false.
reuniao([b,f,_,_,d,_]). -> false.
reuniao([b,f,_,_,_,d]). -> false.
reuniao([d,b,f,_,_,_]). -> false.
reuniao([_,b,f,d,_,_]). -> false.
reuniao([_,b,f,_,d,_]). -> false.
reuniao([_,b,f,_,_,d]). -> false.
reuniao([d,_,b,f,_,_]). -> false.
reuniao([_,d,b,f,_,_]). -> false.
reuniao([_,_,b,f,d,_]). -> false.
reuniao([_,_,b,f,_,d]). -> false.
reuniao([d,_,_,b,f,_]). -> false.
reuniao([_,d,_,b,f,_]). -> false.
reuniao([_,_,d,b,f,_]). -> false.
reuniao([_,_,_,b,f,d]). -> false.
reuniao([d,_,_,_,b,f]). -> true.
reuniao([_,d,_,_,b,f]). -> false.
reuniao([_,_,d,_,b,f]). -> false.
reuniao([_,_,_,d,b,f]). -> false.

	Resposta: (A) A primeira.


# Questão 4. #
A segunda reunião pode ser na casa de:

reuniao([_,X,_,_,_,_]). -> X = e.

	Resposta (D) E.


# Questão 5. #
Qual das opções abaixo é uma lista correta e completa de possíveis casas nas quais pode ocorrer
a terceira reunião?

reuniao([_,_,X,_,_,_]). -> X = b; X = a.

	Resposta: (A) Na casa de A ou B.

	
*/
