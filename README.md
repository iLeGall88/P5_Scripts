# P5_Scripts
Bienvenue sur le GitHub du Projet 5 "Créez des services partagés en entreprise et automatisez des tâches".

Je publie ici quatre scripts rédigés sur Windows Server 2019 avec Powershell ISE.

Script 1: Créer un nouvel utilisateur ainsi qu'un dossier partagé à son nom (Projet05_LEGALL_Script01.ps1) (Script Interactif)

Script 2: Lister les membres d'un groupe (Projet05_Nom_Script02.ps1) et extraire le résultat dans le fichier "Projet05_Nom_AD02.txt" (Script Silencieux)

Script 3: Récupérer la liste des groupes dont un utilisateur est membre (Projet05_Nom_Script03.ps1) et extraire le résultat dans le fichier "Projet05_Nom_AD03.txt" (Script Silencieux)

Script 4: Sauvegarde quotidienne de nuit des données de chaque poste client dans un dossier c:\SAV\ dédié sur le serveur (Projet05_Nom_Script04.ps1).


# Etapes à suivre :

Script 1: 
	Lors du lancement du script dans PowerShell, il est demandé de saisir le chemin du fichier .csv.
	Une fois saisi, le ou les utilisateurs seront ajoutés au sein de l'AD.

Script 2:
	Grâce à la fonction Param du script, il est uniquement demandé à l'utilisateur d'entrer le nom d'un groupe.
	Le script génère donc la liste des utilisateurs du groupe et envoie le résultat dans un fichier .txt

Script 3:
	Comme pour le deuxième script, il est demandé de rentrer cette fois-ci, le nom de l'utilisateur faisant partie de plusieurs groupes.

Script 4:
	Ce dernier script est silencieux, il ne demande donc aucune intervention de l'utilisateur.
	Il s'exécute automatiquement lors de la fermeture de session d'un utilisateur.
	
