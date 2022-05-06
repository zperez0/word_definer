require('rspec')
require('word')

describe('Word') do

  before(:each) do
    Word.clear()
  end

  describe('#save') do
    it("saves a word") do
      word = Word.new("earth bender", nil)
      word.save()
      word2 = Word.new("flying bison", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no words") do
    expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another word") do
    word = Word.new("earth bender", nil)
    word2 = Word.new("earth bender", nil)
    expect(word).to(eq(word2))
    end
  end

  describe('.clear') do
    it("clears all words") do
      word = Word.new("flying bison", nil)
      word.save()
      word2 = Word.new("fire bender", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word = Word.new("flying bison", nil)
      word.save()
      word2 = Word.new("air bender", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word = Word.new("flying bison", nil)
      word.save()
      word.update("polar dog")
      expect(word.str).to(eq("polar dog"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      word = Word.new("flying bison", nil)
      word.save()
      word2 = Word.new("water bender", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end
end