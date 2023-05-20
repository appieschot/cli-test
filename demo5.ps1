m365 cli config set --key showSpinner --value $false
m365 login --authType identity --userName $env:M365_USER

$sites = m365 spo site classic list --t "REDIRECTSITE#0" --output json | ConvertFrom-Json

$sites | ForEach-Object {
  Write-Host -f Green "Processing redirect site: " $_.Url
  $siteUrl = $_.Url

  $redirectSite = Invoke-WebRequest -Uri $_.Url -MaximumRedirection 0 -SkipHttpErrorCheck
  $body = $null
  $siteUrl = $_.Url

  if($redirectSite.StatusCode -eq 308) {
    Try {
      [string]$newUrl = $redirectSite.Headers.Location;
      Write-Host -f Green " Redirects to: " $newUrl
      $body = Invoke-WebRequest -Uri $newUrl -SkipHttpErrorCheck
    }
    Catch{
        Write-Host $_.Exception
    }
    Finally {
      If($body.StatusCode -eq "200"){
        Write-host -f Yellow "  Target location still exists"
      }
      If($body.StatusCode -eq "404"){
        Write-Host -f Red "  Target location no longer exists, should be removed"
      }
    }
  }
}
