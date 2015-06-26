require 'rest-client'
require 'bundler/setup'
Bundler.setup

#setup path ...
$:.unshift File.expand_path("../../services", __FILE__)

# require 'webmock/rspec'

PROCURECARROS_API_CLIENT = ENV['PROCURECARROS_API_CLIENT'] || "NO_KEY"
PROCURECARROS_API_TOKEN = ENV['PROCURECARROS_API_TOKEN'] || "NO_TOKEN"


RSpec.configure do |config|

  # WebMock.disable_net_connect!(allow_localhost: true)
  # config.before(:each) do
  #   stub_request(:get, /api.github.com/).
  #       with(headers: {'Accept'=>'*/*', 'User-Agent'=>'ruby-spec'}).
  #       to_return(status: 200, body: "stubbed response", headers: {})
  # end

end
