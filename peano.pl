%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Peano arithmetic formalism
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

is_number(0).
is_number(s(X)) :- is_number(X).

add(0, N, N) :- is_number(N).
add(s(N), M, s(Y)) :- add(N, M, Y).

mul(0, N, 0) :- is_number(N).
mul(s(N), M, Y) :-
  mul(N, M, YY),
  add(M, YY, Y).

%%%%%%%%%%%%%%%%%%%%%%
% Your code goes here:
%%%%%%%%%%%%%%%%%%%%%%

div(X, Y, Z, R) :- 
  is_number(X),
  is_number(Y),
  Y \= 0,
  div_helper(X, Y, 0, Z, R).

div_helper(X, Y, Acc, Z, R) :-
  less_than(X, Y),
  Z = Acc,
  R = X.

div_helper(X, Y, Acc, Z, R) :-
  \+ less_than(X, Y),
  subtract(X, Y, X1),
  add(s(0), Acc, Acc1),
  div_helper(X1, Y, Acc1, Z, R).

% Helper predicates
less_than(0, s(_)).
less_than(s(X), s(Y)) :- less_than(X, Y).

subtract(X, 0, X) :- is_number(X).
subtract(s(X), s(Y), Z) :- subtract(X, Y, Z).

% Example execution:
% swipl peano.pl
% ?- div(s(s(s(0))), s(s(0)), Z, R).
% Z = s(0),
% R = s(0).
% ?- div(s(s(s(s(0)))), s(s(0)), Z, R).
% Z = s(s(0)),
% R = 0.
