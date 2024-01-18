main :-
    Plansza = [1, 2, 0],
    czy_wygrywa(Plansza, Odp),
    write(Odp), nl.

czy_wygrywa(Plansza, false) :-
    length(Plansza, Len),
    Len < 4,
    write(Plansza), nl.
