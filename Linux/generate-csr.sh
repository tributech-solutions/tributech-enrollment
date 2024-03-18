#!/usr/bin/env bash

# Generate Enrollment Certificate Signing Request (CSR) for Tributech Node
#
# This script is used to create a private key and a certificate signing request (CSR) for enrollment. 
#
# Author: Tributech Solutions GmbH
# Copyright (c) 2024 Tributech Solutions GmbH
# License: Apache License 2.0 (see LICENSE.txt or https://www.apache.org/licenses/LICENSE-2.0)
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. The ASF licenses this file
# to you under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific
# language governing permissions and limitations under the License.
#

ENROLLMENT_KEY_FILE="enrollment.key"
ENROLLMENT_CSR_FILE="enrollment.csr"
ENROLLMENT_CONFIG_FILE="enrollment.cnf"

cat << EOF > $ENROLLMENT_CONFIG_FILE
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
EOF

FLAG_J=false
FLAG_P=false

while getopts ":hjp" opt; do
    case "$opt" in
        h)
			echo "$(basename "$0") Generate CSR"
            echo ""
			echo "Script Version        : 0.1.0"
	        echo "Tributech Node Version: 4.0.x"
            echo ""
			echo "!!! EVERY EXECUTION will create new private enrollment.key !!!"
			echo ""
			echo "Requirements:"
			echo "  - openssl"
			echo ""
			echo "This script is used to create a private key and a certificate signing request (CSR) for enrollment.
After executing the script, copy the content of the enrollment.csr file and paste it into the enrollment web-form."
			echo ""
			echo "The script creates the following files:"
			echo "  - enrollment.key: The private key"
			echo "  - enrollment.csr: The certificate signing request"
			echo "  - enrollment.cnf: The openssl configuration file"
			echo "The script does not delete the created files. It is the responsibility of the user to delete the files after use."

			echo ""
            echo "Usage: $(basename "$0") [-h] [-j] [-p]"
            echo "  -h: Show help"
            echo "  -j: Additonionally output CSR as json string"
			echo "  -p: Additonionally print the CSR also to the console"
            exit 0
            ;;
        j)
            FLAG_J=true
            ;;
		p)
			FLAG_P=true
            ;;
        \?)
            # Invalid option
            echo "Invalid option: -$OPTARG"
            exit 1
            ;;
    esac
done

if ! command -v openssl 2>/dev/null
then
    echo "openssl could not be found"
    exit 1
fi

if [ ! -f "$ENROLLMENT_CONFIG_FILE" ]; then
    echo "Failed to create openssl config file $ENROLLMENT_CONFIG_FILE"
    exit 1
fi

# Generate the private key
openssl genrsa -out $ENROLLMENT_KEY_FILE 2048

if [ ! -f "$ENROLLMENT_KEY_FILE" ]; then
    echo "Failed to create private key file $ENROLLMENT_KEY_FILE"
    exit 1
else
    echo "Private key ($ENROLLMENT_KEY_FILE) generated successfully."
fi

echo "Creating the certificate signing request (CSR)..."
openssl req -new -nodes -out "$ENROLLMENT_CSR_FILE" -sha256 -key "$ENROLLMENT_KEY_FILE" -config "$ENROLLMENT_CONFIG_FILE"


if [ ! -f "$ENROLLMENT_CSR_FILE" ]; then
    echo "Failed to create CSR file $ENROLLMENT_CSR_FILE"
    exit 1
else 
    echo "CSR ($ENROLLMENT_CSR_FILE) generated successfully."
fi

echo "Upload the Certificate Signing Request file ($ENROLLMENT_CSR_FILE) to receive your Enrollment Certificate."

if $FLAG_P; then 
	echo "CSR: "
	cat $ENROLLMENT_CSR_FILE
fi

if $FLAG_J; then 
    if ! command -v sed 2>/dev/null
    then
        echo "sed could not be found"
        exit 1
    fi
	echo "CSR JSON:"
	cat $ENROLLMENT_CSR_FILE | sed ':a;N;$!ba;s/\n/\\n/g'
fi
