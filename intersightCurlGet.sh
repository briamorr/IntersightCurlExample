#!/bin/bash
#Intersight CURL GET example

#Instructions:
#Substitute apiKey value with APIkey from Intersight
#Substitute SecretKey.txt file location with API secret key file from Intersight

#Details:
#apibodyDigest is SHA-256 digest of the payload, in the case of a GET request null
#apiEndpoint is the endpoint URL in lower case, must be in lower case...
#apiTime is RFC1123 time
#apiSignaure is the headers in a sha256 digest signed by the secretkey file and converted to base 64

apibodyDigest="digest: SHA-256="$(printf '' | openssl dgst -sha256 -binary | base64)
apiKey='xxx/yyy/zzz'
apiEndpoint='/api/v1/compute/physicalsummaries?$top=1&$select=serial'
apiTime="date: "$(date -u '+%a, %d %b %Y %T %Z')
apiSignature=$(
printf "(request-target): get %s
%s
%s
host: intersight.com" "$apiEndpoint" "$apiTime" "$apibodyDigest" | openssl dgst -sha256 -binary -sign SecretKey.txt | base64 -w 0)

curl 'https://www.intersight.com/api/v1/compute/PhysicalSummaries?$top=1&$select=Serial' -H 'Accept: "application/json"' -H 'Host: intersight.com' -H "$apiTime" -H "$apibodyDigest" -H 'Authorization: Signature keyId="'"$apiKey"'",algorithm="rsa-sha256",headers="(request-target) date digest host",signature="'"$apiSignature"'"'
