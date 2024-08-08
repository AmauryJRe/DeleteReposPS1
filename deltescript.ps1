# Replace 'YOUR_GITHUB_TOKEN' with your actual token
$token = ""
$headers = @{
    Authorization = "token $token"
}
$filePath = "list.txt"
# List of repositories to delete
$repos = Get-Content $filePath

foreach ($repo in $repos) {
    $url = "https://api.github.com/repos/user/$repo"
    Invoke-RestMethod -Uri $url -Method Delete -Headers $headers
    Write-Output "Deleted repository: $repo"
}
