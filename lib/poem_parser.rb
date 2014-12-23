class PoemParser

  def initialize(poem)
    @poem = poem
  end

  def title
    @poem.lines.first.chomp
  end

end
