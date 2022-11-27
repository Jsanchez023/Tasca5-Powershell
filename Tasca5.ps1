#Powershell és una eina molt potent que permet treballar pràcticament tots els aspectes de configuració del nostre equip. Un dels més utilitzats és l'accés a la informació i modificació dels usuaris.
#- Fes un script que permeti localitzar tots els SID (identificadors d'usuari) de tots els usuaris existents a un active directory i els mostri en mode taula, amb el format nom - SID
#- A partir del llistat d'usuaris, afegeix el codi necessari per tal que es pugui triar un usuari i modificar-li la foto/imatge d'entrada al sistema.
#- Revisa la data d'entrada al sistema (LastLogonDate) i si es troba fora d'horari laboral de 10 a 14 i de 15 a 18 que aparegui el nom i l'identificador a un fitxer de text de nom alerta.txt. És una acció simulada, per tant si no pots trobar usuaris dintre d'aquest rang d'hores pots canviar-ho.
Get-ADUser -Filter * | ft name,SID
$usuari = Read-Host -Prompt 'selecciona un usuario'
$imagen = Read-Host -Prompt 'selecciona la foto'
Set-ADUser $usuari -Replace @{thumbnailPhoto=([byte[]](Get-Content $imagen -Encoding Byte))}