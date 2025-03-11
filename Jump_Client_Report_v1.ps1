$tokenUrl = "https://URL.beyondtrustcloud.com/oauth2/token";
$baseUrl = "https://URL.beyondtrustcloud.com/api/config/v1"
$client_id = "--";
$secret = "--";
$exportpath = "jumpclients.csv"

#endregion creds
###########################################################################

#region Authent 
###########################################################################

# Step 1. Create a client_id:secret pair
$credPair = "$($client_id):$($secret)"
# Step 2. Encode the pair to Base64 string
$encodedCredentials = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($credPair))
# Step 3. Form the header and add the Authorization attribute to it
$headersCred = @{ Authorization = "Basic $encodedCredentials" }
# Step 4. Make the request and get the token
$responsetoken = Invoke-RestMethod -Uri "$tokenUrl" -Method Post -Body "grant_type=client_credentials" -Headers $headersCred
$token = $responsetoken.access_token
$headersToken = @{ Authorization = "Bearer $token" }
# Step 5. Prepare the header for future request
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Accept", "application/json")
$headers.Add("Authorization", "Bearer $token")
#endregion
###########################################################################



# Invoke the REST method to get the list of group policies
$jumpclients = Invoke-RestMethod "$baseUrl/jump-client" -Method 'GET' -Headers $headers




$jumpclients | Select-Object id, jump_group_id, name, tag, public_site_address, comments, jump_policy_id, 
needs_update, install_mode, is_quiet, connection_type, last_connect_timestamp, last_disconnect_timestamp, 
fqdn, unavailable_reason, operating_system, public_ip, private_ip, console_user, expiration_timestamp, 
is_lost, jump_group_type, customer_client_start_mode, hostname, max_offline_minutes, last_access_timestamp, 
jumpoint_proxy, unattended_session_policy_id, attended_session_policy_id |
Export-Csv -Path $exportpath -NoTypeInformation

Write-Output "CSV exported to: $exportpath"



