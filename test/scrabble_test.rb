gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_longer_word
    assert_equal 14, Scrabble.new.score("squee")
    assert_equal 56, Scrabble.new.score("supercalifragilisticexpialidocious")
  end

  def test_an_empty_word_scores_nothign
    assert_equal 0, Scrabble.new.score("")
  end
end
