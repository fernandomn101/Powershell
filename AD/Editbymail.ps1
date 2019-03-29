cls
cd $PSScriptRoot

$csv = Import-Csv .\emails.csv -Delimiter ';' -Encoding UTF8

function obtenergrupo($email){
        $filtro = "mail -eq `"$email`""
        $gdevuelto = get-adgroup -filter $filtro -Properties mail,info
        return $gdevuelto
}

foreach ($fila in $csv){

   
        $grupo = obtenergrupo -email $fila
        
        if($grupo -ne $null){
           
            $texto = ("Primary Owner - "+$fila.'Primary Owner'+" `nSecondary Owner - "+$fila.'Secondary Owner')
           
            Write-Host ("-------$fila-------")
            Write-Host ($texto)
            Write-Host ("-------------------")
            
            $loguer = ($grupo.mail+","+$grupo.info)

            Set-ADGroup -Identity $grupo -Replace @{info = $texto}

        }else{
            Write-Host("No existe el grupo o el email no es correcto "+$fila) -ForegroundColor Yellow
        }
    }
}