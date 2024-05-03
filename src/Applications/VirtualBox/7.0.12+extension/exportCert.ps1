cd cert:\LocalMachine\TrustedPublisher
$cert = dir | where { $_.Subject -like "*Oracle*" }
$type = [System.Security.Cryptography.X509Certificates.X509ContentType]::Cert
$bytes = $cert.Export($type)
[System.IO.File]::WriteAllBytes("C:\Oracle.cer", $bytes)