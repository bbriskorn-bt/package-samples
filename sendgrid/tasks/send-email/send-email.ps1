param (
    $ApiKey,
    $FromAddress,
    $ToAddress,
    $Subject,
    $Body
)

# Logging
Write-Information "SendEmail: apiKey='$ApiKey' from='$FromAddress' to='$ToAddress' subject='$Subject'."

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

try {
    $response = Invoke-RestMethod -Uri "https://api.sendgrid.com/v3/mail/send" -Method Post -Headers $headers -Body $requestText
}
catch {
    Write-Host "Exception: $_"
}

# Debug output
$response | Format-List

# Set task outputs
if ($context) {
    # TODO: Parse response from SendGrid and set task outputs
    $context.Outputs.Response = '?'
}
