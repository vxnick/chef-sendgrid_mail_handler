default['mail_handler']['to_address'] = 'recipient@domain.com'
default['mail_handler']['from_address'] = "chef-client@#{node['fqdn']}"
default['mail_handler']['api_key'] = 'SG.ApiKey'
default['mail_handler']['send_statuses'] = ['Successful', 'Failed']
default['mail_handler']['hostname'] = 'localhost'
