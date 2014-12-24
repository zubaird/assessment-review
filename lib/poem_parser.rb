class PoemParser

  attr_reader :poem_lines

  def initialize(poem)
    @poem = poem
    @poem_lines = poem.lines
  end

  def title
    poem_lines.first.chomp
  end

  def author
    poem_lines[1].strip
  end

  def verse_count
    poem_lines.count("\n")
  end

  def line_count
    header_lines = 2
    extra_lines = header_lines + verse_count
    poem_lines.size - extra_lines
  end

  def hashify
    poem_hash = {}
    poem_verses_lines = {}

    poem_verses_lines[title] = {
      verses: verse_count,
      lines: line_count,
    }

    poem_hash[author] = poem_verses_lines
    poem_hash
  end

end



dummy_data = "In Possum Land
Henry Lawson

In Possum Land the nights are fair,
the streams are fresh and clear;
no dust is in the moonlit air;
no traffic jars the ear.

With Possums gambolling overhead,
'neath western stars so grand,
Ah! would that we could make our bed
tonight in Possum Land"

poem_details = PoemParser.new(dummy_data)
puts poem_details.hashify
