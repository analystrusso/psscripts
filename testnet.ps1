$env:COMPUTERNAME = Read-Host "Please specify host"

echo "Testing connection to TCP 2701, 3389, and 6129."

# Run the Test-NetConnection commands and store the results in an array
$results = @(
  Test-NetConnection $env:COMPUTERNAME -Port 2701 -InformationLevel Detailed
  Test-NetConnection $env:COMPUTERNAME -Port 3389 -InformationLevel Detailed
  Test-NetConnection $env:COMPUTERNAME -Port 6129 -InformationLevel Detailed
)

# Format the combined results as a table
$results | Format-Table -AutoSize

# Resolve the hostname to any associated IP addresses and run a traceroute"
Resolve-DnsName $env:COMPUTERNAME | Format-Table -AutoSize
echo "Running traceroute to specified hostname."
Test-NetConnection -TraceRoute -ComputerName $env:COMPUTERNAME
  
