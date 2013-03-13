require 'rubygems'
require 'sinatra'
require 'haml'
require 'json'
require './lib/upc'

# app.rb
set :haml, :format => :html5
 
get "/" do
  haml :index
end

post "/create" do
  @code = params[:code]

  upc = UPC.new(@code)
  if upc.valid?
    @message = "Creating UPC #{@code}"
  else
    @message = "UPC is not valid: #{upc.errors.join(",")}"
  end
  haml :create
end

get "/validate" do
  content_type :json
  @code = params[:code]

  upc = UPC.new(@code)

  upc.to_json
end

