### Récupérer la liste des groupes dont un utilisateur est membre ###

## Marche à suivre

# A l'execution du script, il est directement demandé à l'utilisateur de rentrer le nom de l'utilisateur.
# Déclarer la variable $user pour permettre de trouver un utilisateur au sein de l'AD
# Déclarer la variable $Value avec la commande foreach pour créer une boucle sur chaque élément de la variable $user
# La commande est ensuite exécutée dans le bloc Try{} pour ajouter la liste dans le fichier texte
# Si tout s'est bien déroulé, la commande envoie un echo
# Le bloc Catch{}, renvoyer un message d'erreur si la première commande n'a pas fonctionnée
# Enfin, un code d'erreur est indiqué par 0 ou 1 grâce au $LASTEXITCODE


Param(
[Parameter(Mandatory=$True)]
[String]$user
#[Parameter(Mandatory=$True)]
#[String]$chemin
)

#Variables
$fichier="C:\AD_Users\Projet05_LEGALL_AD03.txt"
$file_Log = "C:\Scripts\Logs\Error_Script3_Log.txt"

$user = Get-ADUser -Filter {sAmaccountName -like $User} -SearchBase "DC=acme,DC=fr" -Properties MemberOf

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

#Sinon, envoyer un message d'erreur
Catch
{
    Write-Host -Fore 'Red' "Une erreur est survenue :`n $($Error[0])"
    echo "Une erreur est survenue :`n $($Error[0])" > $file_Log

    $Host.SetShouldExit(1)
    }

Exit $LASTEXITCODE