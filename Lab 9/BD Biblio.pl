:-dynamic
        book/4.
/* Запуск программы */
run:-
     retractall(book/4),
     consult('db.txt'),
     menu.

/* Формирование меню */
menu:-
      repeat,
      write('*********************'),nl,
      write('* Список литературы *'),nl,
      write('*********************'),nl,
      write('1 – Просмотр записей в БД'),nl,
      write('2 – Добавить в БД'),nl,
      write('3 - Удалить из БД'),nl,
      write('4 - Сохранить базу в файл'),nl,
      write('5 - Поиск по автору'),nl,
      write('6 - Поиск по названию'),nl,
      write('7 – Выход'),nl,nl,
      write('Выберите пункт меню: (1-6) '),
      read(X),
      X<8,
      process(X),
      X=7,!.

process(1):-viewing_book.
process(2):-to_add,!.
process(3):-to_remove,!.
process(4):-db_save,!.
process(5):-to_find_name,!.
process(6):-to_find_author,!.
process(7):-retractall(book/4),!.

viewing_book:-
                book(Num,Name,Author,Time_comertion),
                write('№ книги: '), write(Num),nl,
                write('Название: '), write(Name),nl,
                write('Автор: '), write(Author),nl,
                write('Год издания: '), write(Time_comertion),nl,
                write('-------------------------------'),nl.

to_add:-
        write('*******************'),nl,
        write('* Добавить книгу*'),nl,
        write('*******************'),nl,
        repeat,
        write('Номер книги: '),
        read(Num),
        write('Название: '),
        read(Name),
        write('Автор: '),
        read(Author),
        write('Год издания: '),
        read(Time_comertion),
        assertz(book(Num,Name,Author,Time_comertion)),
        quest,!.

quest:-
       write('Продолжить ввод? y/n '),
       read(A),
       answer(A).

answer(_):-fail.
answer(y):-fail.
answer(n).

db_save:-
        tell('db.txt'),
        listing(book/4),
        told,
        write('Файл базы данных db.txt сохранен!'),nl,nl.

to_remove:-
           write('******************'),nl,
           write('* Удаление записи *'),nl,
           write('******************'),nl,
           write('Введите № Книги: '),
           read(Num),
           retract(book(Num,_,_,_)),
           write('Запись удалена!!!'),nl,nl.

to_find_name:-
         write('-------------------------------------------------------'),nl,
         write('Введите Название книги: '),
         read(NameSearch),
         search_name(NameSearch,Search_to_Name),
         write('Книга найдена: '),
         write(Search_to_Name),nl,
         write('-------------------------------------------------------'),nl,
         fail.

to_find_author:-
         write('-------------------------------------------------------'),nl,
         write('Введите Автора книги: '),
         read(NameSearch),
         search_author(NameSearch,Search_to_Author),
         write('Книга найдена: '),
         write(Search_to_Author),nl,
         write('-------------------------------------------------------'),nl,
         fail.


search_name(NameSearch,Search_to_Name):-
                         setof(book(Num,Name,Author,Time_comertion),
                         (book(Num, Name, Author, Time_comertion),NameSearch = Name),
                         [Search_to_Name|_]).

search_author(NameSearch,Search_to_Author):-
                         setof(book(Num,Name,Author,Time_comertion),
                         (book(Num, Name, Author, Time_comertion),NameSearch = Author),
                         [Search_to_Author|_]).
