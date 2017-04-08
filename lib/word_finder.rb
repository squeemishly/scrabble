require 'pry'

class WordFinder
  def words
    File.read('/usr/share/dict/words').split("\n")
  end

  def for_letters(letters)
    nums = (1..letters.length).to_a
    combined_letters = nums.map do |num|
      letters.permutation(num).to_a
    end
    letters_to_words = []
    nums.each do |num|
      combined_letters[num - 1].each do |word|
        letters_to_words << word.join('')
      end
    end
    possible_words = words & letters_to_words
  end

  def for_letters_with(letters, must_include)
    letters = letters << must_include
    possible_words = for_letters(letters)
    correct_words = []
    possible_words.each do |word|
      if word.include? must_include
        correct_words << word
      end
    end
    correct_words
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
