### Liste des membres d'un groupe ###

## Marche à suivre
# A l'execution du script, il est directement demandé à l'utilisateur de rentrer le nom du groupe.

# Déclarer la variable $users pour les utilisateurs de l'AD présents dans un groupe.
# La commande est ensuite exécutée dans le bloc Try{} pour ajouter la liste dans le fichier texte.
# Si tout s'est bien déroulé, la commande envoie un echo.

# Le bloc Catch{}, renvoyer un message d'erreur si la première commande n'a pas fonctionnée.
# Enfin, un code d'erreur est indiqué par ou 1 grâce au $LASTEXITCODE
# Dans la fonction Param, il est possible de demander à l'utilisateur de saisir le chemin pour envoyer le résultat de la commande dans un fichier .txt
	# Décommenter le bloc Param
	# Rajouter une virgule après groupName
	# Commenter la variable $chemin

Param(
[Parameter(Mandatory=$True)]
[String]$groupName
#[Parameter(Mandatory=$True)]
#[String]$chemin
)

##Génération du fichier .txt
$chemin="C:\AD_Users\Projet05_LEGALL_AD02.txt"
$File_Log="C:\Scripts\Logs\Error_Script2_Log.txt"

$users = Get-ADGroupMember -Identity $groupName

##Pour l'export du fichier .txt
#Essayer cette commande
  Try {
    $users = Get-ADGroupMember -Identity $groupName
    Add-Content -Path $chemin -Value $users
    echo "Liste des utilisateurs exportée dans C:\AD_Users\Projet05_LEGALL_AD02.txt"
    }
#Sinon, envoyer le résultat de l'erreur dans un fichier log.txt
  Catch {
    Write-Host -Fore 'Red' "Une erreur est survenue :`n $($Error[0])"
    echo "Une erreur est survenue :`n $($Error[0])" > $File_Log
    $Host.SetShouldExit(1)
    }
#Cette commande affiche un retour d'erreur (0=pas d'erreur ou 1=erreur)
Exit $LASTEXITCODE
