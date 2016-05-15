# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do 
  @messages = Message.all 
  ##this allows for us to have access to @messages in the index.erb file.
  erb :'messages/index'
end

post '/messages' do
  @message = Message.new(
    title: params[:title],
    content: params[:content],
    author: params[:author]
    )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end

end

get '/messages/new' do 
  @message = Message.new
  erb :'messages/new'
end

get '/messages' do 
  @message = Message.find params[:id]
  erb :'messages/show'
end

get '/messages/:id' do 
  @message = Message.find params[:id]
  erb :'messages/show'
end
