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

% :- initialization(main).
zad1 :-
    Lista = [5, 1, 3, 4, 9, 2, 6],
    write(Lista), nl,

    sortuj(Lista, Posortowana),
    
    write(Posortowana), nl.

% zadanie 2.
czy_graficzny([], true).
czy_graficzny(Lista, false) :- member(N, Lista), N < 0.
czy_graficzny(Lista, true) :- \+ (member(N, Lista), N > 0).
czy_graficzny(Lista, Odp) :-
    %write(Lista), nl,
    sortuj(Lista, [N|Posortowana]),
    %write([N|Posortowana]), nl,
    length(Posortowana, Len),
    N =< Len,
    odejmij1(N, Posortowana, NowaLista),
    czy_graficzny(NowaLista, Odp).


odejmij1(0, Lista, Lista).
odejmij1(N, [H|Lista], RetLista) :-
    %write(Lista), nl,
    H1 is H - 1,
    RetLista = [H1|NowaLista], 
    N1 is N - 1,
    odejmij1(N1, Lista, NowaLista).

zad2 :- 
    Lista = [2, 3, 2, 3, 2, 2],
    czy_graficzny(Lista, Odp),
    write(Odp), nl.

% zadanie 3.
czy_spojny([], true).
czy_spojny([0], true).
czy_spojny(List, false) :-
    length(List, Len),
    Len = 1.

czy_spojny(List, false) :-
    czy_graficzny(List, false).

czy_spojny(List, false) :-
    member(0, List).

czy_spojny(List, true) :-
    sum_list(List, Sum),
    length(List, Len),
    Cond is 2 * (Len - 1),
    Sum >= Cond.
czy_spojny(_, false).

sum_list([], 0).
sum_list([H|T], Sum) :-
    sum_list(T, Sum1),
    Sum is Sum1 + H.


zad3 :-
    Lista = [1, 0, 1],
    write(Lista), nl,
    czy_spojny(Lista, Odp),
    write(Odp), nl,
    
    Lista2 = [1, 1, 1],
    write(Lista2), nl,
    czy_spojny(Lista2, Odp2),
    write(Odp2), nl,
    
    Lista3 = [1, 1, 1, 1],
    write(Lista3), nl,
    czy_spojny(Lista3, Odp3),
    write(Odp3), nl,
    
    Lista4 = [1,2,2,1,2],
    write(Lista4), nl,
    czy_spojny(Lista4, Odp4),
    write(Odp4), nl,
    
    Lista5 = [3, 3, 3, 0, 3],
    write(Lista5), nl,
    czy_spojny(Lista5, Odp5),
    write(Odp5), nl.