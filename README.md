# chef-sendgrid_mail_handler
This cookbook installs and configures SendGrid Mail Handler, a Chef handler that collects exception and report handler data and then uses sendgrid-ruby gem to send email reports that are based on Erubis templates.

# Usage
First, get your free SendGrid account [here](https://sendgrid.com/free).

Next, obtain your [SENDGRID_API_KEY](https://app.sendgrid.com/settings/api_keys).

Include chef-sendgrid_mail_handler early in your Chef run list.

Required attributes:
* `node['mail_handler']['to_address']` = 'recipient@domain.com' or ['recipient1@domain.com', 'recipient2@domain.com', 'recipient3@domain.com']
* `node['mail_handler']['api_key']` = 'SG.ApiKey'

Optional attributes:
* `node['mail_handler']['from_address']` = "chef-client@#{node['fqdn']}"
* `node['mail_handler']['send_statuses']` =
  * `['Successful', 'Failed']` = Trigger the handler on both successful and failed chef-client run
  * `['Successful']` = Trigger the handler only on successful chef-client run
  * `['Failed']` = Trigger the handler only on failed chef-client run (recommended)
* `node['mail_handler']['hostname']` = 'localhost'

# About
sendgrid_mail_handler is guided and supported by the SendGrid [Operations Team](mailto:operations@sendgrid.com).

sendgrid_mail_handler is maintained and funded by SendGrid, Inc. The names and logos for sendgrid-ruby are trademarks of SendGrid, Inc.

![SendGrid Logo]
(https://uiux.s3.amazonaws.com/2016-logos/email-logo%402x.png)
