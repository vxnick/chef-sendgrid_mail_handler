describe_recipe 'sendgrid_mail_handler::default' do

  it 'creates the handler file' do
    file("#{node['chef_handler']['handler_path']}/mail.rb").must_exist
  end

  it 'creates the mail template' do
    file("#{node['chef_handler']['handler_path']}/mail.erb").must_exist
  end

end
