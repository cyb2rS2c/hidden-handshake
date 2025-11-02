<#
.SYNOPSIS
  Displays all saved Wi-Fi profiles and their stored keys (passwords) in a table.

.AUTHOR
  cyb2rS2c

.DESCRIPTION
  Uses the built-in 'netsh wlan' command to list saved Wi-Fi profiles
  and extract their stored passwords (Key Content). Outputs results
  in a formatted table for clarity.
#>

# Get all saved Wi-Fi profiles
$profiles = netsh wlan show profiles |
            Select-String "All User Profile" |
            ForEach-Object { $_.ToString().Split(":")[1].Trim() } |
            Sort-Object -Unique

if (-not $profiles) {
    Write-Host "No Wi-Fi profiles found." -ForegroundColor Yellow
    return
}

# Collect results
$results = @()

foreach ($profile in $profiles) {
    try {
        $keyLine = netsh wlan show profile name="$profile" key=clear 2>$null |
                   Select-String "Key Content" -SimpleMatch

        if ($keyLine) {
            $key = ($keyLine.ToString().Split(":", 2)[1]).Trim()
            if (-not $key) { $key = '(empty)' }
        } else {
            $key = '(no key stored / not accessible)'
        }
    } catch {
        $key = "(error querying profile)"
    }

    $results += [PSCustomObject]@{
        Profile = $profile
        Key     = $key
    }
}

# Output results in table format
Write-Host ""
Write-Host "📶 Saved Wi-Fi Profiles (by cyb2rS2c)" -ForegroundColor Cyan
Write-Host "------------------------------------"
$results | Format-Table Profile, Key -AutoSize
