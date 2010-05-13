# meh.rb

require "bundler"
Bundler.setup

require 'sinatra'
#require 'ruby-debug'
#require 'ebay'

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
  request_body = request.body.read
  Mail.deliver do
    to ENV['EMAIL_ADDRESS']
    from ENV['EMAIL_ADDRESS']
    subject 'meh'
    body request_body
  end
end

post '/payment_notifications/create' do
  request_body = params.to_s
  Mail.deliver do
    to ENV['EMAIL_ADDRESS']
    from ENV['EMAIL_ADDRESS']
    subject 'paypal notification'
    body request_body
  end
end

get '/incoming_text_messages/create' do
  request_body = params.to_s
  Mail.deliver do
    to ENV['EMAIL_ADDRESS']
    from ENV['EMAIL_ADDRESS']
    subject 'incoming text message'
    body request_body
  end
end

get '/text_message_delivery_reports/create' do
end
