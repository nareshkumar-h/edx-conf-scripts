


# openedx-configuration

## Git Configuration
* ~/apps/edx/conf$  git config --global user.email "nareshkumarh@live.com"
* ~/apps/edx/conf$ git config --global user.name "Naresh Kumar H"


## Installation
* IP : 13.126.9.127
* http://university.spinsoft.in/

## Login Credentials
* Username: user@example.com
* Password: Uv4bBRSi


## Step 1: Disable Bitnami Banner
$ sudo /opt/bitnami/apps/edx/bnconfig --disable_banner 1      

Note: Without Restarting the server , bitnami banner image will be removed.

sudo /opt/bitnami/apps/edx/bnconfig --machine_hostname spinta.in

sudo mv /opt/bitnami/apps/edx/bnconfig /opt/bitnami/apps/edx/bnconfig.back

Reference:https://docs.bitnami.com/general/apps/edx/

## Step 2: Change Platform Name [ Create a branch - task1-change-platform-name ]
* cms.env.json [ "PLATFORM_NAME": "Spinsoft University"]
* lms.env.json [ "PLATFORM_NAME": "Spinsoft University"]

Note: Restart Servers
* sudo /opt/bitnami/ctlscript.sh restart edx
* sudo /opt/bitnami/ctlscript.sh restart apache

  ## services
  
       /opt/bitnami/ctlscript.sh (start|stop|restart|status)
       
       /opt/bitnami/ctlscript.sh (start|stop|restart|status) mysql
       
       /opt/bitnami/ctlscript.sh (start|stop|restart|status) mongodb
       
       /opt/bitnami/ctlscript.sh (start|stop|restart|status) memcached
       
       /opt/bitnami/ctlscript.sh (start|stop|restart|status) apache
       
       /opt/bitnami/ctlscript.sh (start|stop|restart|status) elasticsearch
       
       /opt/bitnami/ctlscript.sh (start|stop|restart|status) xqueue
       
       /opt/bitnami/ctlscript.sh (start|stop|restart|status) edx
       
       /opt/bitnami/ctlscript.sh (start|stop|restart|status) rabbitmq

## Delete the default course
https://openedx.atlassian.net/wiki/spaces/OXA/pages/158194136/How+to+delete+a+course
* /opt/bitnami/apps/edx/edx-platform# python.edxapp ./manage.py lms dump_course_ids --settings aws

* python.edxapp ./manage.py cms --settings=aws delete_orphans course-v1:edX+DemoX+Demo_Course --commit


* python.edxapp ./manage.py cms --settings=aws delete_course course-v1:edX+DemoX+Demo_Course

## Compile Theme Assets
* sudo /opt/bitnami/apps/edx/bin/paver.edxapp update_assets cms --settings=aws

* sudo /opt/bitnami/apps/edx/bin/paver.edxapp update_assets lms --settings=aws
