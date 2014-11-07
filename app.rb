require 'sinatra'
require "mongoid"
require_relative "models/universe"
require_relative "models/guy"
require_relative "views/term/guy"

Mongoid.load!("mongoid.yml", :development)
set :haml, :format => :html5
set :views, settings.root + '/views/web'
set :root, File.dirname(File.dirname(__FILE__))
set :public_folder, settings.root + "/assets"

get '/' do
  @guys = Guy.all
  haml :test
end
