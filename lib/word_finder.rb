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

finder = WordFinder.new
