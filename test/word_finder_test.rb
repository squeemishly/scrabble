gem 'minitest'
require_relative '../lib/word_finder'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WordFinderTest < Minitest::Test
  def test_it_exists
    word_finder = WordFinder.new
    assert_instance_of WordFinder, word_finder
  end

  def test_it_can_access_the_words
    assert_instance_of Array, WordFinder.new.words
  end

  def test_it_can_find_all_the_words_given_a_set_of_letters
    finder = WordFinder.new
    all_words = finder.for_letters(['r', 'e', 'x', 'a', 'p', 't', 'o'])
    assert_equal 141, all_words.count
  end

  def test_it_can_find_words_that_must_include_one_letter
    finder = WordFinder.new
    all_words = finder.for_letters_with(['e', 'x', 'a', 'p', 't', 'o'], 'r')
    assert_equal 85, all_words.count
  end
end
