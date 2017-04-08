require 'pry'

class WordFinder
  def words
    File.read('/usr/share/dict/words').split("\n")
  end

  def for_letters(letters)
    possible_words = []
    nums = (1..letters.length).to_a
    letters_to_words = []
    nums.each do |num|
      letters_to_words << letters.permutation(num).to_a
    end
    arr = []
    nums.each do |num|
      letters_to_words[num - 1].each do |word|
        arr << word.join('')
      end
    end
    words.each do |word|
      if arr.include? word
        possible_words << word
      end
    end
    # binding.pry


    ### Try this again with permutation
    # words.each do |word|
    #   letters_bank = []
    #   letters.each do |letter|
    #     letters_bank << letter
    #   end
    #   if word.chars.all? do |letter|
    #     letters_bank.include? letter
    #     letters_bank.delete(letter)
    #   end
    #     possible_words << word
    #   end
    # end
    possible_words
  end

  def for_letters_with(letters, must_include)
    possible_words = []

    binding.pry
  end
end

# You can load up a huge list of words using the OS X internal dictionary
# like so:
#
# ```ruby
# File.read('/usr/share/dict/words').split("\n")
# ```
#
# That instruction will return you a massive array of strings.
#
# Let's use that to cheat at Scrabble. Write a `WordFinder` with a `for_letters`
# methods that finds all the words a player can play, using their letters.
#
# ```ruby
# finder = WordFinder.new
# finder.for_letters(['r', 'e', 'x', 'a', 'p', 't', 'o'])       # => ["a", "ae", "aer", "aero", "ape", "aper", "apert", "apex", ...
# finder.for_letters(['r', 'e', 'x', 'a', 'p', 't', 'o']).count # => 141
# ```
#
# Then build a second method named `for_letters_with` that takes a list of available letters along
# with *one required letter*:
#
# ```ruby
# finder.for_letters_with(['e', 'x', 'a', 'p', 't', 'o'], 'r')        # => ["aer", "aero", "aper", "apert", "aport", "ar", "are", "art", "arx", "ear", "er", "era", "export", "extra", ...
# finder.for_letters_with(['e', 'x', 'a', 'p', 't', 'o'], 'r').count  # => 85
# ```
