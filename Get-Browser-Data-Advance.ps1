function Get-BrowserData {
    [CmdletBinding()]
    param (	
        [Parameter (Position=1,Mandatory = $True)]
        [ValidateSet("chrome", "edge", "firefox", "ie", "safari")]
        [string]$Browser,    
        [Parameter (Position=2,Mandatory = $True)]
        [ValidateSet("history", "bookmarks")]
        [string]$DataType 
    ) 

    $Regex = '(http|https)://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)*?'

    switch($Browser) {
        "chrome" {
            switch($DataType) {
                "history" {
                    $Path = "$Env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\History"
                }
                "bookmarks" {
                    $Path = "$Env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Bookmarks"
                }
            }
        }
        "edge" {
            switch($DataType) {
                "history" {
                    $Path = "$Env:USERPROFILE\AppData\Local\Microsoft\Edge\User Data\Default\History"
                }
                "bookmarks" {
                    $Path = "$env:USERPROFILE/AppData/Local/Microsoft/Edge/User Data/Default/Bookmarks"
                }
            }
        }
        "firefox" {
            switch($DataType) {
                "history" {
                    $Path = "$Env:USERPROFILE\AppData\Roaming\Mozilla\Firefox\Profiles\*.default-release\places.sqlite"
                }
                "bookmarks" {
                    $Path = "$Env:USERPROFILE\AppData\Roaming\Mozilla\Firefox\Profiles\*.default-release\bookmarks.html"
                }
            }
        }
        "ie" {
            switch($DataType) {
                "history" {
                    $Path = "$Env:USERPROFILE\AppData\Local\Microsoft\Internet Explorer\History"
                }
                "bookmarks" {
                    $Path = "$Env:USERPROFILE\Favorites"
                }
            }
        }
        "safari" {
            switch($DataType) {
                "history" {
                    $Path = "$Env:USERPROFILE\Library\Safari\History.plist"
                }
                "bookmarks" {
                    $Path = "$Env:USERPROFILE\Library\Safari\Bookmarks.plist"
                }
            }
        }
    }

    if (Test-Path -Path $Path) {
        try {
            $Value = Get-Content -Path $Path | Select-String -AllMatches $Regex |% {($_.Matches).Value} |Sort -Unique
            $Value | ForEach-Object {
                $Key = $_
                New-Object -TypeName PSObject -Property @{
                    User = $env:UserName
                    Browser = $Browser
                    DataType = $DataType
                    Data = $_
