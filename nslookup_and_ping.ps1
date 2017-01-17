$InputFile = 'C:\Users\Username\Documents\IP_to_Names.txt'
$addresses = get-content $InputFile
$reader = New-Object IO.StreamReader $InputFile
    while($reader.ReadLine() -ne $null){ $TotalIPs++ }
write-host    ""    
write-Host "Performing NSLookUp..."    
        foreach($address in $addresses) {
            ## Progress bar
            $i++
            $percentdone = (($i / $TotalIPs) * 100)
            $percentdonerounded = "{0:N0}" -f $percentdone
            Write-Progress -Activity "Performing nslookups" -CurrentOperation "Working on IP: $address (IP $i of $TotalIPs)" -Status "$percentdonerounded% complete" -PercentComplete $percentdone
            ## End progress bar
            try {
                Resolve-DnsName -Name ($address) | Select NameHost,Name | Format-List
                }
                catch {
                    Write-host "$address was not found. $_" -ForegroundColor Green
                }
            }
write-host    ""            
write-Host "Pinging... please wait for reply."
        foreach($address in $addresses) {
            ## Progress bar
            $j++
            $percentdone2 = (($j / $TotalIPs) * 100)
            $percentdonerounded2 = "{0:N0}" -f $percentdone2
            Write-Progress -Activity "Performing pings" -CurrentOperation "Pinging IP: $address (IP $j of $TotalIPs)" -Status "$percentdonerounded2% complete" -PercentComplete $percentdone2
            ## End progress bar
                if (test-Connection -ComputerName $address -Count 2 -Quiet ) {  
                    write-Host "$address responded" -ForegroundColor Green 
                   } else 
                    { Write-Warning "$address does not respond to pings"              
                    }  
        }
write-host    ""       
write-host "Done!"
