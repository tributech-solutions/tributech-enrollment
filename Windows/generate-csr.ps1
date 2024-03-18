#Requires -Version 5.1

<#
.SYNOPSIS
	Generate a certificate signing request (CSR) for Agent Enrollment (Tributech/Demeter).
.DESCRIPTION
	!!! EVERY EXECUTION will create new private enrollment.key !!!

	Requirements:
	- openssl (available in the system's PATH)

    This script is used to create a private key and a certificate signing request (CSR) for enrollment.
After executing the script, copy the content of the enrollment.csr file and paste it into the enrollment web-form.

	The script creates the following files:
	- enrollment.key: The private key.
	- enrollment.csr: The certificate signing request (CSR).
	- enrollment.cnf: The configuration file for the certificate signing request (CSR).
	The script does not delete the created files. It is the responsibility of the user to delete the files after use.

	
	Usage: [-h] [-j] [-p]
		-h: Show help
		-j: Additonionally output CSR as json string
		-p: Additonionally print the CSR also to the console

.PARAMETER -h, --help
    Show this help text.
.PARAMETER -j, --JSON
	Output the certificate signing request (CSR) as a JSON string.
.PARAMETER -p, --Print
	Print the certificate signing request (CSR) to the console.
.EXAMPLE
	.\enrollment.ps1

	Generates a private key and a certificate signing request (CSR) for enrollment.
	Upload the certificate signing request (CSR) file content (enrollment.csr) to the enrollment web-form.

	.\enrollment.ps1 -p

	Same as the previous example, but also prints the certificate signing request (CSR) to the console too.

	.\enrollment.ps1 -j

	Same as the base example, but also prints the certificate signing request (CSR) in a json compatible string to the console too.
.NOTES
	File Name      : generate-csr.ps1
	Author         : Tributech Solutions GmbH
	Prerequisite   : PowerShell 5.1 or later
	Copyright (c) 2024 Tributech Solutions GmbH
	License        : Apache License 2.0 (see LICENSE.txt or https://www.apache.org/licenses/LICENSE-2.0)
	Version:		0.1
	Demeterversion: 4.0

	Licensed to the Apache Software Foundation (ASF) under one
	or more contributor license agreements. See the NOTICE file
	distributed with this work for additional information
	regarding copyright ownership. The ASF licenses this file
	to you under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing,
	software distributed under the License is distributed on an
	"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
	either express or implied. See the License for the specific
	language governing permissions and limitations under the License.
#>

param (
    [switch]$h,
    [switch]$j,
    [switch]$p
)

# Set variables
$ENROLLMENT_KEY_FILE = "enrollment.key"
$ENROLLMENT_CSR_FILE = "enrollment.csr"
$ENROLLMENT_CONFIG_FILE = "enrollment.cnf"

# Create the enrollment config file
@"
[ req ]
prompt              = no
default_bits        = 2048
distinguished_name  = req_distinguished_name
req_extensions      = req_ext

[ req_distinguished_name ]
countryName         = AT
stateOrProvinceName = Upper Austria
localityName        = Linz
organizationName    = custom
commonName          = enrollment-cert-custom

[ req_ext ]
basicConstraints    = critical, CA:FALSE, pathlen:0
keyUsage            = digitalSignature, keyEncipherment
extendedKeyUsage    = clientAuth
"@ | Out-File -FilePath $ENROLLMENT_CONFIG_FILE -Encoding utf8


if ($h) {
	Get-Help $MyInvocation.InvocationName
    exit 0
}

# Check if openssl is available
if (-not (Get-Command "openssl" -ErrorAction SilentlyContinue)) {
    Write-Host "openssl could not be found"
    exit 1
}

# Generate the private key
openssl genrsa -out $ENROLLMENT_KEY_FILE 2048

if (-not (Test-Path -Path $ENROLLMENT_KEY_FILE)) {
    Write-Host "Failed to create openssl private key file: $ENROLLMENT_KEY_FILE"
    exit 1
} else {
    Write-Host "Created openssl private key file: $ENROLLMENT_KEY_FILE"
}

# Generate the certificate signing request
openssl req -new -key $ENROLLMENT_KEY_FILE -out $ENROLLMENT_CSR_FILE -config $ENROLLMENT_CONFIG_FILE

if (-not (Test-Path -Path $ENROLLMENT_CSR_FILE)) {
	Write-Host "Failed to create openssl certificate signing request file: $ENROLLMENT_CSR_FILE"
	exit 1
} else {
	Write-Host "Created openssl certificate signing request file: $ENROLLMENT_CSR_FILE"
}

# Print the CSR to the console
if ($p) {
	Get-Content -Path $ENROLLMENT_CSR_FILE
}

# Output the CSR as a JSON string
if ($j) {
	$csr = Get-Content -Path $ENROLLMENT_CSR_FILE
	$nlCsr = $csr -replace "`r?`n", "\\n"
	Write-Host $nlCsr
}
