#
# Cookbook Name:: sendgrid_mail_handler
# Recipe:: default.rb
#
# Copyright (C) 2016 SendGrid
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'chef_handler'

cookbook_file "#{node['chef_handler']['handler_path']}/mail.rb" do
  source 'mail.rb'
  action :nothing
end.run_action(:create)

cookbook_file "#{node['chef_handler']['handler_path']}/mail.erb" do
  source 'mail.erb'
  action :nothing
end.run_action(:create)

chef_gem 'sendgrid-ruby' do
  version '1.1.6' # newer versions require ruby 2.2.x, which chef 12.6.0 doesn't have
end

chef_handler 'SendGridMailHandler' do
  source "#{node['chef_handler']['handler_path']}/mail"
  arguments(
    to_address: node['sendgrid_mail_handler']['to_address'],
    from_address: node['sendgrid_mail_handler']['from_address'],
    api_key: node['sendgrid_mail_handler']['api_key'],
    send_statuses: node['sendgrid_mail_handler']['send_statuses'],
    hostname: node['sendgrid_mail_handler']['hostname']
  )
  action :nothing
end.run_action(:enable)
