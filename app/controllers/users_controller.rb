class UsersController < ApplicationController

    # get '/users/:user_id' do
    #     #get all users of user_id = :user_id
    #     #table:  users table
    #     # @res = "method: get /id. route id is #{params[:user_id]}"
    
    #     users = User.where(:user_id => params[:user_id]).to_json
    #   end
    get "/users" do
        User.all.to_json(include: [:todos])
    end

    # get "/users/random" do
    # user = User.random
    # user.to_json(include: [:todos])
    # end

    

end