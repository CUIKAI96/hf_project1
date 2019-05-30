menu = {"chicken tenders" => 9.99,
         "cheese burgers" => 2.50,
         "small fries"=> 2.00,
         "ground beef burgers"=> 5.00,
         "ground beef steak" => 19.99
}

# menu.keys.each do |menu|
#   l_name = menu.keys.length
#   l_price = menu.values.length
#   l = l_name + l_price
#   puts l
# end


# puts menu.keys
# puts menu.values

l = menu.map  { |key, value|
                key.length + value.to_s.length}.max + 3


puts menu.map { |key, value|
                key.ljust(l -
                              value.to_s.ljust(4,'0').length , '.') +
                    '$' + value.to_s.ljust(4,'0')}

# menu.keys.each do |item|
#   puts item.ljust(l, '.')
# end