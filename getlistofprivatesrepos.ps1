# Replace 'YOUR_GITHUB_TOKEN' with your actual token
$token = ""
$headers = @{
    Authorization = "token $token"
}

# API endpoint to list repositories
$url = "https://api.github.com/user/repos?visibility=private"

# Fetch the list of private repositories
$response = Invoke-RestMethod -Uri $url -Method Get -Headers $headers

# Output the names of the private repositories
$response | ForEach-Object { $_.name }
