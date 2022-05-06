class Define
  attr_reader :id
  attr_accessor :str, :word_id

  @@defs = {}
  @@total_rows = 0

  def initialize(str, word_id, id)
    @str = str
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def ==(def_to_compare)
    (self.str() == def_to_compare.str()) && (self.word_id() == def_to_compare.word_id())
  end

  def self.all
    @@defs.values
  end

  def save
    @@defs[self.id] = Define.new(self.str, self.word_id, self.id)
  end

  def self.find(id)
    @@defs[id]
  end

  def update(str, word_id)
    self.str = str
    self.word_id = word_id
    @@defs[self.id] = Define.new(self.str, self.word_id, self.id)
  end

  def delete
    @@defs.delete(self.id)
  end

  def self.clear
    @@defs = {}
  end
end