# openedx-sites
OpenEdx Sites

## Create Sites (http://52.66.186.208/admin/sites/site/)
This is equivalent to adding ip/admin/sites/site

```sql
select * from django_site;
```

```sql
insert into django_site ( domain, name)
values ( 'sa.university.spinsoft.in','S.A. Engineering College');
```

## Create two sites 
* S.A Engineering College
* Pallavan College of Engineering

## Create Route53 domain
* sa.spinsoft.in
* pallavan.spinsoft.in

## Insert script to add Sites:
```sql
INSERT INTO django_site ( domain, NAME)
VALUES ( 'pallavan.university.spinsoft.in','Pallavan College of Engineering');
```

## Create Site Configuration ( http://52.66.186.208/admin/site_configuration/siteconfiguration/3/)

JSON Value:
```javascript
{
  "course_email_from_addr":"csenaresh@gmail.com",
  "university":"Pallavan College of Engineering",
  "PLATFORM_NAME":"Pallavan College of Engineering",
  "email_from_address":"csenaresh@gmail.com",
  "payment_support_email":"csenaresh@gmail.com",
  "SITE_NAME":"pallavan.spinsoft.in",
  "site_domain":"pallavan.spinsoft.in",
  "SESSION_COOKIE_DOMAIN":"pallavan.spinsoft.in",
  "platform_name":"Pallavan College of Engineering",
  "course_org_filter":"PallavanX"
}
```

```sql
INSERT  INTO `site_configuration_siteconfiguration`(`values`,`site_id`,`enabled`) VALUES 

('{\"course_email_from_addr\":\"csenaresh@gmail.com\",\"university\":\"S.A Engineering College\",\"PLATFORM_NAME\":\"S.A Engineering College\",\"email_from_address\":\"csenaresh@gmail.com\",\"payment_support_email\":\"csenaresh@gmail.com\",\"SITE_NAME\":\"sa.university.spinsoft.in\",\"site_domain\":\"sa.university.spinsoft.in\",\"SESSION_COOKIE_DOMAIN\":\"university.spinsoft.in\"}',
(SELECT id FROM django_site WHERE domain ='sa.university.spinsoft.in'),1);

INSERT  INTO `site_configuration_siteconfiguration`(`values`,`site_id`,`enabled`) VALUES 

('{\"course_email_from_addr\":\"csenaresh@gmail.com\",\"university\":\"Pallavan College of Engineering\",\"PLATFORM_NAME\":\"Pallavan College of Engineering\",\"email_from_address\":\"csenaresh@gmail.com\",\"payment_support_email\":\"csenaresh@gmail.com\",\"SITE_NAME\":\"pallavan.university.spinsoft.in\",\"site_domain\":\"pallavan.university.spinsoft.in\",\"SESSION_COOKIE_DOMAIN\":\"university.spinsoft.in\"}',
(SELECT id FROM django_site WHERE domain ='pallavan.university.spinsoft.in'),1);
```

## Reference OpenEdx article:
http://edx.readthedocs.io/projects/edx-installing-configuring-and-running/en/latest/configuration/sites/configure_site.html

