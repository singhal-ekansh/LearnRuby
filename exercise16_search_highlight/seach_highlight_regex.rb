class String
  def highlight_word(word)
    @count = 0
    gsub!(Regexp.new(word,true)) do |match|
      @count += 1
      match = "(#{match})"
    end   
  end
  def to_s
    puts self
    puts "Total occurrences found: #{@count}"
  end
end

"Can can yoi can can canner".highlight_word('can').to_s