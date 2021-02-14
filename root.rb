require './row'

# Attributes
sumple = ARGV[1]
path   = ARGV[0]


# Set player list
player_list = []
File.readlines(path).each do |row|
  player = Row.new(row)

  if (dup = player_list.detect{ |r| r.last_name == player.last_name && r.first_name == player.first_name && r.country == player.country })
	dup.add_number(player.numbers)
  else
	player_list << player
  end
end

# Set ICS credits
player_list.map{ |p| p.set_credits(sumple) }


# Ordering
player_list = player_list.sort_by(&:country).sort_by(&:first_name).sort_by(&:last_name)

File.open('result.txt', 'w') do |file|
  player_list.each do |row|
	file.puts row.to_string if row.credits > 0
  end
end


