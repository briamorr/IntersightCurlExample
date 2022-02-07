# Intersight Curl Example
Examples of using Intersight API with curl and bash shell scripts

Usage: ./script.sh 'API Key ID' 'API Secretkey Filename' 'HTTP method [GET/POST/DELETE]' 'API Endpoint' 'Payload [Required only for POST]'

Example GET: ./inter.sh '1111/2222/3333' 'SecretKey.txt' 'GET' '/api/v1/compute/PhysicalSummaries?\$top=1&\$select=Serial'

Example DELETE: ./inter.sh '1111/2222/3333' 'SecretKey.txt' 'DELETE' '/api/v1/vnic/LanConnectivityPolicies/60bfd0964fa6a1d629e66eb6'

Example POST: ./inter.sh '1111/2222/3333' 'SecretKey.txt' 'POST' '/api/v1/ntp/Policies' '{"Organization":{"ObjectType":"organization.Organization","Moid":"5ddea34a6972652d3353b462"},"Name":"myNtpPolicy","Enabled":true,"NtpServers":["1.1.1.1"]}'
