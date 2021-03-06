require 'rubygems'
require 'chef'
require 'chef/handler'
require 'erubis'
require 'sendgrid-ruby'

class SendGridMailHandler < Chef::Handler
  attr_reader :options
  def initialize(opts = {})
    @options = {
      to_address: 'root',
      from_address: 'chef-client',
      api_key: 'SG.ApiKey',
      send_statuses: ['Successful', 'Failed'],
      template_path: File.join(File.dirname(__FILE__), 'mail.erb'),
      hostname: 'localhost'
    }
    @options.merge! opts
  end

  def report
    status = success? ? 'Successful' : 'Failed'
    if options[:send_statuses].include? status
      from_address = (options[:from_address] == 'chef-client') ? "#{options[:from_address]}@#{node.fqdn}" : options[:from_address]
      hostname = (options[:hostname] == 'localhost') ? node.fqdn : options[:hostname]

      subject = "#{status} Chef run on node #{hostname}"

      Chef::Log.info("mail handler template path: #{options[:template_path]}")
      if File.exist? options[:template_path]
        template = IO.read(options[:template_path]).chomp
      else
        Chef::Log.error("mail handler template not found: #{options[:template_path]}")
        raise Errno::ENOENT
      end

      context = {
        status: status,
        run_status: run_status,
        hostname: hostname
      }

      body = Erubis::Eruby.new(template).evaluate(context)

      # deliver the message using SendGrid API
      client = SendGrid::Client.new(api_key: options[:api_key])
      mail = SendGrid::Mail.new do |m|
        m.to = options[:to_address]
        m.from = from_address
        m.subject = subject
        m.html = body
      end

      Chef::Log.info('Sending out the report...')
      res = client.send(mail)
      if res.code == 200
        Chef::Log.info('Mail has been successfully delivered.')
      else
        Chef::Log.error("There was an error delivering the mail.\n#{res.body}")
        raise Errno::ENOENT
      end

    end
  end
end
