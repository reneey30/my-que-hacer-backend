require 'rubygems'
require 'sinatra'

get '/' do
    @res = "root page"
end

get 'todos/:user_id' do
    #get all todos of user_id = :user_id
    #table: todos table
    @res = "method: get /id. route id is #{params[:user_id]}"
end

put '/update/:todo_id' do
    #update todo with todo_id = :todo_id with data sent by user
    @res = "method: put update/id. route id is #{params[:todo_id]}"
end

delete '/delete/:todo_id' do
    #delete todo with todo_id = :todo_id
    @res = "method: delete delete/id. route id is #{params[:todo_id]}"
end

post '/create/' do
    #create a new todo with details sent by user
    @res = "method: post create/"
end
