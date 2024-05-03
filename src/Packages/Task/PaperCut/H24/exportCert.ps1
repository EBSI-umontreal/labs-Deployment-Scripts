cd cert:\LocalMachine\TrustedPublisher
$cert = dir | where { $_.Subject -like "*PaperCut*" }
$type = [System.Security.Cryptography.X509Certificates.X509ContentType]::Cert
$bytes = $cert.Export($type)
[System.IO.File]::WriteAllBytes("C:\PaperCut.cer", $bytes)