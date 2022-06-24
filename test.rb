require 'rubygems'
require 'sinatra'

get '/' do
    "Test, it's #{Time.now} at the server!"
end