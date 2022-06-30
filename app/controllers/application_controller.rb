class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    @res = "root page"
  end

  get '/todos/:user_id' do
    #get all todos of user_id = :user_id
    #table: todos table
    # @res = "method: get /id. route id is #{params[:user_id]}"

    todos = Todo.where(:user_id => params[:user_id]).to_json
  end

  patch '/update/:todo_id' do

    todo = Todo.find(params[:todo_id])
  
    params.each {|key,value|
      
      unless key == "todo_id"
        todo.update("#{key}": "#{value}")
      end

    }
    

  end

  delete '/delete/:todo_id' do
      #delete todo with todo_id = :todo_id
      # @res = "method: delete delete/id. route id is #{params[:todo_id]}"
    todo = Todo.find(params[:todo_id])
    todo.destroy
    todo.to_json
  end

  post '/create' do
    #create a new todo with details sent by user
    # @res = "method: post create/"

    new_todo = Todo.create(
      title: params[:title],
      done: params[:done],
      urgent: params[:urgent],
      important: params[:important],
      user_id: params[:user_id]
    )
  end

get "/users" do
    User.all.to_json
end

post "/users" do
  new_user = User.create(
          user: params[:users],
          user: params[:user]
      )
  new_user.to_json(include: [:todos])
  end

end
  