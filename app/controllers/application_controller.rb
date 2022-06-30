class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    @res = "root page"
  end

  #
  # Routes dealing with Todo table
  #

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

  #
  # Routes dealing with User table and authentication
  #

  post "/signin" do

    if User.exists?(username: params[:username])

      check_user = User.find_by_username(params[:username])
      db_password = check_user[:password]

      if db_password == params[:password]
        # check if passwords match

        msg = {:success => "Signed in #{params[:username] }successfully", :user_id => check_user[:id]} 
        @res = msg.to_json
      else
        msg = {:signin_error => "Incorrect password!"}
        @res = msg.to_json
      end

    else
      msg = {:signin_error => "username: #{params[:username]} does not exists. Sign up instead"}
      @res = msg.to_json
    end

  end

  post "/signup" do
    
    unless User.exists?(username: params[:username])
      new_user = User.create(
          username: params[:username],
          password: params[:password]
        )
      msg = {:success => "user #{params[:username]} created successfully"} 
      @res = msg.to_json
    else
      msg = {:signup_error => "username: #{params[:username]} exists."}
      @res = msg.to_json
    end
    
  end

end
  