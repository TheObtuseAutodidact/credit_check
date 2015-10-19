class CreditCheck
attr_reader :solution_array
  def initialize(string)
    @string = string
    @solution_array = []
  end

  def digit_split
    num_array = @string.chars
     @solution_array = num_array.map{|num| num.to_i}
  end

  def even_separation
    odds, evens = @solution_array.partition.with_index {|_, index| index.odd? }
    @solution_array = [odds, evens]
  end

  def double_odds
    @solution_array[0] = @solution_array[0].map {|num| num * 2}
  end

  def doubled_odds_over_nine
    over_nine, under_ten = @solution_array[0].partition {|num| num > 9}
    @solution_array[0] = [over_nine, under_ten]
    @solution_array[0][0]
  end

  def digit_sum
    @solution_array[0][0] = @solution_array[0][0].map {|num| num % 10 + 1}
  end

  def final_sum
    @solution_array.flatten.reduce(:+)
  end

  def valid?
    final_sum % 10 == 0
  end

def validate
  digit_split
  even_separation
  double_odds
  doubled_odds_over_nine
  digit_sum
  valid?
end




end
check1 = CreditCheck.new("257892")
puts check1.validate


#
# check = CreditCheck.new("1234666")
# check.digit_split
# check.even_separation
# check.double_odds
# check.doubled_odds_over_nine
# check.digit_sum
# puts check.solution_array.flatten.inspect
