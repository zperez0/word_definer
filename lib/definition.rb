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


end