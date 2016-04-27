repete(0, _, []).
   repete(N, C, L) :- 
      N > 0,
      L = [C|T],
      N1 is N - 1,
   repete(N1, C, T).

% ?- repete(1,a,L). => L = [a].
% ?- repete(2,b,L). => L = [b,b].
% ?- repete(-2,b,L). => false.
% ?- repete(2,a,[a,b,c]). => false.
% ?- repete(3,a,[a|T]). => T = [a,a].

% 1.
zeroInit([H|_]) :- H =:= 0.

% 2.
has5(L) :- L = ([_,_,_,_,_]).

% 3.
hasN(L, N) :- length(L, X), N == X.

% 4.
potN0(0, []).
   potN0(N, L) :-
      N >= 0,
      L = [X|XS],
      X is 2^N,
      N1 is N - 1,
   potN0(N1,XS).

% 5.
zipmult([], [], []).
   zipmult(L1, L2, L3) :-
      L1 = [X|XS],
      L2 = [Y|YS],
      L3 = [Z|ZS],
      Z is X * Y,
   zipmult(XS, YS, ZS).

% 8.
mesmaPosicao(A, [A|_], [A|_]).
   mesmaPosicao(A, L1, L2) :-
      L1 = [X|XS],
      L2 = [_|YS],
      A \= X, 
   mesmaPosicao(A, XS, YS).