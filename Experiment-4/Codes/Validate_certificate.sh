#!/bin/bash

echo "========================================"
echo "   X.509 Certificate Validation Tool"
echo "========================================"

CERT="certificate.crt"
KEY="tanish.key"

echo
echo "[1] Checking certificate file..."
if [ -f "$CERT" ]; then
    echo "[+] Certificate file found"
else
    echo "[-] Certificate file not found"
    exit 1
fi

echo
echo "[2] Checking private key..."
if [ -f "$KEY" ]; then
    echo "[+] Private key found"
else
    echo "[-] Private key not found"
    exit 1
fi

echo
echo "[3] Checking certificate validity..."
if openssl x509 -in "$CERT" -noout -checkend 0 2>/dev/null; then
    echo "[+] Certificate is currently valid"
else
    echo "[-] Certificate has expired"
fi

echo
echo "[4] Checking self-signed status..."
ISSUER=$(openssl x509 -in "$CERT" -noout -issuer | sed 's/^issuer=//')
SUBJECT=$(openssl x509 -in "$CERT" -noout -subject | sed 's/^subject=//')

if [ "$ISSUER" = "$SUBJECT" ]; then
    echo "[+] Self-signed certificate confirmed"
else
    echo "[-] Certificate is not self-signed"
fi

echo
echo "[5] Checking CA constraint..."
if openssl x509 -in "$CERT" -noout -text | grep -q "CA:FALSE"; then
    echo "[+] CA:FALSE confirmed"
else
    echo "[-] CA:FALSE not found"
fi

echo
echo "[6] Checking Subject Alternative Name..."
if openssl x509 -in "$CERT" -noout -text | grep -q "DNS:localhost"; then
    echo "[+] SAN: localhost confirmed"
else
    echo "[-] SAN: localhost not found"
fi

echo
echo "[7] Checking private key and certificate match..."

KEY_HASH=$(openssl pkey -in "$KEY" -pubout -outform DER 2>/dev/null | openssl dgst -sha256 | awk '{print $2}')

CERT_HASH=$(openssl x509 -in "$CERT" -pubkey -noout | openssl pkey -pubin -outform DER 2>/dev/null | openssl dgst -sha256 | awk '{print $2}')

if [ "$KEY_HASH" = "$CERT_HASH" ]; then
    echo "[+] Private key and certificate match"
else
    echo "[-] Private key and certificate do not match"
fi

echo
echo "========================================"
echo "   Certificate validation completed"
echo "========================================"
