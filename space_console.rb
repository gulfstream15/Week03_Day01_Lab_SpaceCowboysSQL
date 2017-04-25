require('pry-byebug')
require_relative('bounty')

bounty1 = Bounty.new ({
    'name' => 'Dave',
    'species' => 'Space Rhino',
    'bounty_value' => 100,
    'danger_level' => 'low',
    'last_known_location' => 'earth',
    'home_world' => 'mars',
    'favourite_weapon' => 'mace',
    'cashed_in' => 'false',
    'collected_by' => nil,
  })

Bounty.delete_all()

bounty1.save
bounty1.name = 'Paul'
bounty1.update

if ( Bounty.find_one().is_a?(Bounty))
    puts "Success!"
else
    puts "Fail!"
end



binding.pry
nil
