class Lcs
  attr_reader :sample, :number

  def initialize(sample, number)
	@sample = sample.to_s
	@number = number.to_s
  end

  def lcs_length
	lcs_array.last.last
  end

  def lcs_array
	result = [Array.new(@number.length + 1, 0)]
	@sample.split('').each do |sample_value|
	  row = [0]
	  @number.split('').each_with_index do |numb_value, numb_index|
		row << [result.last[numb_index] + (numb_value == sample_value ? 1 : 0), result.last[numb_index + 1], row.last].max
	  end
	  result << row
	end
	result
  end


  class << self
	def call(sample, number)
	  self.new(sample, number).lcs_length
	end
  end
end