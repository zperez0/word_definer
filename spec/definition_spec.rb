require('rspec')
require('definition')
require('word')
require('pry')

describe('Define') do

  before(:each) do
    Word.clear()
    Define.clear()
    @word = Word.new("flying bison", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Define.new("homie", @word.id, nil)
      definition2 = Define.new("homie", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns an array of definitions") do
      definition = Define.new("flying bison", @word.id, nil)
      definition.save()
      definition2 = Define.new("homie for life", @word.id, nil)
      definition2.save()
      expect(Define.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Define.new("air bison", @word.id, nil)
      definition.save()
      definition2 = Define.new("homie for life", @word.id, nil)
      definition2.save()
      Define.clear()
      expect(Define.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Define.new("homie for life", @word.id, nil)
      definition.save()
      expect(Define.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Define.new("homie for life", @word.id, nil)
      definition.save()
      definition2 = Define.new("air bison", @word.id, nil)
      definition2.save()
      expect(Define.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      definition = Define.new("air bison", @word.id, nil)
      definition.save()
      definition.update("sky bison", @word.id)
      expect(definition.str).to(eq("sky bison"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      definition = Define.new("air bison", @word.id, nil)
      definition.save()
      definition2 = Define.new("homie for life", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Define.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds a definition for a word") do
      word2 = Word.new("air bender", nil)
      word2.save()
      definition = Define.new("homie for life", @word.id, nil)
      definition.save()
      definition2 = Define.new("one who can control air", word2.id, nil)
      definition2.save()
      expect(Define.find_by_word(word2.id)).to(eq([definition2]))
    end
  end
end