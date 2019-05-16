### Liste des membres d'un groupe ###

## Marche à suivre
# A l'execution du script, il est directement demandé à l'utilisateur de rentrer le nom du domaine.
# Il est demandé par la suite le $chemin pour extraire la liste dans un fichier texte.

# Déclarer la variable $Value pour les utilisateurs de l'AD
# La commande est ensuite exécutée dans le bloc Try{} pour ajouter la liste dans le fichier texte.
# Si tout s'est bien déroulé, la commande envoie un echo.

# Le bloc Catch{}, renvoyer un message d'erreur si la première commande n'a pas fonctionnée.
# Enfin, un code d'erreur est indiqué par ou 1 grâce au $LASTEXITCODE

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
#Essayer
  Try {
    $users = Get-ADGroupMember -Identity $groupName
    Add-Content -Path $chemin -Value $users
    echo "Liste des utilisateurs exportée dans le fichier .txt"
    }
#Sinon
  Catch {
    Write-Host -Fore 'Red' "Une erreur est survenue :`n $($Error[0])"
    echo "Une erreur est survenue :`n $($Error[0])" > $File_Log
    $Host.SetShouldExit(1)
    }

Exit $LASTEXITCODE