# example use this command=⟩ speak "your message"
function speak {

[CmdletBinding()]
param (	
[Parameter (Position=0,Mandatory = $True)]
[string]$Sentence
) 

$s=New-Object -ComObject SAPI.SpVoice
$s.Rate = -2
$s.Speak($Sentence)
}