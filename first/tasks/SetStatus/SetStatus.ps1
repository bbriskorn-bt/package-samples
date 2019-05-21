# SetStatus task implementation

param (
    $UserName,
    $NewStatus
)

Write-Host "SetStatus: UserName='$UserName' NewStatus='$NewStatus'."

# Set each task output individually
$ark.Outputs.Ok = $true
$ark.Outputs.Status = $NewStatus
