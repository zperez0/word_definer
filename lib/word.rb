class Word
  attr_reader :str, :id

  @@words = {}
  @@total_rows = 0

  def initialize(str, id)
    @str = str
    @id = id || @@total_rows += 1
  end

  def self.all()
    @@words.values()
  end

  def save()
    @@words[self.id] = Word.new(self.str, self.id)
  end

  def ==(word_to_compare)
    self.str() == word_to_compare.str()
  end

  def self.clear()
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end
end