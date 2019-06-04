### Sauvegarde quotidienne de nuit ###

## Ce script est utilisé pour sauvegarder les données des postes clients du dossier C:\SAV à destination du serveur.
## Il se lance automatiquement lors de la fermeture de session d'un utilisateur et ne nécessite aucune intervention humaine.

## Marche à suivre

# Configurer le script en déclarant les variables pour les deux disques distants (clients et serveur)
# Concernant la variable $SDisk, l'environnement GetFolderPath est une valeur dynamique qui permet de définir l'emplacement d'un répertoire d'un utilisateur actif
# Taper la commande XCOPY et ne pas oublier de définir les options.
    
    #Description des options :
    #/D = Copie les fichiers modifiés à partir de la date spécifiée.
    #/E = Copie les répertoires et sous-répertoires, y compris les répertoires vides.
    #/R = Remplace les fichiers en lecture seule.
    #/I = Si la destination n'existe pas et que plus d'un fichier est copié, considére la destination comme devant être un répertoire. 
    #/C = Continue la copie même si des erreurs se produisent.
    #/Z = Copie les fichiers du réseau en mode redémarrable.

# Après avoir codé le script, créer une GPO pour exécuter automatiquement le script
# Cette GPO se trouve dans: Utilisateurs/Stratégies/Paramètres Windows/Script (ouverture/fermeture de session), puis dans l'onglet "Script Powershell".

## Déclaration des variables : ##

#Disque Source
$SDisk = [Environment]::GetFolderPath("MyDocuments")
#Disque Destinataire
$DDisk = "\\Srvadacmepar01\sav\$env:USERNAME\"


#Commande
XCOPY $SDisk $DDisk /D /E /R /S /I /C /Z /Y
