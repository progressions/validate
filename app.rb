require 'rubygems'
require 'sinatra'
require 'haml'

# app.rb
set :haml, :format => :html5
 
get "/" do
  haml :index
end
