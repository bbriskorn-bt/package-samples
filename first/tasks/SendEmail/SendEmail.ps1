param (
    $ApiKey,
    $FromAddress,
    $ToAddress,
    $Subject,
    $Body
)

# Logging
Write-Host "SendEmail: apiKey='$ApiKey' from='$FromAddress' to='$ToAddress' subject='$Subject'."

# Invoke SendGrid API
$headers = @{
    "authorization" = "Bearer $ApiKey";
    "content-type" = "application/json"
}

$request = @{
    "personalizations" = @(
        @{
            "to" = @(
                @{ "email" = $ToAddress; "name" = $ToAddress }
            );
            "subject" = $Subject
        }
    );
    "from" = @{
        "email" = $FromAddress;
        "name" = $FromAddress
    };
    "content" = @(
        @{
            "type" = "text/html";
            "value" = $Body
        }
    )
}
$requestText = $request | ConvertTo-Json -Depth 10
$requestText | out-string
$response = Invoke-RestMethod -Uri "https://api.sendgrid.com/v3/mail/send" -Method Post -Headers $headers -Body $requestText

# Debug output
$response | fl

# Set each task output individually
if ($ark) {
    # TODO: Parse response from SendGrid and set task outputs
    $ark.Outputs.Response = '?'
}
