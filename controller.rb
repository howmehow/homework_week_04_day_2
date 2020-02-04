require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
# DB = Sequel.connect(adapter: :postgres, database: 'my_db', host: 'localhost', user: 'db_user')
require_relative("./models/movie")
require_relative("./models/customer")
require_relative("./models/ticket")
also_reload("./models/*")#if anything changes in the file it restarts sinatra
get '/' do
  erb(:home)
end
get '/movies' do
  erb(:movies)
end

# get '/divide/:num1/:num2' do
#     @calculation = Calculator.divide(params["num1"].to_i, params["num2"].to_i)
#     erb(:result)
# end
