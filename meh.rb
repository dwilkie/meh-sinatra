# meh.rb
require 'sinatra'

require 'mail'
options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'local.localhost',
            :user_name            => ENV['GMAIL_USERNAME'],
            :password             => ENV['GMAIL_PASSWORD'],
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
            
Mail.defaults do
  delivery_method :smtp, options
end

post '/orders/create' do
  BODY = params.to_s
  Mail.deliver do
    to ENV['EMAIL_ADDRESS']
    from 'dwilkie@gmail.com'
    subject ENV['EMAIL_ADDRESS']
    body BODY
  end
end

