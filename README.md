# Powershell-NSlookup

Found an awesome script off of the RainingForks Tech Blog. The only issue was it did not use the correct syntax for NSLookUp queries in Powershell on Windows 8.1 and higher (this also means Windows 10). I modified it to run on Win10 as well as made some other changes.

The new syntax to do NSLookups in Powershell is "Resolve-DnsName".

    Parameter Set: Default  
    Resolve-DnsName [-Name] <String> [[-Type] <RecordType> ] [-CacheOnly] [-DnsOnly] [-DnssecCd] [-DnssecOk] [-LlmnrFallback] [-LlmnrNetbiosOnly] [-LlmnrOnly] [-NetbiosFallback] [-NoHostsFile] [-NoIdn] [-NoRecursion] [-QuickTimeout] [-Server <String[]> ] [-TcpOnly] [ <CommonParameters>]
    
As per [TechNet](https://technet.microsoft.com/en-us/library/jj590781(v=wps.630).aspx):  
> The Resolve-DnsName cmdlet performs a DNS query for the specified name. This cmdlet is functionally similar to the nslookup tool which allows users to query for names.
>> Note: The Resolve-DnsName cmdlet will return a maximum of 25 A and AAAA records from NS servers.
