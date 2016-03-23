# chef-sendgrid_mail_handler
Installs and configures SendGrid Mail Handler

Required attributes:

* `node['mail_handler']['to_address']` = 'recipient@domain.com'
* `node['mail_handler']['api_key']` = 'SG.ApiKey'

Optional attributes:

* `node['mail_handler']['from_address']` = "chef-client@#{node['fqdn']}"
* `node['mail_handler']['send_statuses']` =
  * `['Successful', 'Failed']` = Trigger the handler on both successful and failed chef-client run
  * `['Successful']` = Trigger the handler only on successful chef-client run
  * `['Failed']` = Trigger the handler only on failed chef-client run (recommended)
* `node['mail_handler']['hostname']` = 'localhost'
