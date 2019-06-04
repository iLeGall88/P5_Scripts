### Création d'un utilisateur ainsi qu'un dossier partagé à son nom ###

## Prélablement, taper les commandes suivantes avant de continuer (décommenter si besoin):
# Set-Execution Policy|Unrestricted pour autoriser l'execution du script
#Import-Module ActiveDirectory pour importer le module Active Directory

#Demander à l'utilisateur le chemin du fichier entrée et sortie
$filepath = Read-Host -Prompt "Entrez le chemin d'accès au fichier CSV"
$File_Log = "C:\Scripts\Logs\Error_Script1_Log.txt"

#Importation du fichier dans la variable
$users = Import-Csv -Path $filepath -Delimiter ","

#Parcourir chaque rangées et reccueillir les informations
ForEach($User in $Users)
{
    $Password = (ConvertTo-SecureString -AsPlainText $user.password -Force)
    $Displayname = $User.firstName + " " + $User.lastName 


      $Parameters = @{
      'SamAccountName'        = $user.samAccountName
      'UserPrincipalName'     = $User.UserPrincipalName
      'Name'                  = $Displayname
      'EmailAddress'          = $user.emailAdress
      'GivenName'             = $User.firstname 
      'Surname'               = $User.lastname  
      'AccountPassword'       = $Password
      'Office'                = $User.office
      'Enabled'               = $true 
      'Department'            = $user.department
      'homedrive'             = "E"
      'homedirectory'         = "\\SRVADACMEPAR01\ACME_Users\$($user.samAccountName)"
       
       }
  #Essayer cette commande
  Try{
        #Commande 1: on crée le dossier de l'utilisateur dans le serveur
       New-Item -ItemType directory \\SRVADACMEPAR01\ACME_Users\$($user.samAccountName)
        #Commande 2: on ajoute l'utilisateur dans l'AD
       New-ADUser @Parameters
       echo "Compte utilisateur créé pour $Displayname"
       }
  #Sinon, envoyer le résultat de l'erreur dans un fichier log.txt  
  Catch{
        Write-Host -Fore 'Green' "L'utilisateur $DisplayName n'a pu être ajouté avec succès"
        echo "Une erreur est survenue :`n $($Error[0])" > $File_Log
    $Host.SetShouldExit(1)
        }
}
#Cette variable est un retour d'erreur (0=pas d'erreur ou 1=erreur)
Exit $LASTEXITCODE
