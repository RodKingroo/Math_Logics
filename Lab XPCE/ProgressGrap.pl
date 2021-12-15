:- use_module(library(pce)).

:- include('db.pl').
:-dynamic books/4.


db_run :-


new(MyWin, dialog('ÁÄ Áèáëèîòåêè')),
send_list(MyWin, append, [
                     new(Author,text_item('Àâòîð')),
                     new(Name,text_item('Íàçâàíèå')),
                     new(MyListAuthor, list_browser),
                     new(MyListName, list_browser),

                      button('Âåñü àññîðòèìåíò', message(@prolog,
                                     output, MyListAuthor)),
                     button('Íàéòè ïî àâòîðó', message(@prolog,
                                     output_author, MyListAuthor, Author?selection )),
                     button('Íàéòè ïî êíèãå', message(@prolog,
                                     output_name, MyListName, Name?selection )),
                     button('Äîáàâèòü', message(@prolog,
                                                add_to, MyWin,
                                                Author?selection,
                                                Name?selection )),
                     button(âûõîä, message(MyWin, destroy))
]),
send(MyListAuthor, alignment,left),
send(MyListName, alignment, left),
send(MyWin, open(point(400,400))).

output(A,B):-
      books(A,B),
      send(A,B),
      fail.
output_author(FrmList,X) :-
      send(FrmList, clear),
      books(X,W),
      send(FrmList, append,W),
      fail.
output_name(FrmList,X) :-
      send(FrmList, clear),
      books(W,X),
      send(FrmList, append, W),
      fail.
add_to(MyWin, X, W):-
      books(X, W),
      read(X), read(W),
      assertz(books(X,W)),
      fail.
