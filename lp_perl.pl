%%% Fatos %%%

% Origens da linguagem de programação Perl segundo Sebesta.
baseadaEm(perl, awk).
baseadaEm(awk, c).
baseadaEm(c, algol68).
baseadaEm(algol68, algol60).
baseadaEm(algol60, algol58).
baseadaEm(algol58, fortran1).
baseadaEm(c, b).
baseadaEm(b, bcpl).
baseadaEm(bcpl, cpl).
baseadaEm(awk, snobol).
baseadaEm(perl, sed).
baseadaEm(sed, ed).

% Paradigmas das linguagens de programação acima segundo a Wikipedia.
paradigma(perl, multiparadigma).
paradigma(perl, funcional).
paradigma(perl, imperativa).
paradigma(perl, oo).
paradigma(perl, reflexiva).
paradigma(c, imperativa).
paradigma(c, procedural).
paradigma(algol68, multiparadigma).
paradigma(algol68, imperativa).
paradigma(algol68, concorrente).
paradigma(algol60, imperativa).
paradigma(algol60, procedural).
paradigma(algol60, estruturada).
paradigma(algol58, procedural).
paradigma(algol58, imperativa).
paradigma(algol58, estruturada).
paradigma(fortran1, multiparadigma).
paradigma(fortran1, estruturada).
paradigma(fortran1, procedural).
paradigma(fortran1, imperativa).
paradigma(fortran1, oo).
paradigma(fortran1, generica).
paradigma(bcpl, procedural).
paradigma(bcpl, estruturada).
paradigma(cpl, procedural).
paradigma(cpl, imperativa).
paradigma(cpl, estruturada).
paradigma(cpl, funcional).
paradigma(awk, procedural).
paradigma(awk, scripting).
paradigma(awk, oe).
paradigma(snobol, multiparadigma).
paradigma(sed, scripting).

% Versões de Perl.
versao(perl, 1, 1987).
versao(perl, 2, 1988).
versao(perl, 3, 1989).
versao(perl, 4, 1991).
versao(perl, 5, 1994).
versao(perl, 5.00, 1994).
versao(perl, 5.06, 2000).
versao(perl, 5.0600000000000005, 2000). %fui obrigado a fazer isso devido a incerteza em operações aritméticas com floats em Prolog => 5.08 - 0.02 == 5.0600000000000005 e != 5.06...
versao(perl, 5.08, 2002).
versao(perl, 5.10, 2007).
versao(perl, 5.1000000000000005, 2007). %o mesmo acontece com outros números...
versao(perl, 5.12, 2010).
versao(perl, 5.14, 2011).
versao(perl, 5.140000000000001, 2011).
versao(perl, 5.16, 2012).
versao(perl, 5.18, 2013).
versao(perl, 5.180000000000001, 2013).
versao(perl, 5.20, 2014).
versao(perl, 5.2, 2014).
versao(perl, 5.22, 2015).
versao(perl, 5.220000000000001, 2015).
versao(perl, 5.24, 2016).
versao(perl, 5.26, 2017).
versao(perl, 5.260000000000001, 2017).
versao(perl, 5.28, 2018).
versao(perl, 5.30, 2019).
versao(perl, 5.300000000000001, 2019).
versao(perl, 5.32, 2020).
versaoMaisRecente(perl, 5.32).
%versao(perl, 6, 2015).

%%% Regras %%%

% Descendência transitiva na genealogia das linguagens.
descendente(X, Y) :- baseadaEm(X, Y).
descendente(X, Y) :- baseadaEm(X, A), descendente(A, Y).

% Hiato entre versões.
versaoAnterior(V1, V2) :- antesVerCinco(V2)  -> V1 is V2 - 1.
versaoAnterior(V1, V2) :- entreCincoSeis(V2) -> V1 is V2 - 0.02.
versaoAnterior(V1, V2) :- verCincoSeis(V2)   -> V1 is V2 - 0.06.

hiato(LP, Versao, Hiato) :- 
    versaoAnterior(VersaoAnterior, Versao),
    versao(LP, VersaoAnterior, AnoAnterior),
    versao(LP, Versao, Ano),
    Hiato is Ano - AnoAnterior.

antesVerCinco(V2)  :- V2 =< 5.
verCincoSeis(V2)   :- V2 == 5.06.
entreCincoSeis(V2) :- V2 > 5.06, V2 =< 5.32.