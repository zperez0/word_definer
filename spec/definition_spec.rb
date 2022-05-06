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
      def1 = Define.new("homie", @word.id, nil)
      def2 = Define.new("homie", @word.id, nil)
      expect(def1).to(eq(def2))
    end
  end

  describe('.all') do
    it("returns an array of definitions") do
      def1 = Define.new("flying bison", @word.id, nil)
      def1.save()
      def2 = Define.new("homie for life", @word.id, nil)
      def2.save()
      expect(Define.all).to(eq([def1, def2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      def1 = Define.new("air bison", @word.id, nil)
      def1.save()
      def2 = Define.new("homie for life", @word.id, nil)
      def2.save()
      Define.clear()
      expect(Define.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      def1 = Define.new("homie for life", @word.id, nil)
      def1.save()
      expect(Define.all).to(eq([def1]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      def1 = Define.new("homie for life", @word.id, nil)
      def1.save()
      def2 = Define.new("air bison", @word.id, nil)
      def2.save()
      expect(Define.find(def1.id)).to(eq(def1))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      def1 = Define.new("air bison", @word.id, nil)
      def1.save()
      def1.update("sky bison", @word.id)
      expect(def1.str).to(eq("sky bison"))
    end
  end

  describe('#delete') do
    it("deletes a definition by id") do
      def1 = Define.new("air bison", @word.id, nil)
      def1.save()
      def2 = Define.new("homie for life", @word.id, nil)
      def2.save()
      def1.delete()
      expect(Define.all).to(eq([def2]))
    end
  end

  describe('.find_by_word') do
    it("finds a definition for a word") do
      word2 = Word.new("air bender", nil)
      word2.save()
      def1 = Define.new("homie for life", @word.id, nil)
      def1.save()
      def2 = Define.new("one who can control air", word2.id, nil)
      def2.save()
      expect(Define.find_by_word(word2.id)).to(eq([def2]))
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      def1 = Define.new("homie for life", @word.id, nil)
      def1.save()
      expect(def1.word()).to(eq(@word))
    end
  end
end