require 'sinatra'
require "sinatra/basic_auth"
require 'thin'
require 'json'

get '/' do
    "First application"
end

get '/greet' do
  "Hello #{params[:name]}"
end

# Building server to handle incoming get request and tell what to do.

# So in order to make a GET request and sending :name params within the URL,
# it would look like this:
# localhost:4567/greet?name=Joanna
# $Hello Joanna

get '/agent' do
  request.user_agent
end

post '/target' do
  "Hello #{params[:name]}"
end

get '/example.json' do
    content_type :json
    { :name => 'Jane', :age => 17 }.to_json
end

post '/readjson' do
    data = JSON.parse request.body.read
    puts data
    "#{data["name"]} is #{data["age"]} years old"
end

authorize do |username, password|
    username == "user7" && password == "7password"
end

get '/' do
    "hello"
end

protect do
    get '/secure' do
        "This is restricted area"
    end
end

get '/oldpage' do
    redirect to('/newpage.html'), 302
end
