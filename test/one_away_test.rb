require 'test_helper'
require 'one_away'

class TestOneAway < Minitest::Test

  include OneAway

  def test_words_are_identical
    word = 'hello'

    refute one_away word, word
  end

  def test_words_with_identical_length_and_one_char_difference
    word1 = 'hela'
    word2 = 'help'

    assert one_away word1, word2
  end

  def test_words_with_identical_length_and_more_than_one_char_difference
    word1 = 'help'
    word2 = 'sewn'

    refute one_away word1, word2
  end

  def test_words_with_different_lengths_one_letter_removed
    word1 = 'shela'
    word2 = 'hela'

    assert one_away word1, word2
  end

  def test_words_with_different_lengths_one_letter_removed_duplicate_chars
    word1 = 'sheee'
    word2 = 'shee'

    assert one_away word2, word1
  end

  def test_difference_between_word_lengths_exceeds_one
    refute one_away 'aaaaa', 'aaaaaaa'
    refute one_away 'hello', 'shallow'
  end
end
