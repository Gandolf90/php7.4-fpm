# php7.4-fpm
PHP 7.4 FPM Dockerfile

Ubuntu 18.04 PHP 7.4 FPM container image

Example overrides.conf 

```php
[global]
; Override default pid file
pid = /run/php-fpm.pid

; Avoid logs being sent to syslog
error_log = /proc/self/fd/2

; Set this to php default's max_execution_time to allow children to stop gracefully when fpm is commanded to stop
; This helps avoiding 502's
process_control_timeout = 30

; Do not daemonize (eg send process to the background)
daemonize = no

[www]
; Access from webserver container is via network, not socket file
listen = [::]:9000

; Redirect logs to stdout - FPM closes /dev/std* on startup
access.log = /proc/self/fd/2
catch_workers_output = yes

; Remove "pool www" decoration from log output (older phpdocker.io containers for php use sed for this)
decorate_workers_output = no

; Required to allow config-by-environment
clear_env = no
```