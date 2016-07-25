name             'sendgrid_mail_handler'
maintainer       'Sendgrid, Inc.'
maintainer_email 'operations@sendgrid.com'
license          'all_rights'
description      'Installs/Configures SendGrid Mail Handler'
issues_url       'https://github.com/sendgrid-ops/chef-sendgrid_mail_handler'
source_url       'git@github.com:sendgrid-ops/chef-sendgrid_mail_handler.git'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'

depends 'chef_handler', '~> 1.3'
