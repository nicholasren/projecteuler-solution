range = (100...999).to_a
result = range.product(range).map {|x, y| x * y}.select { |z| z.to_s.reverse == z.to_s}.max
puts result
