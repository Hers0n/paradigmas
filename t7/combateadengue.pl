/*
	COMBATE A DENGUE

		Uma força-tarefa para combater a dengue precisa visi-tar sete casas em busca de focos do mosquito.  
		As casa são denominadas F, G, H, L, M, P e T. 
		Deve ser feito um  plano  de  ação  determinando  a  ordem  em  que  as casas são visitadas.  
		Para isso considera-se as seguintes condições:

		1. A casa F deve ser uma das três primeiras a serem visitadas.
		2. A casa H deve ser visitada imediatamente antes da casa G.
		3. A casa L não pode ser a primeira nem a sétima casa a ser visitada.
		4. A casa M deve ser a primeira ou a sétima a ser visitada.
		5. A casa P deve ser uma das três ultimas a serem visitadas.
*/

% CONDIÇÕES

% 1.
regra1(E) :- E = [f,_,_,_,_,_,_].
regra1(E) :- E = [_,f,_,_,_,_,_].
regra1(E) :- E = [_,_,f,_,_,_,_].

% 2.
regra2(E) :- E = [h,g,_,_,_,_,_].
regra2(E) :- E = [_,h,g,_,_,_,_].
regra2(E) :- E = [_,_,h,g,_,_,_].
regra2(E) :- E = [_,_,_,h,g,_,_].
regra2(E) :- E = [_,_,_,_,h,g,_].
regra2(E) :- E = [_,_,_,_,_,h,g].

% 3.
regra3(E) :- E = [_,l,_,_,_,_,_].
regra3(E) :- E = [_,_,l,_,_,_,_].
regra3(E) :- E = [_,_,_,l,_,_,_].
regra3(E) :- E = [_,_,_,_,l,_,_].
regra3(E) :- E = [_,_,_,_,_,l,_].

% 4.
regra4(E) :- E = [m,_,_,_,_,_,_].
regra4(E) :- E = [_,_,_,_,_,_,m].

% 5.
regra5(E) :- E = [_,_,_,_,_,_,p].
regra5(E) :- E = [_,_,_,_,_,p,_].
regra5(E) :- E = [_,_,_,_,p,_,_].



% permutacoes
perm(List, [H|Perm]) :- delete(H, List, Rest), perm(Rest, Perm).
perm([],[]).
   
delete(X, [X|T], T).
delete(X, [H|T], [H|NT]) :- delete(X, T, NT).


% regras combinadas
visitar(E) :- E = [_,_,_,_,_,_,_],
		Casas = [f, g, h, l, m, p, t],
			perm(Casas, E),
				regra1(E),
				regra2(E),
				regra3(E),
				regra4(E),
				regra5(E).

/*
# Questão 1. #
Qual  das  seguintes  opções é  uma  lista completa e correta da ordem que as sete casas devem ser visitadas?

visitar([f,t,h,l,p,g,m]). -> false.
visitar([h,g,f,l,t,p,m]). -> true.
visitar([l,t,f,h,g,m,p]). -> false.
visitar([m,f,d,h,l,g,t]). -> false.
visitar([m,l,h,g,f,p,t]). -> false.

	Resposta: (B) H, G, F, L, T, P e M.


# Questão 2. #
Se em um trecho do percurso visitarmos as  casas  T,  L  e  F,  exatamente  nesta  ordem,  qual  a posição que G foi visitada.

visitar([t,l,f,g,_,_,_]). -> false.
visitar([t,l,f,_,g,_,_]). -> true.
visitar([t,l,f,_,_,g,_]). -> false.
visitar([t,l,f,_,_,_,g]). -> false.
visitar([g,t,l,f,_,_,_]). -> false.
visitar([_,t,l,f,g,_,_]). -> false.
visitar([_,t,l,f,_,g,_]). -> false.
visitar([_,t,l,f,_,_,g]). -> false.
visitar([g,_,t,l,f,_,_]). -> false.
visitar([_,g,t,l,f,_,_]). -> false.
visitar([_,_,t,l,f,g,_]). -> false.
visitar([_,_,t,l,f,_,g]). -> false.
visitar([g,_,_,t,l,f,_]). -> false.
visitar([_,g,_,t,l,f,_]). -> false.
visitar([_,_,g,t,l,f,_]). -> false.
visitar([_,_,g,t,l,f,_]). -> false.
visitar([g,_,_,_,t,l,f]). -> false.
visitar([_,g,_,_,t,l,f]). -> false.
visitar([_,_,g,_,t,l,f]). -> false.
visitar([_,_,_,g,t,l,f]). -> false.
visitar([_,_,_,g,t,l,f]). -> false.

	Resposta: (D) Quinta.


# Questão 3. #
Se a casa H é a primeira a ser visitada, qual a quarta casa a ser visitada?

visitar([h,_,_,X,_,_,_]). -> X = l .

	Resposta: (C) L.


# Questão 4. #
Se a casa P foi visitada em sexto, a casa H poderia ser visitada em várias posições exceto:

visitar([h,_,_,_,_,p,_]). -> true.
visitar([_,h,_,_,_,p,_]). -> true.
visitar([_,_,h,_,_,p,_]). -> true.
visitar([_,_,_,h,_,p,_]). -> true.
visitar([_,_,_,_,h,p,_]). -> false.

	Resposta: (E) Quinta.


# Questão 5. #
Se exatamente uma casa foi visitada entre F e P, quais possíveis casas são estas?

visitar([f,X,p,_,_,_,_]). -> false.
visitar([_,f,X,p,_,_,_]). -> X = l ; X = t .
visitar([_,_,f,X,p,_,_]). -> false.
visitar([_,_,_,f,X,p,_]). -> false.
visitar([_,_,_,_,f,X,p]). -> false.

	Resposta: (E) L e T.


*/
