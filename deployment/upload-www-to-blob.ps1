$ProgressPreference="SilentlyContinue"

$destinationUri = "https://$($Env:STORAGE_HOSTNAME)/www"
$destinationKey = $Env:STORAGE_KEY
.\deployment\AzCopy.exe /Source:.\test /Dest:$destinationUri /DestKey:$destinationKey

$storageContext = New-AzureStorageContext -ConnectionString $Env:STORAGE_CONNECTION
Set-AzureStorageContainerAcl -Container "www" -Permission Container -Context $storageContext

