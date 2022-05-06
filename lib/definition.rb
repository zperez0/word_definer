class Define
  attr_reader :id
  attr_accessor :str, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(str, word_id, id)
    @str = str
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(def_to_compare)
    (self.str() == def_to_compare.str()) && (self.word_id() == def_to_compare.word_id())
  end

  def self.all()
    @@definitions.values
  end

  def save()
    @@definitions[self.id] = Define.new(self.str, self.word_id, self.id)
  end

  def self.find(id)
    @@definitions[id]
  end

  def update(str, word_id)
    self.str = str
    self.word_id = word_id
    @@definitions[self.id] = Define.new(self.str, self.word_id, self.id)
  end

  def delete()
    @@definitions.delete(self.id)
  end

  def self.clear()
    @@definitions = {}
  end

  def self.find_by_word(wrd_id)
    definitions = []
    @@definitions.values.each do |defs|
      if defs.word_id == wrd_id
        definitions.push(defs)
      end
    end
    definitions
  end

  def word()
    Word.find(self.word_id)
  end
end