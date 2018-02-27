
## Steps to do after Installation

### Task 1: Log in to SSH ( 8:00 am)

### Task 1: Disable Bitnami Banner
$ sudo /opt/bitnami/apps/edx/bnconfig --disable_banner 1

Note: Without Restarting the server , bitnami banner image will be removed.

sudo /opt/bitnami/apps/edx/bnconfig --machine_hostname spinta.in

sudo mv /opt/bitnami/apps/edx/bnconfig /opt/bitnami/apps/edx/bnconfig.back

Reference:https://docs.bitnami.com/general/apps/edx/

#### Milestone #1: Successfully we have mapped machine hostname and removed Bitnami Banner

### Task 2: Configurration

### Task 2.1: Initialize git and commit default configurations
*  git init
*  git add cms.auth.json cms.env.json lms.env.json lms.auth.json httpd-cms.conf httpd-lms.conf
*  git commit -m "1st commit - default version"


### Task 2.2: Apply our configurations
*  git clone https://github.com/nareshkumar-h/edx-conf-scripts.git
*  cp edx-conf-scripts/*.sh conf/
*  cp edx-conf-scripts/*.json conf/
*  apt-get install jq
