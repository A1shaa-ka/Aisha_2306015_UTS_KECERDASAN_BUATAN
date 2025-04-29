hama('Kutu Daun') :-
    gejala(daun_menguning).

hama('Jamur Daun') :-
    gejala(bercak_hitam).

hama('Hama Ulat') :-
    gejala(daun_berlubang).

hama('Nematoda') :-
    gejala(tanaman_layu).

hama('Tanaman Sehat') :-
    \+ gejala(daun_menguning),
    \+ gejala(bercak_hitam),
    \+ gejala(daun_berlubang),
    \+ gejala(tanaman_layu).

% Program untuk bertanya kepada pengguna
tanya(Gejala) :-
    write('Apakah '), write(Gejala), write('? (ya/tidak): '),
    read(Jawaban),
    ( (Jawaban == ya) -> assert(gejala(Gejala));
      (Jawaban == tidak) -> assert(gejala(tidak(Gejala)))
    ).

% Menjalankan program diagnosa
mulai :-
    retractall(gejala(_)),
    retractall(gejala(tidak(_))),
    tanya(daun_menguning),
    tanya(bercak_hitam),
    tanya(daun_berlubang),
    tanya(tanaman_layu),
    ( hama(Hama) ->
        nl, write('>> Diagnosa: '), write(Hama), nl;
        nl, write('>> Maaf jenis hama tidak dapat dikenali.'), nl
    ).
