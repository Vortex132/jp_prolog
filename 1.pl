% Predykat do generowania permutacji listy
permutacja([], []).
permutacja(Lista, [Element|Permutacja]) :-
    select(Element, Lista, Reszta),
    permutacja(Reszta, Permutacja).

% Predykat do sprawdzania, czy lista jest posortowana malejąco
posortowana_malejaco([]).
posortowana_malejaco([_]).
posortowana_malejaco([X, Y|Reszta]) :-
    X >= Y,
    posortowana_malejaco([Y|Reszta]).

% Predykat sortujący przez generowanie permutacji
sortuj(Lista, Posortowana) :-
    permutacja(Lista, Posortowana),
    posortowana_malejaco(Posortowana).

:- initialization(main).
main :-
    Lista = [5, 1, 3, 4, 9, 2, 6],
    write(Lista), nl,

    sortuj(Lista, Posortowana),
    
    write(Posortowana), nl.
