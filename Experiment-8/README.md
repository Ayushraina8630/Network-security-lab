# Experiment 8: Send and Receive OpenPGP-Protected Email Using Thunderbird

## Aim

Configure OpenPGP in Mozilla Thunderbird and verify how encryption and digital signatures protect email communication.

## Learning objectives

- Create an OpenPGP key pair for a test email identity.
- Distinguish the role of a public key from that of its matching private key.
- Exchange public keys and confirm a key fingerprint using a separate trusted channel.
- Send a message that is encrypted for its recipient and signed by its sender.
- Decrypt a received message and inspect its signature status.
- Optionally test the same protections with a non-sensitive attachment.

## Requirements

- Mozilla Thunderbird with its built-in OpenPGP support
- Two test email identities that can exchange messages
- A partner who can generate and exchange an OpenPGP public key
- A separate trusted channel for comparing key fingerprints

Use test identities and non-sensitive sample content. Do not publish private keys, account passwords, recovery codes, or real personal correspondence.

## Background

OpenPGP uses a key pair for each participant. A public key can be shared: senders use the recipient's public key to encrypt a message, and recipients use their corresponding private key to decrypt it. A sender can also sign a message with their private key; recipients use the sender's public key to check the signature.

A fingerprint is a compact identifier for a public key. Compare it with the key owner over a separate trusted channel before relying on that key. Receiving a key by email alone does not establish that it belongs to the person it claims to represent.

Encryption and signing provide different checks: encryption limits who can read the message, while a valid signature helps the recipient verify its origin and detect changes. Neither protects an account whose credentials or private key have been exposed.

## Procedure

### 1. Prepare Thunderbird

Set up the two test email identities in Thunderbird. If the application offers a primary-password setting, configure it to help protect locally stored credentials and key material. Keep the password private and do not include it in screenshots or repository files.

### 2. Create an OpenPGP key pair

For the test identity, open Thunderbird's account or OpenPGP key-management settings and create a personal key. Record the displayed fingerprint and expiration information for the lab notes. The exact menu labels may vary by Thunderbird version.

### 3. Protect and back up the private key

Review the application's private-key backup or export option and store any backup in a protected location outside the project repository. Never attach a private-key export to an email or commit it to source control. The public key, by contrast, is intended to be shared.

### 4. Exchange public keys

Exchange only the public keys with the partner. Import the received public key into Thunderbird and inspect its identity and fingerprint. Before trusting or using it, compare the fingerprint with the partner through a separate trusted channel.

### 5. Send an encrypted and signed message

Compose a short test message addressed to the partner. Select the recipient's verified public key for encryption and enable the sender's digital signature. Send the message only after confirming that Thunderbird indicates both protections are enabled.

### 6. Receive and verify

Have the partner reply with a message addressed to the test identity, encrypted for its public key and signed with the partner's private key. Open it in Thunderbird. Confirm that the message can be decrypted and inspect the security details for the signature result. A signature is meaningful only if it validates and the signing key has been independently verified.

### 7. Optional attachment check

Repeat the exchange with a harmless sample file. Verify that the recipient can open the attachment after decrypting the message. Use only disposable test data; do not send confidential files for this exercise.

## Expected observations

- Each identity has a public/private key pair and a visible fingerprint.
- A recipient can read a message encrypted to their public key after decrypting it with their private key.
- A valid signature is reported separately from the encryption status.
- A public key's fingerprint can be checked independently before accepting it.

## Evidence and cleanup

Record the Thunderbird version, test steps, and observations. If screenshots are required, capture only non-sensitive test accounts and redact addresses or other personal data as appropriate. Do not include passwords, private-key exports, recovery information, or actual email contents in this repository. Remove test messages and temporary key material according to the lab environment's retention rules.

## Conclusion

This experiment demonstrates the separate roles of OpenPGP encryption, signatures, and fingerprint verification in email. Secure handling of the private key and independent verification of public keys are essential to interpreting the results correctly.
