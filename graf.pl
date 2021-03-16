%opis grafu
gallery(1,2). 
gallery(1,4). 
gallery(2,3). 
gallery(2,4). 
gallery(3,5). 
gallery(4,5). 
gallery(4,6). 
gallery(5,7). 
gallery(5,8). 
gallery(6,7). 
gallery(6,9). 
gallery(7,8).
gallery(8,10). 
gallery(9,11). 
gallery(10,13). 
gallery(11,12). 
gallery(11,14). 
gallery(12,13). 
gallery(13,15). 
gallery(14,15). 

% graf nieskierowany 
neighborroom(X, Y) :- gallery(X, Y).   
neighborroom(X, Y) :- gallery(Y, X). 

%lista węzłów zakazanych 
avoid([1,12]). 
go(Here,There) :- route(Here, There,[Here]). 

pisz([]).
pisz([G|Og]) :-
    pisz(Og),
    write(G), nl.

%rekurencyjne poszukiwanie drogi 
route(Room,Room,VisitedRooms) :- 
    member(5,VisitedRooms), pisz(VisitedRooms), nl. 
route(Room,Way_out,VisitedRooms) :- 
    neighborroom(Room,NextRoom), 
    avoid(DangerousRooms), 
    \+ member(NextRoom,DangerousRooms),  
    \+ member(NextRoom,VisitedRooms),  
    route(NextRoom,Way_out,[NextRoom|VisitedRooms]). 

%sprawdzenie, czy element występuje w liście 
member(X,[X|_]).   
member(X,[_|H]) :- member(X,H).