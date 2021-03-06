$chemin=pwd
wget "https://extranet.arcep.fr/portail/Portals/0/Documents/Arcep/IdentifiantsCE/identifiants_CE.csv" -OutFile $chemin\identifiants_CE.csv
$liste = Import-Csv -Path $chemin\identifiants_CE.csv -Delimiter ";" | 
Where-Object {$_.RCS_ACTEUR -match "(Ville1 | Ville2 | Ville3 ...)"} |
Select-Object -Property IDENTITE_OPERATEUR, RCS_ACTEUR, ADRESSE_COMPLETE_ACTEUR |
Export-Csv -Path $chemin\resultat_liste_entreprises.csv -Delimiter  ";" -Encoding UTF8
