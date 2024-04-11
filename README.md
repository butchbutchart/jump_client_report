# Remote Support Jump_Client_Report v1

We can use the API client to query the jump clients that you have deployed and export the data so it is more easy to manipulate than in the GUI.

You download the API client, and can give it a short command to list your jump clients, this just requires the use of the configuration API

**btapi --env-file vars.txt list jump-client**

"--env-file vars.txt" references a text file in the same folder that has your API credentials in, it should look like the below with your variables edited in


BT_CLIENT_ID=[ID]

BT_CLIENT_SECRET=[secret]

BT_API_HOST=[name].beyondtrustcloud.com


This gives you a point in time snapshot of the jump client situation, to track changes you may want to regularly run this script to compare output files

The output of a single record looks like the below, I've written the script to only print certain values, you may decide to add others from the what is available that you deem useful.


  {
    "id": 63,
    "jump_group_id": 6,
    "name": "DESKTOP-KT0FNE1",
    "tag": "",
    "public_site_address": "something.beyondtrustcloud.com",
    "comments": "",
    "jump_policy_id": null,
    "needs_update": false,
    "install_mode": "service",
    "is_quiet": false,
    "connection_type": "active",
    "last_connect_timestamp": "2024-04-05 16:29:25",
    "last_disconnect_timestamp": "2024-04-05 17:01:26",
    "fqdn": "DESKTOP-KT0FNE1",
    "unavailable_reason": "none",
    "operating_system": "Windows 10 Enterprise (20H2)",
    "public_ip": "xxx",
    "private_ip": "10.2.0.103",
    "console_user": "chris",
    "expiration_timestamp": null,
    "is_lost": false,
    "jump_group_type": "personal",
    "customer_client_start_mode": "normal",
    "hostname": "DESKTOP-KT0FNE1",
    "max_offline_minutes": 0,
    "last_access_timestamp": "2024-02-28 15:27:10",
    "unattended_session_policy_id": null,
    "attended_session_policy_id": null
  }
