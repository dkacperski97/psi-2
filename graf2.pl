%opis grafu
gallery(1,2,1). 
gallery(1,4,2). 
gallery(2,3,3). 
gallery(2,4,4). 
gallery(3,5,5). 
gallery(4,5,6). 
gallery(4,6,7). 
gallery(5,7,8). 
gallery(5,8,9). 
gallery(6,7,10). 
gallery(6,9,11). 
gallery(7,8,12).
gallery(8,10,13). 
gallery(9,11,14). 
gallery(10,13,15). 
gallery(11,12,16). 
gallery(11,14,17). 
gallery(12,13,18). 
gallery(13,15,19). 
gallery(14,15,20). 

% graf nieskierowany 
neighborroom(X, Y, Z) :- gallery(X, Y, Z).   
neighborroom(X, Y, Z) :- gallery(Y, X, Z). 

%lista węzłów zakazanych 
avoid([1,12]). 
go(Here,There) :- route(Here, There,[Here],0). 

pisz([]).
pisz([G|Og]) :-
    pisz(Og),
    write(G), nl.

%rekurencyjne poszukiwanie drogi 
route(Room,Room,VisitedRooms,DistanceTraveledBefore) :- 
    member(5,VisitedRooms), pisz(VisitedRooms), nl, write(DistanceTraveledBefore), nl. 
route(Room,Way_out,VisitedRooms,DistanceTraveledBefore) :- 
    neighborroom(Room,NextRoom,Distance), 
    avoid(DangerousRooms), 
    \+ member(NextRoom,DangerousRooms),  
    \+ member(NextRoom,VisitedRooms),  
    DistanceTraveled is DistanceTraveledBefore + Distance,
    route(NextRoom,Way_out,[NextRoom|VisitedRooms],DistanceTraveled). 

%sprawdzenie, czy element występuje w liście 
member(X,[X|_]).   
member(X,[_|H]) :- member(X,H).