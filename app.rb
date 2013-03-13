require 'rubygems'
require 'sinatra'
require 'haml'
require 'json'

# app.rb
set :haml, :format => :html5
 
get "/" do
  haml :index
end

post "/create" do
  @code = params[:code]
  haml :create
end

get "/validate" do
  content_type :json
  @code = params[:code]

  response = {
    code: @code,
    errors: []
  }

  if @code.length == 5
    response[:valid] = true
  elsif @code.length < 5
    response[:valid] = false
    response[:errors] << "UPC is less than 5 characters long."
  elsif @code.length > 5
    response[:valid] = false
    response[:errors] << "UPC is more than 5 characters long."
  end

  if @code !~ /^\d+$/
    response[:valid] = false
    response[:errors] << "UPC must be a number."
  end

  response.to_json
end
