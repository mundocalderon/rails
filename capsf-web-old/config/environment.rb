# Load the rails application
require File.expand_path('../application', __FILE__)

#NTLM STMP library to authenticate with exchange server
require 'ntlm/smtp'

# Initialize the rails application
CapsfWeb::Application.initialize!
