# require 'sinatra-activerecords'
# require 'sqlite3'
# require 'activerecord'
# require 'sinatra-activerecord'

class Todo < ActiveRecord::Base
    belongs_to :users
end