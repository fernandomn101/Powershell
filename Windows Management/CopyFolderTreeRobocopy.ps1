##################################################
## Copy a complete folder tree in a Source path ##
##################################################

# Copy the folder tree under folders given,  
# Copy the each position of "$Source" array in the correspondient position in "$Destination" array

$Source      = @()
$Destination = @()

$Source      = @("C:\test_script\source\folder_1", "C:\test_script\source\folder_2")
$Destination = @("C:\test_script\destination\folder_1", "C:\test_script\destination\folder_2")
$i = 0

#OPTION 2 - FOR EACH LOOP

ForEach ($share in $Source){

ROBOCOPY  $share   $Destination[$i]  /COPYALL /LOG:C:\TEMP\LOG1.TXT  /E /XF *
$i += 1

}

#>


<#OPTION 1 - FOR LOOP

for ($i = 0 ; $i -lt $Source.Count ; $i++){

    ROBOCOPY $Source[$i] $Destination[$i] /COPYALL /LOG:C:\TEMP\LOG1.TXT  /E /XF *

}

#>

  
