require("rspec")
require("word")
require("definition")

describe("Word") do
  before(:each) do
    Word.clear()
    Define.clear()
  end

  describe("#save") do
    it("saves a word") do
      word = Word.new("earth bender", nil)
      word.save()
      word2 = Word.new("flying bison", nil)
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe(".all") do
    it("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same word if it has the same attributes as another word") do
      word = Word.new("earth bender", nil)
      word2 = Word.new("earth bender", nil)
      expect(word).to(eq(word2))
    end
  end

  describe(".clear") do
    it("clears all words") do
      word = Word.new("flying bison", nil)
      word.save()
      word2 = Word.new("fire bender", nil)
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe(".find") do
    it("finds a word by id") do
      word = Word.new("flying bison", nil)
      word.save()
      word2 = Word.new("air bender", nil)
      word2.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe("#update") do
    it("updates a word by id") do
      word = Word.new("flying bison", nil)
      word.save()
      word.update("polar dog")
      expect(word.str).to(eq("polar dog"))
    end
  end

  describe("#delete") do
    it("deletes an album by id") do
      word = Word.new("flying bison", nil)
      word.save()
      word2 = Word.new("water bender", nil)
      word2.save()
      word.delete()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe("#definitions") do
    it("returns a word's definitions") do
      word = Word.new("flying bison", nil)
      word.save()
      def1 = Define.new("homie", word.id, nil)
      def1.save()
      def2 = Define.new("sky bison", word.id, nil)
      def2.save()
      expect(word.definitions).to(eq([def1, def2]))
    end
  end

  describe(".search") do
    it("searches for a preexisting word") do
      word = Word.new("flying bison", nil)
      word.save()
      word2 = Word.new("water bender", nil)
      word2.save()
      expect(Word.search("flying bison")).to(eq([word]))
    end
  end
end
