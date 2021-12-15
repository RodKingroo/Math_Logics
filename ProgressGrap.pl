:- use_module(library(pce)).

:- include('db.pl').
:-dynamic books/4.


db_run :-


new(MyWin, dialog('БД Библиотеки')),
send_list(MyWin, append, [
                     new(Author,text_item('Автор')),
                     new(Name,text_item('Название')),
                     new(MyListAuthor, list_browser),
                     new(MyListName, list_browser),

                      button('Весь ассортимент', message(@prolog,
                                     output, MyListAuthor)),
                     button('Найти по автору', message(@prolog,
                                     output_author, MyListAuthor, Author?selection )),
                     button('Найти по книге', message(@prolog,
                                     output_name, MyListName, Name?selection )),
                     button('Добавить', message(@prolog,
                                                add_to, MyWin,
                                                Author?selection,
                                                Name?selection )),
                     button(выход, message(MyWin, destroy))
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
