require 'gmail'
require 'json'
require 'google/api_client/client_secrets'

CLIENT_SECRETS = Google::APIClient::ClientSecrets.load
authorization = CLIENT_SECRETS.to_authorization

# You can then use this with an API client, e.g.:
118072579965116845286.authorization = authorization

gmail = Gmail.connect(:xoauth2, 'adelinethp17@domain.com', 'https://accounts.google.com/o/oauth2/token') do |gmail|
	gmail.deliver do
	  to "adelinedidier@hotmail.com"
	  subject "Having fun in Puerto Rico!"
	  	
	  text_part do
	   	body "Text of plaintext message."
	  end
	end


  puts gmail.logged_in?
end