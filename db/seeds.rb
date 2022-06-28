# require 'bundler/inline'

# gemfile do
#     source 'https://rubygems.org'

#     gem 'sinatra', require: 'sinatra/base'
#     gem 'sqlite3'
#     gem 'activerecord'
#     gem 'sinatra-activerecord'
# end

# require File.expand_path('../../app/models/todo.rb',  __FILE__)
# require File.expand_path('../../app/models/user.rb',  __FILE__)
require File.expand_path('../../config/environment.rb',  __FILE__)

puts "..starting seeding"

User.destroy_all
Todo.destroy_all

user1 = User.create(
    username:   "irene",
    password:   "secret"
)

user2 = User.create(
    username: "njeru",
    password: "password"
)

id1 = User.find_by_username("irene")
id2 = User.where(:username => "njeru").first

puts "created user #{user1} with id: #{id1[:id]}"
puts "created user #{user2} with id: #{id2[:id]}"

def generate_code(number)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(number) { charset.sample }.join
end

10.times do
    Todo.create(
        title: generate_code(10),
        done: false,
        urgent: true,
        important: false,
        user_id: id1[:id]
    )
end
10.times do
    Todo.create(
        title: generate_code(10),
        done: false,
        urgent: false,
        important: true,
        user_id: id2[:id]
    )
end

todos = Todo.all

puts "created todos.. #{todos}"

