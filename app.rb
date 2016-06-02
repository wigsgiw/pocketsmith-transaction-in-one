require 'sinatra'
require 'httparty'

before do
  # If we're in development we need to load things into env
  # If we're in production in Heroku, no need, as they'll be set as part of setup
  if Sinatra::Base.development?
    secrets = YAML.load_file('secrets.yml')
    secrets.each do |key, value|
      ENV[key] = value.to_s
    end
  end
  
end

get '/' do
  erb :index, layout: :layout
end

post '/create' do
  amount = params[:amount] == "" ? nil : params[:amount].to_f.abs * -1
  payee  = params[:payee] == "" ? ENV['pocketsmith_default_merchant'] : params[:payee]

  transaction_params = {
    :date => Time.now,
    :amount => amount,
    :payee => payee
  }
  
  @resp = HTTParty.post("https://api.pocketsmith.com/v2/transaction_accounts/#{ENV['pocketsmith_transaction_account_id']}/transactions", body: transaction_params, headers: {"Authorization" => "Key #{ENV['pocketsmith_developer_key']}"})

  erb :create, layout: :layout
end

get '/me' do
  response = HTTParty.get('https://api.pocketsmith.com/v2/me', headers: {"Authorization" => "Key #{ENV['pocketsmith_developer_key']}"})
  response.body
end
