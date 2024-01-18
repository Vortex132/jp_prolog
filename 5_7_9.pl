czy_wygrywa(Plansza, false) :-
    length(Plansza, Len),
    Len < 4,
    write(Plansza), nl.
    