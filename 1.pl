% Predykat do generowania permutacji listy
permutacja([], []).
permutacja(Lista, [Element|Permutacja]) :-
    select(Element, Lista, Reszta),
    permutacja(Reszta, Permutacja).

% Predykat do sprawdzania, czy lista jest posortowana nie rosnąco
posortowana_nierosnaco([]).
posortowana_nierosnaco([_]).
posortowana_nierosnaco([X, Y|Reszta]) :-
    X >= Y,
    posortowana_nierosnaco([Y|Reszta]).

% Predykat sortujący przez generowanie permutacji
sortuj(Lista, Posortowana) :-
    permutacja(Lista, Posortowana),
    posortowana_nierosnaco(Posortowana).

:- initialization(main).
main :-
    Lista = [5, 1, 3, 4, 9, 2, 6],
    write(Lista), nl,
    
    % Wywołanie predykatu sortującego
    sortuj(Lista, Posortowana),
    
    write(Posortowana), nl.
