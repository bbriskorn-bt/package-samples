# CreateUser task implementation
# Hash table $ask.Outputs is used to set values of task outputs

param (
    $UserName,
    $Email
)

Write-Host "CreateUser: name='$UserName' email='$Email'."

# Set each task output individually
$ark.Outputs.Status = 0 # using direct property assignment on hashtable
$ark.Outputs.Alias = $UserName
$ark.Outputs['Display'] = "User $UserName" # using indexer on hashtable
$ark.Outputs.Emails = @('email1@example.com', $Email) # store array in a hashtable
