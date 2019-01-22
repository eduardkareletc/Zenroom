#!/bin/sh


verbose=1

scenario="Generate credential request keypair"
echo $scenario
cat <<EOF | zenroom | tee alice.keys | json_pp
ZEN:begin($verbose)
ZEN:parse([[
Scenario 'credential_request_keygen': $scenario
		 Given that I am known as 'Alice'
		 When I create my new credential request keypair
		 Then print keypair 'Alice'
]])
ZEN:run()
EOF

scenario="Generate credential issuer keypair"
echo $scenario
cat <<EOF | zenroom | tee madhatter.keys | json_pp
ZEN:begin($verbose)
ZEN:parse([[
Scenario 'credential_issuer_keygen': $scenario
		 Given that I am known as 'MadHatter'
		 When I create my new credential issuer keypair
		 Then print keypair 'MadHatter'
]])
ZEN:run()
EOF

scenario="Generate credential issuer keypair"
echo $scenario
cat <<EOF | zenroom | tee cheshirecat.keys | json_pp
ZEN:begin($verbose)
ZEN:parse([[
Scenario 'credential_issuer_keygen': $scenario
		 Given that I am known as 'CheshireCat'
		 When I create my new credential issuer keypair
		 Then print keypair 'CheshireCat'
]])
ZEN:run()
EOF

scenario="Publish the credential issuer verification key"
echo $scenario
cat <<EOF | zenroom -k madhatter.keys | tee madhatter_verification.keys | json_pp
ZEN:begin($verbose)
ZEN:parse([[
Scenario 'credential_publish_issuer': $scenario
		 Given that I am known as 'MadHatter'
		 and I have my credential issuer keypair
		 When I remove the 'sign' key
		 Then print all keyring
]])
ZEN:run()
EOF

scenario="Request a credential blind signature"
echo $scenario
cat <<EOF | zenroom -k alice.keys | tee alice_blindsign_request.json | json_pp
ZEN:begin($verbose)
ZEN:parse([[
Scenario 'credential_request': $scenario
		 Given that I am known as 'Alice'
		 and I have my credential request keypair
		 When I declare that I am 'lost in Wonderland'
		 and I request a credential blind signature
		 Then print all data
]])
ZEN:run()
EOF

scenario="Issue a credential blind signature"
echo $scenario
cat <<EOF | zenroom -k madhatter.keys -a alice_blindsign_request.json | tee madhatter_signed_credential.json | json_pp
ZEN:begin($verbose)
ZEN:parse([[
Scenario 'credential_sign': $scenario
		 Given that I am known as 'MadHatter'
		 and I have my credential issuer keypair
		 When I am requested to sign a credential
		 and I verify the credential to be true
		 and I sign the credential 'MadHatter'
		 Then print data 'MadHatter'
]])
ZEN:run()
EOF

scenario="Receive the signature and publish the credential"
echo $scenario
cat <<EOF | zenroom -k alice.keys -a madhatter_signed_credential.json | tee alice_aggregated_credential.json | json_pp
ZEN:begin($verbose)
ZEN:parse([[
Scenario 'credential_publish': $scenario
		 Given that I am known as 'Alice'
		 and I have my credential request keypair
		 When I receive a credential signature 'MadHatter'
		 and I aggregate all signatures into my credential
		 Then print all data
]])
ZEN:run()
EOF

scenario="Generate a blind proof of the credentials"
echo $scenario
cat <<EOF | zenroom -k madhatter_verification.keys -a alice_aggregated_credential.json | tee alice_blindproof_credential.json | json_pp
ZEN:begin($verbose)
ZEN:parse([[
Scenario 'credential_blindproof': $scenario
		 Given that I use the verification key by 'MadHatter'
		 and that 'Alice' declares to be 'lost in Wonderland'
		 When I aggregate all the verification keys
		 and the declaration is proven by credentials
		 Then print data 'proof'
]])
ZEN:run()
EOF

scenario="Verify a blind proof of the credentials"
echo $scenario
cat <<EOF | zenroom -k madhatter_verification.keys -a alice_blindproof_credential.json
ZEN:begin($verbose)
ZEN:parse([[
Scenario 'blindproof_verify': $scenario
		 Given that I use the verification key by 'MadHatter'
		 and that I have a valid credential proof
		 When I aggregate all the verification keys
		 and the credential proof is verified correctly
		 Then print string 'OK'
]])
ZEN:run()
EOF
