Import-Module ActiveDirectory
#aqui enlazamos el script con el csv
$csv = Import-Csv C:\Script\Listado_FinalDomain.csv
$carpetas="Usuarios","Ordenadores","Grupos"
$domi="dc=TheFinal,dc=Domain"
$OU_inicial="FinalDomain"
$OU_total="OU=$ou_inicial,$domi"
$desarrolloPR = "DIRECTOR","PROYECTO-1","PROYECTO-2","PROYECTO-3","PROYECTO-4"

#Creacion masiva de todas las unidades   
foreach ($User  in $csv){
    
    $Departament = $User.DEPARTAMENTO
    $ruta="ou=$Departament,$OU_total"

    #cracion de la unidad principal FinalDomain
    if (Get-ADOrganizationalUnit -Filter "Name -like'$OU_inicial'"){
    }else{
        New-ADOrganizationalUnit -name $ou_inicial -path $domi -ProtectedFromAccidentalDeletion $false
    }

    #creacion de los proyectos en desarrollo
    if (Get-ADOrganizationalUnit -Filter "Name -like'DESARROLLO'"){
    }elseif ($Departament = "DESARROLLO"){
        New-ADOrganizationalUnit -name "$Departament" -path $OU_total -ProtectedFromAccidentalDeletion $false
        foreach ($desarrolloP in $desarrolloPR){
            
            $rutadsr = "ou=DESARROLLO,$OU_total"

            New-ADOrganizationalUnit -name $desarrolloP -path $rutadsr -ProtectedFromAccidentalDeletion $false
            #creacion de los usuarios equipos y grupos en los pryectos
            foreach ($carpeta in $carpetas){
             
                $rutadsrp = "ou=$desarrolloP,$rutadsr"

                New-ADOrganizationalUnit -name $carpeta -path $rutadsrp -ProtectedFromAccidentalDeletion $false
            }
            }
    }
    #creacion de unidad de usuarios grupos y equipos
    if (Get-ADOrganizationalUnit -Filter "Name -like'$Departament'"){
    }else{
        New-ADOrganizationalUnit -name $Departament -path $OU_total -ProtectedFromAccidentalDeletion $false
    foreach ($carpeta in $carpetas){
            New-ADOrganizationalUnit -name $carpeta -path $ruta -ProtectedFromAccidentalDeletion $false
    }
    }

}
#creacion del grupo responsables
New-ADOrganizationalUnit -name "Responsables" -Path "$OU_total" -ProtectedFromAccidentalDeletion $false
#Creacion masiva de todos los EQUIPOS   
foreach ($User in $csv){

    $workstations=$User.EQUIPO
    $Departament=$User.DEPARTAMENTO
    $PROYECTO=$User.PRDESARROLLO
    $Descripcion=$User.DESCRIPCION


    if ($Departament -eq "DESARROLLO") {
        New-ADComputer -name $workstations -Path "OU=Ordenadores,ou=$PROYECTO,ou=DESARROLLO,$OU_total" -Description $Descripcion
    }else{
        New-ADComputer -name $workstations -Path "OU=Ordenadores,ou=$Departament,$OU_total"
    }
} 
#Creacion masiva de todos los GRUPOS
foreach ($User in $csv){

    $Departament=$User.DEPARTAMENTO
    $prdesarrollo=$User.PRDESARROLLO

    if ($Departament -eq "DESARROLLO") {
        if (Get-ADGroup -Filter "Name -like 'Grupo_$prdesarrollo'"){
        }else{
        New-ADGroup -name "Grupo_$prdesarrollo" -Path "OU=Grupos,ou=$prdesarrollo,ou=$Departament,$OU_total" -GroupScope Global
        }
    }else{
        if (Get-ADGroup -Filter "Name -like 'Grupo_$Departament'"){
        }else{
        New-ADGroup -name "Grupo_$Departament" -Path "OU=Grupos,ou=$Departament,$OU_total" -GroupScope Global
    }
    }
    if ($Departament -eq "DESARROLLO") {
        if (Get-ADGroup -Filter "Name -like 'GrupoImpresora_$prdesarrollo'"){
        }else{
            New-ADGroup -name "GrupoImpresora_$prdesarrollo" -Path "OU=Grupos,ou=$prdesarrollo,ou=$Departament,$OU_total" -GroupScope Global
        }
    }else{
        if (Get-ADGroup -Filter "Name -like 'GrupoImpresora_$Departament'"){
        }else{
            New-ADGroup -name "GrupoImpresora_$Departament" -Path "OU=Grupos,ou=$Departament,$OU_total" -GroupScope Global
    }
    }
}


#creamos el grupo para los responsables
New-ADGroup -name "Grupo_Responsables" -Path "OU=Responsables,$OU_total" -GroupScope Global
#Creacion masiva de todos los USUARIOS

foreach ($User in $csv){

           $username =$User.NOMBRE  
           $password=$User.PASSWORD 
           $firstname=$User.USUARIO
           $surname=$User.APELLIDO
           $OU=$User.OU
           $group=$User.DEPARTAMENTO
           $acceso=$User.ACCESO
           $workstations=$User.EQUIPO
           $mail=$User.MAIL
           $departament=$User.DEPARTAMENTO
           $Descripcion=$User.DESCRIPCION
           $prdesarrollo=$User.PRDESARROLLO

    New-ADUser -Name $username -surname $surname `               -EmailAddress $mail `               -GivenName $firstname `               -LogonWorkstations $acceso -Path $OU -AccountPassword (convertto-securestring $password -asplaintext -force) `               -ChangePasswordAtLogon $false -ScriptPath "InicioFinalDomain.bat" `               -Enabled $True -description $Descripcion                
                                   
 #agregación de todos los usuarios ha sus respectvos grupos
    if($departament -eq "DESARROLLO"){
        Add-ADGroupMember -Identity "Grupo_$prdesarrollo" -Members $username 
    }elseif($departament -eq "SISTEMAS"){
        Add-ADGroupMember -Identity "Admins. del dominio" -Members $username 
        Add-ADGroupMember -Identity "Grupo_SISTEMAS" -Members $username
    }else{
        Add-ADGroupMember -Identity "Grupo_$departament" -Members $username
    }
    if($Descripcion -eq "Responsable"){
        Add-ADGroupMember -Identity "Grupo_Responsables" -Members $username
    }elseif($Descripcion -eq "Director"){
        Add-ADGroupMember -Identity "Grupo_Responsables" -Members $username
    }elseif($Descripcion -eq "Jefe_PR1"){
        Add-ADGroupMember -Identity "Grupo_Responsables" -Members $username
    }elseif($Descripcion -eq "Jefe_PR2"){
        Add-ADGroupMember -Identity "Grupo_Responsables" -Members $username
    }elseif($Descripcion -eq "Jefe_PR3"){
        Add-ADGroupMember -Identity "Grupo_Responsables" -Members $username
    }elseif($Descripcion -eq "Jefe_PR4"){
        Add-ADGroupMember -Identity "Grupo_Responsables" -Members $username
    }
    if($departament -eq "DESARROLLO"){
        if($Descripcion -eq "User_PR1"){
        Add-ADGroupMember -Identity "GrupoImpresora_$prdesarrollo" -Members $username 
        }elseif ($Descripcion -eq "User_PR2"){
        Add-ADGroupMember -Identity "GrupoImpresora_$prdesarrollo" -Members $username 
        }elseif ($Descripcion -eq "User_PR3"){
        Add-ADGroupMember -Identity "GrupoImpresora_$prdesarrollo" -Members $username 
        }elseif ($Descripcion -eq "User_PR4"){
        Add-ADGroupMember -Identity "GrupoImpresora_$prdesarrollo" -Members $username 
        }
   }else{
        if($Descripcion -eq "User_$workstations"){
        Add-ADGroupMember -Identity "GrupoImpresora_$departament" -Members $username
    }
}
}

#Creación de todas las carpetas
foreach ($User in $csv){

    $username =$User.NOMBRE
    $departament=$User.DEPARTAMENTO
    $prdesarrollo=$User.PRDESARROLLO

    #Crea la carpeta Publica
    if (test-path -path E:\FinalDomain\Publica){
    }else{
    New-Item -name "Publica" -ItemType directory -path E:\FinalDomain\
    }
    #Crea la carpeta Privada
    if (test-path -path E:\FinalDomain\Privado){
    }else{
    New-Item -name "Privado" -ItemType directory -path E:\FinalDomain\
    }
    #Crea la carpeta Departamentos
    if (test-path -path E:\FinalDomain\Departamentos){
    }else{
    New-Item -name "Departamentos" -ItemType directory -path E:\FinalDomain\
    }
    #Crea los departamentos
    if (test-path -path E:\FinalDomain\Departamentos\$departament){
    }else{
    New-Item -name "$departament" -ItemType directory -path E:\FinalDomain\Departamentos\
    }
    #Crea la carpeta responsables
    if (test-path -path E:\FinalDomain\Departamentos\Responsables){
    }else{
    New-Item -name "Responsables" -ItemType directory -path E:\FinalDomain\Departamentos\
    }
    #Crea la carpeta privada de cada usuario
    if (test-path -path E:\FinalDomain\Privado\carpeta_$username){
    }else{
    New-Item -name "Carpeta_$username" -ItemType directory -path E:\FinalDomain\Privado 
    }
    #Crea laas carpetas de los proyectos de desarrollo
    if (test-path -path E:\FinalDomain\Departamentos\DESARROLLO\$prdesarrollo){
    }else{
    New-Item -name "$prdesarrollo" -ItemType directory -path E:\FinalDomain\Departamentos\DESARROLLO\
    }
}


#Compratimos todas las carpetas que vayamos ha utilizar
#Primero las eliminamos
Remove-SmbShare -Name "Publica" -force
Remove-SmbShare -Name "Responsables" -force
Remove-SmbShare -Name "FinalDomain" -force
Remove-SmbShare -Name "DIRECTOR" -force
Remove-SmbShare -Name "PROYECTO-1" -force
Remove-SmbShare -Name "PROYECTO-2" -force
Remove-SmbShare -Name "PROYECTO-3" -force
Remove-SmbShare -Name "PROYECTO-4" -force
Remove-SmbShare -Name "CALIDAD" -force
Remove-SmbShare -Name "CONTABILIDAD" -force
Remove-SmbShare -Name "DIRECCION" -force
Remove-SmbShare -Name "LOGISTICA" -force
Remove-SmbShare -Name "PRESONAL" -force
Remove-SmbShare -Name "SUBIRECCION" -force
#las creamos
new-SmbShare -Name "Publica" -path E:\FinalDomain\Publica 
new-SmbShare -Name "Responsables" -path E:\FinalDomain\Departamentos\Responsables
new-SmbShare -Name "FinalDomain" -path E:\FinalDomain
new-SmbShare -Name "DIRECTOR" -path E:\FinalDomain\Departamentos\DESARROLLO\DIRECTOR
new-SmbShare -Name "PROYECTO-1" -path E:\FinalDomain\Departamentos\DESARROLLO\PROYECTO-1
new-SmbShare -Name "PROYECTO-2" -path E:\FinalDomain\Departamentos\DESARROLLO\PROYECTO-2
new-SmbShare -Name "PROYECTO-3" -path E:\FinalDomain\Departamentos\DESARROLLO\PROYECTO-3
new-SmbShare -Name "PROYECTO-4" -path E:\FinalDomain\Departamentos\DESARROLLO\PROYECTO-4
new-SmbShare -Name "CALIDAD" -path E:\FinalDomain\Departamentos\CALIDAD
new-SmbShare -Name "CONTABILIDAD" -path E:\FinalDomain\Departamentos\CONTABILIDAD
new-SmbShare -Name "DIRECCION" -path E:\FinalDomain\Departamentos\DIRECCION
new-SmbShare -Name "LOGISTICA" -path E:\FinalDomain\Departamentos\LOGISTICA
new-SmbShare -Name "PRESONAL" -path E:\FinalDomain\Departamentos\PRESONAL
new-SmbShare -Name "SUBIRECCION" -path E:\FinalDomain\Departamentos\SUBIRECCION
#y añadimos ha los usuarios que queremos compratirles la carpeta
Grant-SmbShareAccess -Name "Responsables" -AccountName "Grupo_Responsables" -AccessRight Full -Force
Grant-SmbShareAccess -Name "FinalDomain" -AccountName "Grupo_SISTEMAS"-AccessRight Full -Force
Grant-SmbShareAccess -Name "DIRECTOR" -AccountName "Grupo_DIRECTOR" -AccessRight Full -Force
Grant-SmbShareAccess -Name "Grupo_PROYECTO-1" -AccountName "Grupo_PROYECTO-1" -AccessRight Full -Force
Grant-SmbShareAccess -Name "Grupo_PROYECTO-2" -AccountName "Grupo_PROYECTO-2" -AccessRight Full -Force
Grant-SmbShareAccess -Name "Grupo_PROYECTO-3" -AccountName "Grupo_PROYECTO-3" -AccessRight Full -Force
Grant-SmbShareAccess -Name "Grupo_PROYECTO-4" -AccountName "Grupo_PROYECTO-4" -AccessRight Full -Force
Grant-SmbShareAccess -Name "CALIDAD" -AccountName "Grupo_CALIDAD" -AccessRight Full -Force
Grant-SmbShareAccess -Name "CONTABILIDAD" -AccountName "Grupo_CONTABILIDAD" -AccessRight Full -Force
Grant-SmbShareAccess -Name "DIRECCION" -AccountName "Grupo_DIRECCION" -AccessRight Full -Force
Grant-SmbShareAccess -Name "LOGISTICA" -AccountName "Grupo_LOGISTICA" -AccessRight Full -Force
Grant-SmbShareAccess -Name "PRESONAL" -AccountName "Grupo_PRESONAL" -AccessRight Full -Force
Grant-SmbShareAccess -Name "SUBIRECCION" -AccountName "Grupo_SUBIRECCION" -AccessRight Full -Force
#aqui tenemos un foreach para que añada todos los usuarios ha la publica y ha su privada
foreach ($User in $csv){

    $username =$User.NOMBRE
    $departament=$User.DEPARTAMENTO
    $prdesarrollo=$User.PRDESARROLLO

    #Compartimos las carpetas DE USUARIOS Y PUBLICA
        
        Remove-SmbShare -Name "Carpeta_$username" -force
        new-SmbShare -Name "Carpeta_$username" -path E:\FinalDomain\Privado\Carpeta_$username
        Grant-SmbShareAccess -Name "Carpeta_$username" -AccountName "$username" -AccessRight Full -Force
        Grant-SmbShareAccess -Name "Publica" -AccountName "$username" -AccessRight Read -Force
}

#agregacion de permisos ha los usuarios de sus carpetas
#foreach donde añadimos los icalcs para la seguridad de cada carpeta
foreach ($User in $csv){

    $username =$User.NOMBRE
    $departament=$User.DEPARTAMENTO
    $prdesarrollo=$User.PRDESARROLLO

    if ($departament -eq "SISTEMAS"){
    icacls "E:\FinalDomain" /grant "Grupo_$Departament"":(OI)(CI)(F)" 
    }elseif ($departament -eq "DESARROLLO"){
    icacls "E:\FinalDomain\Departamentos\DESARROLLO\$prdesarrollo" /grant "Grupo_$prdesarrollo"":(OI)(CI)(M)" 
    icacls "E:\FinalDomain\Publica" /grant "Grupo_$prdesarrollo"":(OI)(CI)(R)" 
    icacls "E:\FinalDomain\Privado\Carpeta_$username" /grant "$username"":(OI)(CI)(M)" 
    }else{
    icacls "E:\FinalDomain\Departamentos\$departament" /grant "Grupo_$departament"":(OI)(CI)(M)" 
    icacls "E:\FinalDomain\Publica" /grant "Grupo_$departament"":(OI)(CI)(R)" 
    icacls "E:\FinalDomain\Privado\Carpeta_$username" /grant "$username"":(OI)(CI)(M)"  
    }
}