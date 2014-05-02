require 'sinatra'
require 'data_mapper'
require_relative "./models/Task.rb"
	
get '/' do
@tasks = Task.all(:order => :id)

redirect '/new' if @tasks.empty?
erb:home
end	

get '/new' do
	erb:create_task
end
post '/new' do 
	Task.create(:title => params[:title], :venue => params[:venue], :duration => params[:duration], :datecreated => Time.now)
	redirect '/'
end

get '/delete/:id' do
	@task = Task.first(id => params[:id])
	erb:delete_task
end

post '/delete/id' do
	if params.has_key?("ok")
		task = Task.first(id => params[:id])
		task.destroy
	redirect '/'
	else
		redirect '/'
	end
end

get '/about' do
	erb:about
end
get '/contact' do
	erb:contact
end