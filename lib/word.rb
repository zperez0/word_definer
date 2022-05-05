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

end