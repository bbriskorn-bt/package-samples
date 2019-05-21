param ($message)

# Logging
Write-Host "Message: '$message'."

# Set outputs
if ($context) {
    $context.Outputs.Message = $message
}
