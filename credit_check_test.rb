require 'minitest'
require 'minitest/autorun'
require './credit_check'

class CreditCheckTest < Minitest::Test

  def test_if_it_exists
    assert CreditCheck
  end

  def test_it_takes_a_string_to_array
    check = CreditCheck.new("123")
    check.digit_split
    assert_equal [1, 2, 3], check.solution_array
  end

  def test_it_separates_evens_and_odd_indices
    check = CreditCheck.new("1234666")
    check.digit_split
    assert_equal [[2, 4, 6], [1, 3, 6, 6]], check.even_separation
  end

  def test_it_double_nums_in_odds_array
    check = CreditCheck.new("1234666")
    check.digit_split
    check.even_separation
    assert_equal [4, 8, 12], check.double_odds
  end

  def test_it_splits_numbers_over_nine
      check = CreditCheck.new("1234666")
      check.digit_split
      check.even_separation
      check.double_odds
      assert_equal [12], check.doubled_odds_over_nine
  end

  def test_adds_digits_of_nums_over_nine
    check = CreditCheck.new("1234666")
    check.digit_split
    check.even_separation
    check.double_odds
    check.doubled_odds_over_nine
    assert_equal [3], check.digit_sum
  end

  def test_if_final_sum
    check = CreditCheck.new("1234666")
    check.digit_split
    check.even_separation
    check.double_odds
    check.doubled_odds_over_nine
    check.digit_sum
    assert_equal 31, check.final_sum
  end

def test_if_valid
  check = CreditCheck.new("1234666")
  check.digit_split
  check.even_separation
  check.double_odds
  check.doubled_odds_over_nine
  check.digit_sum
  check.final_sum
  assert_equal false, check.valid?
end


end
