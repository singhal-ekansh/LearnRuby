class String
  def replace_vowel_with_star
    VOWEL_REGEX = /[aeiou]/i
    gsub(VOWEL_REGEX, '*')
  end
end

puts 'ekansh singhal'.replace_vowel_with_star