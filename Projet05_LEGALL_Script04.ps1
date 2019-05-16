### Sauvegarde quotidienne de nuit ###
    
    #Description des options :
    #/D = Copie les fichiers modifiés à partir de la date spécifiée.
    #/E = Copie les répertoires et sous-répertoires, y compris les répertoires vides.
    #/R = Remplace les fichiers en lecture seule.
    #/I = Si la destination n'existe pas et que plus d'un fichier est copié, considére la destination comme devant être un répertoire. 
    #/C = Continue la copie même si des erreurs se produisent.
    #/Z =  Copie les fichiers du réseau en mode redémarrable.

## Déclaration des variables : ##

#Disque Source
$SDisk = [Environment]::GetFolderPath("MyDocuments")
#Disque Destinataire
$DDisk = "\\Srvacmepar01\sav\$env:USERNAME\"


#Commande
XCOPY $SDisk $DDisk /D /E /R /S /I /C /Z