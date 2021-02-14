require './lcs'
class Row
  attr_reader :input, :first_name, :last_name, :country, :numbers, :credits

  def initialize(string)
	@input = string.split(',').map(&:strip)
	# TODO validation
	@last_name  = @input[0]
	@first_name = @input[1]
	@country    = @input[2]
	@numbers    = []
	add_number(@input[3])
  end

  def add_number(num)
	if num.is_a?(Array)
	  @numbers += num
	else
	  @numbers += Array(num)
	end
  end

  def set_credits(sample)
	@credits = 0
	@numbers.each do |num|
	  @credits += Lcs.call(sample, num)
	end
  end

  def to_string
	[@last_name, @first_name, @country, @credits].join(',')
  end
end