require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  redirect to('/words')
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  str = params[:word_str]
  word = Word.new(str, nil)
  word.save()
  redirect('/words')
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.update(params[:str])
  redirect to('/words')
end

delete('/words/:id') do
  @word = Word.find(params[:id].to_i())
  @word.delete()
  redirect to('/words')
end

get('/words/:id/definitions/:def_id') do
  @definition = Define.find(params[:def_id].to_i())
  erb(:definition)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i())
  definition = Define.new(params[:def_str], @word.id, nil)
  definition.save()
  erb(:word)
end

patch('/words/:id/definitions/:def_id') do
  @word = Word.find(params[:id].to_i())
  definition = Define.find(params[:def_id].to_i())
  definition.update(params[:str], @word.id)
  erb(:word)
end

delete('/words/:id/definitions/:def_id') do
  definition = Define.find(params[:def_id].to_i())
  definition.delete()
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get('/results') do
  erb(:search_results)
end

post("/results") do
  @words = Word.search(params[:search])
  erb(:search_results)
end