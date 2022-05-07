require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

# home page
get('/') do
  # binding.pry
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

# show specfic word based on id -BREAKING-
get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

# form for updating a word
get('/words/:id/edit') do
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
delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/words')
end

# gets detail for definitions
get('/words/:id/definitions/:def_id') do
  @definition = Define.find(params[:def_id].to_i())
  erb(:definition)
end

# post a new def. route to the word
post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Define.new(params[:def_str], @word.id, nil)
  definition.save()
  erb(:word)
end

# edit & route back to word view
patch('/words/:id/definitions/:def_id') do
  @word = Word.find(params[:id].to_i())
  definition = Define.find(params[:def_id].to_i())
  definition.update(params[:str], @word.id)
  erb(:word)
end

# delete
delete('/words/:id/definitions/:def_id') do
  definition = Define.find(params[:def_id].to_i())
  definition.delete()
  @word = Word.find(params[:id].to_i())
  erb(:word)
end