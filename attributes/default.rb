default['sendgrid_mail_handler']['to_address'] = 'recipient@domain.com'
default['sendgrid_mail_handler']['from_address'] = "chef-client@#{node['fqdn']}"
default['sendgrid_mail_handler']['api_key'] = 'SG.ApiKey'
default['sendgrid_mail_handler']['send_statuses'] = ['Successful', 'Failed']
default['sendgrid_mail_handler']['hostname'] = 'localhost'
