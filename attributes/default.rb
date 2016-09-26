default['sendgrid_mail_handler']['to_address'] = 'recipient@example.com'
default['sendgrid_mail_handler']['from_address'] = "chef-client@#{node['fqdn']}"
default['sendgrid_mail_handler']['api_key'] = 'SG.ApiKey'
default['sendgrid_mail_handler']['send_statuses'] = ['Failed'] # ['Successful', 'Failed']
default['sendgrid_mail_handler']['hostname'] = 'localhost'
default['sendgrid_mail_handler']['cooldown'] = 0 # Number of seconds before sending more reports
