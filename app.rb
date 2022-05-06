require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

# home page
get('/') do
  redirect to('/words')
end

# show list of words
get('/words') do
  @words = Word.all
  erb(:words)
end

# adding a word
get('/words/new') do
  erb(:new_word)
end

# add a word to the list
post('/words') do
  str = params[:word_str]
  word = Word.new(str, nil)
  word.save()
  redirect('/words')
end

# show specfic word based on id
get('words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

# form for updating a word
get('words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

# update word
patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:str])
  redirect to('/words')
end

# delete word
delete('words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/albums')
end