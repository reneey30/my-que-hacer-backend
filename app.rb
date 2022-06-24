require 'rubygems'
require 'sinatra'

get '/:id' do
    #get all todos of user_id = :id
    #table: todos table
end

put '/:update/id' do
    #update todo with todo_id = :id with data sent by user
end

delete '/delete/:id' do
    #delete todo with todo_id = :id
end

post '/create/' do
    #create a new todo with details sent by user
end
