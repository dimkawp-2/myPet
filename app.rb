require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/cookies'
require 'sinatra/contrib'

get '/' do
  erb :index
end
post '/new_user' do
  new_user = params[:name]
  if new_user
    redirect "user/#{new_user}"
  else
    status 404
    erb :error404
  end
end
get '/user/:name' do
  @new_user = params[:name]
  erb :user_account
end

get '/user/:name/dog' do
  cookies[:user_name] = params[:name]
  cookies[:pet] = 'dog'
  @logs = [{id: 1, header: 'Created pet',body: 'You just created new pet'}]
  cookies[:logs] = @logs
  @pet_stats = {health: 100,mood: 100, body: 100}
  erb :dog
end
#cat
get '/user/:name/cat' do
  cookies[:date_created] = Time.now.asctime
  cookies[:user_name] = params[:name]
  cookies[:pet] = 'cat'
  @logs = [{id: 1, header: 'Created pet',body: 'You just created new pet'}]
  cookies[:logs] = @logs
  cookies[:health] = 100
  cookies[:mood] = 100
  cookies[:body] = 100
  @pet_stats = {health: cookies[:health],mood: cookies[:mood], body: cookies[:body]}
  erb :cat
end
post '/cat/mood' do
  cookies[:mood] = cookies[:mood].to_i + 20
  @pet_stats = {health: cookies[:health].to_i,mood: cookies[:mood].to_i, body: cookies[:body].to_i}
  @logs = [{header: 'Created pet',body: 'You just created new pet'}]
  @new_message = [{header: 'Mood',body: 'You add mood +20 '}]
  @logs = @logs + @new_message
  erb :cat
end
post '/cat/feed' do
  cookies[:body] = cookies[:body].to_i + 20
  @pet_stats = {health: cookies[:health].to_i,mood: cookies[:mood].to_i, body: cookies[:body].to_i}
  @logs = [{header: 'Created pet',body: 'You just created new pet'}]
  @new_message = [{header: 'body',body: 'You add body +20 '}]
  @logs = @logs + @new_message
  erb :cat
end
post '/cat/play' do
  cookies[:health] = cookies[:health].to_i + 20
  @pet_stats = {health: cookies[:health].to_i,mood: cookies[:mood].to_i, body: cookies[:body].to_i}
  @logs = [{id: 1, header: 'Created pet',body: 'You just created new pet'},
           {id: 2, header: 'health',body: 'You add health +20 '}]
  cookies[:logs] = @logs
  erb :cat
end
#dog
get '/user/:name/dog' do
  cookies[:date_created] = Time.now.asctime
  cookies[:user_name] = params[:name]
  cookies[:pet] = 'dog'
  @logs = [{id: 1, header: 'Created pet',body: 'You just created new pet'}]
  cookies[:logs] = @logs
  cookies[:health] = 100
  cookies[:mood] = 100
  cookies[:body] = 120
  @pet_stats = {health: cookies[:health],mood: cookies[:mood], body: cookies[:body]}
  erb :dog
end
post '/dog/mood' do
  cookies[:mood] = cookies[:mood].to_i + 20
  @pet_stats = {health: cookies[:health].to_i,mood: cookies[:mood].to_i, body: cookies[:body].to_i}
  @logs = [{header: 'Created pet',body: 'You just created new pet'}]
  @new_message = [{header: 'Mood',body: 'You add mood +20 '}]
  @logs = @logs + @new_message
  erb :dog
end
post '/dog/feed' do
  cookies[:body] = cookies[:body].to_i + 20
  @pet_stats = {health: cookies[:health].to_i,mood: cookies[:mood].to_i, body: cookies[:body].to_i}
  @logs = [{header: 'Created pet',body: 'You just created new pet'}]
  @new_message = [{header: 'body',body: 'You add body +20 '}]
  @logs = @logs + @new_message
  erb :dog
end
post '/dog/play' do
  cookies[:health] = cookies[:health].to_i + 20
  @pet_stats = {health: cookies[:health].to_i,mood: cookies[:mood].to_i, body: cookies[:body].to_i}
  @logs = [{id: 1, header: 'Created pet',body: 'You just created new pet'},
           {id: 2, header: 'health',body: 'You add health +20 '}]
  cookies[:logs] = @logs
  erb :dog
end
