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

  def update(str)
    @str = str
  end

  def delete()
    @@words.delete(self.id)
  end

  def definitions()
    Define.find_by_word(self.id)
  end

  def self.search(user_str)
    search_results = []
    wrd = @@words.find { |word| word[1].str.downcase == user_str.downcase }
    search_results.push(wrd[1])
  end
end
