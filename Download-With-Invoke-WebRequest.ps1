# Make sure your Link ends with file format for example (jpeg png rar zip mp4 mov mp3 you know what I mean)
# Prompt the user for the URL
$url = Read-Host -Prompt "Enter the URL: "

# Prompt the user for the output file name
$outfile = Read-Host -Prompt "Enter the name of the Output: "

# Send the request and save the response to the specified file
Invoke-WebRequest -Uri $url -OutFile $outfile

# Confirm that the file has been saved
Write-Host "File saved $outfile"
