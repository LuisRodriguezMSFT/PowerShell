# Set the host to ping and the number of failed ping attempts before starting a trace
$pinghost = "www.google.com"
$failedPingThreshold = 3

# Set the trace file name and the maximum trace file size (in MB)
#$traceFile = "C:\tools\trace.etl"
#$traceFileSize = 20

# Initialize a counter for the number of failed ping attempts
$failedPings = 0

# Continuously ping the specified host
while ($true) {
    $pingResult = Test-Connection $pinghost -Count 1 -Quiet

    # If the ping fails, increment the failed ping counter
    if (!$pingResult) {
        $failedPings++
    } else {
        # If the ping succeeds, reset the failed ping counter
        $failedPings = 0
    }

    # If the number of failed pings exceeds the threshold, start the trace
    if ($failedPings -ge $failedPingThreshold) {
        netsh trace start capture=yes tracefile=C:\tools\trace.etl maxsize=100

        # Write a message to the console indicating that the trace has started
        "Trace started"
    }

    # Wait for 1 second before pinging again
    Start-Sleep -Seconds 1
}
