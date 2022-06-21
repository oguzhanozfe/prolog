% using https://xmonader.github.io/prolog/2018/12/21/solving-murder-prolog.html and tutorial on sucourse

man(gencer). man(can). man(rasim).
woman(beyza). woman(canan). woman(meryem).
person(X):- man(X).
person(X):- woman(X).
bags(blue). bags(orange). bags(red). bags(purple). bags(green). bags(yellow).
food(avocado). food(onion). food(nuts). food(chocolate). food(garlic). food(cookies).
uniq_ppl(A,B,C,D,E,F):- person(A), person(B), person(C), person(D), person(E), person(F),  \+A=B, \+A=C, \+A=D, \+A=E, \+A=F, \+B=C, \+B=D, \+B=E, \+B=F, \+C=D, \+C=E, \+C=F, \+D=E, \+D=F, \+E=F.

guilty(X) :-
   uniq_ppl(Blue, Orange, Red, Purple, Green, Yellow),
   uniq_ppl(Avocado, Onion, Nuts, Chocolate, Garlic, Cookies),

% For Clue1: The man who owns the RedBag did not carry Cookies, Chocolate, or Avocado. 
	man(Red), 
   \+Red=Cookies, \+Red=Chocolate, \+Red=Avocado,
    
% For Clue2: Onion was not carried by using RedBag.
	\+Red=Onion,
    
% For Clue3: Beyza owns either the YellowBag or the BlueBag; Meryem owns the other. 
	 woman(Yellow), woman(Blue), \+canan=Yellow, \+canan=Blue, 
    \+beyza=Orange, \+beyza=Red, \+beyza=Purple, \+beyza=Green,
    
% For Clue4:The person who carried the Avocado, who was not Beyza nor Gencer, does not own BlueBag nor the OrangeBag 
   \+beyza=Avocado, \+gencer=Avocado, \+Avocado=Blue, \+Avocado=Orange,  

% For Clue5: The woman who carried the Cookies owns the YellowBag
    woman(Cookies), Cookies=Yellow,

% For Clue6: The food item carried with PurpleBag belongs to either Can or Gencer.
    man(Purple), \+Purple=rasim,
    
% For Clue7: The Chocolate was not carried with OrangeBag. 
    \+Chocolate=Orange,
    
% For Clue8: Meryem did not carry a food item with the YellowBag nor the GreenBag.
    \+meryem=Yellow, \+meryem=Green,

%For Clue9: Onion is carried by Gencer. 
	gencer=Onion,

%For Clue10: Nuts were carried with GreenBag and that person was guilty.. 
	Nuts=Green, Green=X, write("Kidnapper was :"), write(X), nl, writeanswers(Blue, Orange, Red, Purple, Green, Yellow, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies).   

   
writeanswers(Blue, Orange, Red, Purple, Green, Yellow, Avocado, Onion, Nuts, Chocolate, Garlic, Cookies):- 
  write(Blue), write(" has the blue bag."), nl,
  write(Orange), write(" has the orange bag."), nl, 
  write(Red), write(" has the red bag."), nl,
  write(Purple), write(" has the purple bag."), nl,
  write(Green), write(" has the green bag."), nl,
  write(Yellow), write(" has the yellow bag."), nl,
  write(Avocado), write(" carried avocado in the bag, so he/she is innocent."), nl,
  write(Onion), write(" carried onion in the bag, so he/she is innocent."), nl,
  write(Nuts), write(" carried nuts in the bag, so he/she is the guilty."), nl,
  write(Chocolate), write(" carried chocolate in the bag, so he/she is innocent."), nl,
  write(Garlic), write(" carried garlic in the bag, so he/she is innocent."), nl,
  write(Cookies), write(" carried cookies in the bag, so he/she is innocent."), nl.


 








