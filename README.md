noip
====

Noip - Update your no-ip hostname ip using a shell script.

If you use www.no-ip.com to host a server at home behind a rooter who get a dynamic ip for your telecom operator, and for some reason your rooter doesn’t support any dyn dns provider, or like me never update your ip (TP-Link) this script is for you.

noip.sh simply compare you public ip with your dyn dns ip, it they are different noip.sh will update your ip using www.no-ip.com Rest API.

Exemple of a cron running the script every 5 minutes :
```shell
*/5 * * * * /bin/bash /usr/local/scripts/noip.sh >> /var/log/noip.log
```
