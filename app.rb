require 'sinatra'
require 'httparty'

before do
  # If we're in development we need to load things into env
  # If we're in production in Heroku, no need, as they'll be set as part of setup
  if Sinatra::Base.development?
    secrets = YAML.load_file('secrets.yml')
    secrets.each do |key, value|
      ENV[key] = value
    end  
  end
  
end

get '/' do
  "Oh, the wonderful things we'll do together."
end

get '/me' do
  response = HTTParty.get('https://api.pocketsmith.com/v2/me', headers: {"Authorization" => "Key #{ENV['pocketsmith_developer_key']}"})
  response.body
end