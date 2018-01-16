{
ALGORITHME Jeu_de_nim
BUT :Le jeu des allumettes (encore appele jeu de nim) se joue a deux.
Les deux joueurs se partagent un tas de 21 allumettes.
A tour de role, ils doivent retirer 1,2 ou 3 allumettes du tas.
le joueur qui retire la derniere allumette a perdu.
ENTREE :
SORTIE :
CONST
	nbAllumetteMin <- 1 : ENTIER
	nbAllumetteMax <- 3 : ENTIER
	totalAllumette <- 21 : ENTIER
	totalLigne1 <- 1 : ENTIER
	totalLigne2 <- 3 : ENTIER
	totalLigne3 <- 4 : ENTIER
	totalLigne4 <- 6 : ENTIER
	totalLigne5 <- 7 : ENTIER
VAR
	choixMenu, nbAllumette, actionJoueur1, actionJoueur2, cpt, choixLigneJ1, choixLigneIA, nbLigne1, nbLigne2, nbLigne3, nbLigne4, nbLigne5: ENTIER
	joueur1, joueur2, gagnant : CHAINE

DEBUT
//Menu
	ECRIRE "--JEU DE NIM--"
	ECRIRE "Mode de jeu"
	ECRIRE "Enter le chiffre correspondant."
	ECRIRE "1 : joueur contre joueur."
	ECRIRE "2 : IA contre joueur."
	ECRIRE "3 : IA contre joueur avec containte."
	LIRE choixMenu

	CAS choixMenu PARMI
//Regle
		0:ECRIRE "-Regle-"
		ECRIRE "Le jeu des allumettes (encore appele jeu de nim) se joue a deux."
		ECRIRE "Les deux joueurs se partagent un tas de 21 allumettes."
		ECRIRE "A tour de role, ils doivent retirer 1,2 ou 3 allumettes du tas."
		ECRIRE "le joueur qui retire la derniere allumette a perdu."

//Version 1
//joueur contre joueur
		1:ECRIRE "Mode joueur contre joueur"
	//Nom des joueur
		ECRIRE "Enter le nom du joueur 1."
		LIRE joueur1
		ECRIRE "Enter le nom du joueur 2."
		LIRE joueur2
	//Initialisation des variable
		nbAllumette <- totalAllumette

		REPETER
	//Tours joueur 1
			ECRIRE "Retirer des allumette", joueur1
			LIRE actionJoueur1
			SI (actionJoueur1 >= nbAllumetteMin) ET (actionJoueur1 <= nbAllumetteMax) ALORS					//Verification de saisi
				nbAllumette <- nbAllumette - actionJoueur1 													//Reaffectation du nombre d'allumette
				ECRIRE "Il reste", nbAllumette, "allumettes."	
				gagnant <- joueur1			//Affectation du gagnant
	//Tours joueur 2
				SI (nbAllumette >= 1) ALORS		//On verifie si il reste encore des allumettes
					ECRIRE "Retirer des allumette", joueur2
					LIRE actionJoueur2					
					TANQUE (actionJoueur2 < nbAllumetteMin) OU (actionJoueur2 > nbAllumetteMax) FAIRE		//Verification de saisi
						ECRIRE joueur2, " Le nombre d allumettes retirer dois etre 1, 2 ou 3, recommencer."
						ECRIRE "Retirer des allumette ", joueur2
						LIRE actionJoueur2
					FINTANQUE
					nbAllumette <- nbAllumette-actionJoueur2												//Reaffectation du nombre d'allumette
					ECRIRE "Il reste ", nbAllumette, " allumettes."
					gagnant <- joueur2 																		//Affectation du gagnant
				FINSI
			SINON
				ECRIRE joueur1, "Le nombre d'allumettes retirer dois etre 1, 2 ou 3, recommencer."
			FINSI
		JUSQUA (nbAllumette < 1)

		ECRIRE "BRAVO", gagnant, "Vous avez gagné!!!"

//version2
//IA contre joueur.
		2:ECRIRE "-Mode algo contre joueur-"
	//Nom du joueur
		ECRIRE "Enter votre nom."
		LIRE joueur1
		joueur2 <- "Boby"
		ECRIRE "Vous allez jouer contre Boby notre IA."
	//Initialisation des variable
		nbAllumette <- totalAllumette

		REPETER
	//Tours joueur 1
			ECRIRE "Retirer des allumette", joueur1
			LIRE actionJoueur1
			SI (actionJoueur1 >= nbAllumetteMin) ET (actionJoueur1 <= nbAllumetteMax) ALORS
				nbAllumette <- nbAllumette - actionJoueur1
				ECRIRE "Il reste", nbAllumette, "allumettes."
				gagnant <- joueur1	
	//Tours joueur 2
				SI (nbAllumette >= 1) ALORS
					SI (nbAllumette <= 4) ET (nbAllumette <> 1) ALORS 						//Si il reste 4 ou moine au reste d'allumettes.
						REPETER																//l'IA va enlever un nombre d'allumette pour qu'il en reste qu'une.
							cpt <- cpt+1
							nbAllumette <- nbAllumette - 1
						JUSQUA nbAllumette = 1
						ECRIRE joueur2, " a retirer ", cpt, " allumettes"
					SINON 																	//Sinon l'IA va choisir un valeur aléatoire.
						randomize;
						actionJoueur2:=random(3)+1;
						nbAllumette:=nbAllumette-actionJoueur2;
						ECRIRE joueur2, " a retirer ", actionJoueur2, " allumettes"
						ECRIRE "Il reste ", nbAllumette, " allumettes."
						gagnant <- joueur1
					FINSI
			SINON
				ECRIRE joueur1, "Le nombre d'allumettes retirer dois etre 1, 2 ou 3, recommencer."
			FINSI
		JUSQUA (nbAllumette < 1)

		ECRIRE "BRAVO", gagnant, "Vous avez gagné!!!"

//version3
//IA contre joueur avec containte.
		3:ECRIRE "Algo contre joueur avec containte."
	//Nom du joueur
		ECRIRE "Enter votre nom."
		LIRE joueur1
		joueur2 <- "Boby"
		ECRIRE "Vous allez jouer contre Boby notre IA."
	//Initialisation des variable
		nbLigne1 <- totalLigne1
		nbLigne2 <- totalLigne2
		nbLigne3 <- totalLigne3
		nbLigne4 <- totalLigne4
		nbLigne5 <- totalLigne5
		nbAllumette <- totalAllumette

		REPETER
	//tours joueur 1
			ECRIRE "Il y a ", nbAllumette, " au total."
			ECRIRE nbLigne1, " sur la ligne 1"
			ECRIRE nbLigne2, " sur la ligne 2"
			ECRIRE nbLigne3, " sur la ligne 3"
			ECRIRE nbLigne4, " sur la ligne 4"
			ECRIRE nbLigne5, " sur la ligne 5"

			ECRIRE joueur1, " choisissez une ligne en entrent son numero."
			LIRE choixLigneJ1

			CAS choixLigneJ1 PARMI
			//Ligne1
				1:ECRIRE "Ligne 1 selectionner"
				ECRIRE "Il reste ", nbLigne1 "allumettes"
				ECRIRE "Retirer des allumette", joueur1
				LIRE actionJoueur1

				TANQUE (actionJoueur1 < nbAllumetteMin) OU (actionJoueur1 > nbAllumetteMax) OU (actionJoueur1 > nbLigne1) FAIRE
					ECRIRE joueur1, " Le nombre d allumettes retirer dois etre 1, 2 ou 3 et ne pas dépacer le nombre d'allumettes restente, recommencer."
					ECRIRE "Retirer des allumette ", joueur1
					LIRE actionJoueur1
				FINTANQUE

				nbLigne1 <- nbLigne1 - actionJoueur1
				nbAllumette <- nbAllumette - actionJoueur1
				ECRIRE "Il reste", nbAllumette, "allumettes."
				gagnant <- joueur2
			//Ligne2
				2:ECRIRE "Ligne 2 selectionner"
				ECRIRE "Il reste ", nbLigne2 "allumettes"
				ECRIRE "Retirer des allumette", joueur1
				LIRE actionJoueur1

				TANQUE (actionJoueur1 < nbAllumetteMin) OU (actionJoueur1 > nbAllumetteMax) OU (actionJoueur1 > nbLigne2) FAIRE
					ECRIRE joueur1, " Le nombre d allumettes retirer dois etre 1, 2 ou 3 et ne pas dépacer le nombre d'allumettes restente, recommencer."
					ECRIRE "Retirer des allumette ", joueur1
					LIRE actionJoueur1
				FINTANQUE

				nbLigne2 <- nbLigne2 - actionJoueur1
				nbAllumette <- nbAllumette - actionJoueur1
				ECRIRE "Il reste", nbAllumette, "allumettes."
				gagnant <- joueur2
			//Ligne3
				3:ECRIRE "Ligne 3 selectionner"
				ECRIRE "Il reste ", nbLigne3 "allumettes"
				ECRIRE "Retirer des allumette", joueur1
				LIRE actionJoueur1

				TANQUE (actionJoueur1 < nbAllumetteMin) OU (actionJoueur1 > nbAllumetteMax) OU (actionJoueur1 > nbLigne3) FAIRE
					ECRIRE joueur1, " Le nombre d allumettes retirer dois etre 1, 2 ou 3 et ne pas dépacer le nombre d'allumettes restente, recommencer."
					ECRIRE "Retirer des allumette ", joueur1
					LIRE actionJoueur1
				FINTANQUE

				nbLigne3 <- nbLigne3 - actionJoueur1
				nbAllumette <- nbAllumette - actionJoueur1
				ECRIRE "Il reste", nbAllumette, "allumettes."
				gagnant <- joueur2
			//Ligne4
				4:ECRIRE "Ligne 4 selectionner"
				ECRIRE "Il reste ", nbLigne4 "allumettes"
				ECRIRE "Retirer des allumette", joueur1
				LIRE actionJoueur1

				TANQUE (actionJoueur1 < nbAllumetteMin) OU (actionJoueur1 > nbAllumetteMax) OU (actionJoueur1 > nbLigne4) FAIRE
					ECRIRE joueur1, " Le nombre d allumettes retirer dois etre 1, 2 ou 3 et ne pas dépacer le nombre d'allumettes restente, recommencer."
					ECRIRE "Retirer des allumette ", joueur1
					LIRE actionJoueur1
				FINTANQUE

				nbLigne4 <- nbLigne4 - actionJoueur1
				nbAllumette <- nbAllumette - actionJoueur1
				ECRIRE "Il reste", nbAllumette, "allumettes."
				gagnant <- joueur2
			//Ligne5
				5:ECRIRE "Ligne 5 selectionner"
				ECRIRE "Il reste ", nbLigne4 "allumettes"
				ECRIRE "Retirer des allumette", joueur1
				LIRE actionJoueur1

				TANQUE (actionJoueur1 < nbAllumetteMin) OU (actionJoueur1 > nbAllumetteMax) OU (actionJoueur1 > nbLigne5) FAIRE
					ECRIRE joueur1, " Le nombre d allumettes retirer dois etre 1, 2 ou 3 et ne pas dépacer le nombre d'allumettes restente, recommencer."
					ECRIRE "Retirer des allumette ", joueur1
					LIRE actionJoueur1
				FINTANQUE

				nbLigne5 <- nbLigne5 - actionJoueur1
				nbAllumette <- nbAllumette - actionJoueur1
				ECRIRE "Il reste", nbAllumette, "allumettes."
				gagnant <- joueur2
			FINCASPARMI
	//tours IA
			SI (nbAllumette >= 1) ALORS
				randomize;
				choixLigneIA:=random(5)+1;

				CAS choixLigneIA PARMI
				//ligne1
					1:ECRIRE joueur2, " a selectionner la ligne : ",choixLigneIA
					randomize;
					actionJoueur2:=random(3)+1;

					TANQUE actionJoueur2 > nbLigne1 FAIRE
						randomize;
						actionJoueur2:=random(3)+1;
					FINTANQUE

					nbLigne1 <- nbLigne1 - actionJoueur2
					nbAllumette <- nbAllumette - actionJoueur2
					ECRIRE joueur2, " a retirer ", actionJoueur2, " allumettes."
					gagnant <- joueur1
				//ligne2
					2:ECRIRE joueur2, " a selectionner la ligne : ",choixLigneIA
					randomize;
					actionJoueur2:=random(3)+1;

					TANQUE actionJoueur2 > nbLigne2 FAIRE
						randomize;
						actionJoueur2:=random(3)+1;
					FINTANQUE

					nbLigne2 <- nbLigne2 - actionJoueur2
					nbAllumette <- nbAllumette - actionJoueur2
					ECRIRE joueur2, " a retirer ", actionJoueur2, " allumettes."
					gagnant <- joueur1
				//ligne3
					3:ECRIRE joueur2, " a selectionner la ligne : ",choixLigneIA
					randomize;
					actionJoueur2:=random(3)+1;

					TANQUE actionJoueur2 > nbLigne3 FAIRE
						randomize;
						actionJoueur2:=random(3)+1;
					FINTANQUE

					nbLigne3 <- nbLigne3 - actionJoueur2
					nbAllumette <- nbAllumette - actionJoueur2
					ECRIRE joueur2, " a retirer ", actionJoueur2, " allumettes."
					gagnant <- joueur1
				//ligne4
					4:ECRIRE joueur2, " a selectionner la ligne : ",choixLigneIA
					randomize;
					actionJoueur2:=random(3)+1;

					TANQUE actionJoueur2 > nbLigne4 FAIRE
						randomize;
						actionJoueur2:=random(3)+1;
					FINTANQUE

					nbLigne4 <- nbLigne4 - actionJoueur2
					nbAllumette <- nbAllumette - actionJoueur2
					ECRIRE joueur2, " a retirer ", actionJoueur2, " allumettes."
					gagnant <- joueur1
				//ligne5
					5:ECRIRE joueur2, " a selectionner la ligne : ",choixLigneIA
					randomize;
					actionJoueur2:=random(3)+1;

					TANQUE actionJoueur2 > nbLigne5 FAIRE
						randomize;
						actionJoueur2:=random(3)+1;
					FINTANQUE

					nbLigne5 <- nbLigne5 - actionJoueur2
					nbAllumette <- nbAllumette - actionJoueur2
					ECRIRE joueur2, " a retirer ", actionJoueur2, " allumettes."
					gagnant <- joueur1					

				FINCASPARMI
			FINSI
		JUSQUA (nbAllumette < 1)
	FINCASPARMI

		ECRIRE "BRAVO", gagnant, "Vous avez gagné!!!"	
FIN.
}

//Traduction en pascal

PROGRAM Jeu_de_nim;

USES crt;

CONST
	nbAllumetteMin=1;
	nbAllumetteMax=3;

VAR
	choixMenu, nbAllumette, actionJoueur1, actionJoueur2, cpt : INTEGER;
	joueur1, joueur2, gagnant : STRING;
BEGIN
clrscr;	
//Menu
writeln('--JEU DE NIM--');
writeln;
writeln;
writeln('Mode de jeu');
writeln;
writeln('Enter le chiffre correspondant.');
writeln('1 : joueur contre joueur.');
writeln('2 : IA contre joueur.');
{writeln('3 : IA contre joueur avec containte.');}
writeln('0 : Regle.');
readln(choixMenu);

case choixMenu of						
//Regle
	0:begin
	clrscr;
	writeln('-Regle-');
	writeln;
	writeln('Le jeu des allumettes (encore appele jeu de nim) se joue a deux.');
	writeln('Les deux joueurs se partagent un tas de 21 allumettes.');
	writeln('A tour de role, ils doivent retirer 1,2 ou 3 allumettes du tas.');
	writeln('le joueur qui retire la derniere allumette a perdu.');
	end;
//version1
//Mode joueur contre joueur	
	1:begin
	writeln('-Mode joueur contre joueur-');	
	//Nom des joueur
	writeln('Enter le nom du joueur 1');
	readln(joueur1);
	writeln('Enter le nom du joueur 2');
	readln(joueur2);
	//Initialisation des variable
	nbAllumette:=21;
	//Debut
	repeat
	//Tours joueur 1
		begin
		writeln('Retirer des allumette ', joueur1);
		readln(actionJoueur1);

		if ((actionJoueur1 >= nbAllumetteMin) and (actionJoueur1 <= nbAllumetteMax)) then
			begin
			clrscr;
			nbAllumette:=nbAllumette-actionJoueur1;
			writeln('Il reste ', nbAllumette, ' allumettes.');
			gagnant:=joueur2;
	//Tours joueur 2
			if (nbAllumette >= 1) then
				begin
				writeln('Retirer des allumette ', joueur2);
				readln(actionJoueur2);
				
				while ((actionJoueur2 < nbAllumetteMin) or (actionJoueur2 > nbAllumetteMax)) do
					begin
					clrscr;
					writeln(joueur2, ' Le nombre d allumettes retirer dois etre 1, 2 ou 3, recommencer.');
					writeln('Retirer des allumette ', joueur2);
					readln(actionJoueur2);
					end;
				clrscr;
				nbAllumette:=nbAllumette-actionJoueur2;
				writeln('Il reste ', nbAllumette, ' allumettes.');
				gagnant:=joueur1
				end;
			end
		else
			begin
			writeln(joueur1, ' le nombre d allumettes retirer dois etre 1, 2 ou 3,recommencer.')
			end
		end;

	until nbAllumette < 1;

	writeln('BRAVO ', gagnant, ' vous avez gagnes!!!');
	end;
//version2
//IA contre joueur.
	2:begin
	writeln('-Mode algo contre joueur-');
	//Nom du joueur
	writeln('Enter votre nom.');
	readln(joueur1);
	joueur2:='Boby';
	writeln('Vous allez jouer contre Boby notre IA.');
	//Initialisation des variable
	nbAllumette:=21;
	//Debut
	repeat
	//Tours joueur 1
		begin
		writeln('Retirer des allumette ', joueur1);
		readln(actionJoueur1);

		if ((actionJoueur1 >= nbAllumetteMin) and (actionJoueur1 <= nbAllumetteMax)) then
			begin
			clrscr;
			nbAllumette:=nbAllumette-actionJoueur1;
			writeln('Il reste ', nbAllumette, ' allumettes.');
			gagnant:=joueur2;
	//Tours joueur 2
			
			if (nbAllumette >= 1) then
				begin
				//IA gagne toujours
				{cpt:=0;
				repeat
					begin
					cpt:=cpt+1;
					nbAllumette:=nbAllumette-1;
					end;
				until (nbAllumette MOD 4=0+1) or (cpt=3);
				writeln(joueur2, ' a retirer ', cpt, ' allumettes');
				writeln('Il reste ', nbAllumette, ' allumettes.');
				gagnant:=joueur1;}

				//Aléatoire
				clrscr;
				if (nbAllumette <= 4) and (nbAllumette <> 1) then
					begin
					repeat
						begin
						cpt:=cpt+1;
						nbAllumette:=nbAllumette-1;
						end;
					until nbAllumette=1;
					writeln(joueur2, ' a retirer ', cpt, ' allumettes');
					end
				else
					begin
					randomize;
					actionJoueur2:=random(3)+1;
					nbAllumette:=nbAllumette-actionJoueur2;
					writeln(joueur2, ' a retirer ', actionJoueur2, ' allumettes')			
					end;
				writeln('Il reste ', nbAllumette, ' allumettes.');
				gagnant:=joueur1
				end;		
			end
		else
			begin
			writeln(joueur1, ' le nombre d allumettes retirer dois etre 1, 2 ou 3,recommencer.')
			end
		end;

	until nbAllumette < 1;

	writeln('BRAVO ', gagnant, ' vous avez gagnes!!!');
	end;
end;	
readln;
END.