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
      define = Define.new("homie", @word.id, nil)
      define2 = Define.new("homie", @word.id, nil)
      expect(define).to(eq(define2))
    end
  end

  describe('.all') do
    it("returns an array of definitions") do
      define = Define.new("flying bison", @word.id, nil)
      define.save()
      define2 = Define.new("homie for life", @word.id, nil)
      define2.save()
      expect(Define.all).to(eq([define, define2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      define = Define.new("air bison", @word.id, nil)
      define.save()
      define2 = Define.new("homie for life", @word.id, nil)
      define2.save()
      Define.clear()
      expect(Define.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      define = Define.new("homie for life", @word.id, nil)
      define.save()
      expect(Define.all).to(eq([define]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      define = Define.new("homie for life", @word.id, nil)
      define.save()
      define2 = Define.new("air bison", @word.id, nil)
      define2.save()
      expect(Define.find(define.id)).to(eq(define))
    end
  end

  describe('#update') do
    it("updates a definition by id") do
      define = Define.new("air bison", @word.id, nil)
      define.save()
      define.update("sky bison", @word.id)
      expect(define.str).to(eq("sky bison"))
    end
  end

  describe('#delete') do
    it("deletes a defintion by id") do
      define = Define.new("air bison", @word.id, nil)
      define.save()
      define2 = Define.new("homie for life", @word.id, nil)
      define2.save()
      define.delete()
      expect(Define.all).to(eq([define2]))
    end
  end
end