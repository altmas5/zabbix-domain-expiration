zabbix-domain-expiration
========================

Simple zabbix check for domain validity  
Based on https://github.com/kulpin74/zabbix-ssl

### Configuration

* Import the xml template to your zabbix server.
* Copy bash script to your externalscripts directory on the zabbix server.
* Make the script executable.
* Add the Template to an existing host with a domain name you want to monitor or add a new host with that domain name.

"www" subdomains are removed by the script before checking validity.

Reinvent the wheel? No, I find more easy to manage new hosts from zabbix Web GUI instead of adding them to a json file for LDD. 
