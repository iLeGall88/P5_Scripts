### Récupérer la liste des groupes dont un utilisateur est membre ###

## Marche à suivre

## Pour ce script silencieux, il est demandé à l'utilisateur de rentrer le nom de l'utilisateur faisant partie de plusieurs groupes.

# Déclarer la variable $user pour permettre de trouver un utilisateur au sein d'un groupe de l'AD
# Déclarer la variable $Value avec la commande foreach pour créer une boucle sur chaque élément de la variable $user
# La commande est ensuite exécutée dans le bloc Try{} pour ajouter la liste des groupes dans un fichier texte
# Si tout s'est bien déroulé, la commande envoie un echo
# Le bloc Catch{}, renvoyer un message d'erreur si la première commande n'a pas fonctionnée
# Enfin, un code d'erreur est indiqué par 0 ou 1 grâce au $LASTEXITCODE
# Dans la fonction Param, il est possible de demander à l'utilisateur de saisir le chemin pour envoyer le résultat de la commande dans un fichier .txt
	# Décommenter tout le bloc Param
	# Rajouter une virgule après $user
	# Commenter la variable $chemin dans la partie Variables chemins.

Param(
[Parameter(Mandatory=$True)]
[String]$user
#[Parameter(Mandatory=$True)]
#[String]$chemin
)

#Variables chemins
$fichier="C:\AD_Users\Projet05_LEGALL_AD03.txt"
$file_Log = "C:\Scripts\Logs\Error_Script3_Log.txt"

#Variable utilisateur
$user = Get-ADUser -Filter {sAmaccountName -like $User} -SearchBase "DC=acme,DC=fr" -Properties MemberOf

#Variable boucle 
$Value = foreach($u in $user){
write-host  "`nGroupe"
 $u.name
 $u.memberof }

#Essayer cette commande
Try
{
Add-Content -Path $fichier -Value $Value
echo "Résultat de la commande extraite dans le fichier .txt pour les groupes dont un utilisateur est membre"
}

#Sinon, envoyer le retour de l'erreur dans un fichier log.txt
Catch
{
    Write-Host -Fore 'Red' "Une erreur est survenue :`n $($Error[0])"
    echo "Une erreur est survenue :`n $($Error[0])" > $file_Log

    $Host.SetShouldExit(1)
    }
#Cette commande effiche un retour d'erreur (0=pas d'erreur ou 1=erreur)
Exit $LASTEXITCODE
