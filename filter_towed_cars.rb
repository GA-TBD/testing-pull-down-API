require 'httparty'
require 'json'
require 'pry'


# modeled after example in article https://www.twilio.com/blog/2015/10/4-ways-to-parse-a-json-api-with-ruby.html
url = 'https://data.cityofchicago.org/resource/ygr5-vcbg.json'
response = HTTParty.get(url)
all_cars = response.parsed_response
car = all_cars[0]
p all_cars

user_car = {
"model" => "750**",
"inventory_number" => "6834053",
"style" => "4D",
"color" => "BLK",
"towed_to_address" => "701 N. Sacramento",
"state" => "IL",
"plate" => "E540000**",
"tow_facility_phone" => "(773) 265-7605",
"tow_date" => "2015-12-08T00:00:00",
"make" => "BMW"
}

# user_car = {"inventory_number"=>"6833988", "style"=>"4T", "color"=>"BLK", "towed_to_address"=>"701 N. Sacramento", "state"=>"IL", "plate"=>"N213128-dood", "tow_facility_phone"=>"(773) 265-7605", "tow_date"=>"2015-12-08T00:00:00", "make"=>"ACUR"}
# user_car = {"inventory_number"=>"68329189", "style"=>"4D", "color"=>"BLU", "towed_to_address"=>"701 N. Sacramento", "state"=>"IL", "plate"=>"S442827", "tow_facility_phone"=>"(773) 265-7605", "tow_date"=>"2015-12-02T00:00:00", "make"=>"HYUN"}

# user_car =
# {"inventory_number"=>"6834011",
#  "style"=>"4T",
#  "color"=>"GRY",
#  "towed_to_address"=>"701 N. Sacramento",
#  "state"=>"IL",
#  "tow_facility_phone"=>"(773) 265-7605",
#  "tow_date"=>"2015-12-08T00:00:00",
#  "make"=>"ACUR"}

# user_car = {"inventory_number"=>"6834011",
#  "style"=>"4T",
#  "color"=>"GRY",
#  "towed_to_address"=>"701 N. Sacramento",
#  "state"=>"IL",
#  "tow_facility_phone"=>"(773) 265-7605",
#  "tow_date"=>"2015-12-08T00:00:00",
#  "make"=>"ACUR"}

# do i need this?
@tier1_match_car = Array.new
@tier2_match_cars = Array.new
@tier3_match_cars = Array.new

  # tier1_match_car.push(car)
  # p tier1_match_car[0]


# Set dummy values to avoid false car matches
# i.e. (user plate = nil) & (towed-car-plate = nil)
if user_car['plate'] == nil
  user_car['plate'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
end
if user_car['state'] == nil
  user_car['state'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
end
if user_car['style'] == nil
  user_car['style'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
end
if user_car['color'] == nil
  user_car['color'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
end
if user_car['make'] == nil
  user_car['make'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
end
if user_car['model'] == nil
  user_car['model'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
end
if user_car['towed_to_address'] == nil
  user_car['towed_to_address'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
end
if user_car['tow_facility_phone'] == nil
  user_car['tow_facility_phone'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
end
if user_car['inventory_number'] == nil
  user_car['inventory_number'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
end
if user_car['tow_date'] == nil
  user_car['tow_date'] = "this_better_not_match_or_the_chi_pd_is_really_screwing_up"
end

# i=-1
all_cars.each do |towed_car|
  # p all_cars.index(towed_car)
  # binding.pry

  if user_car['plate'] == towed_car['plate'] &&
       user_car['state'] == towed_car['state']
       p '*****************tier1_match'
       @tier1_match_car.push(towed_car)
       break
  elsif user_car['make'] == towed_car['make'] &&
        user_car['model'] == towed_car['model'] &&
        user_car['color'] == towed_car['color'] &&
        user_car['style'] == towed_car['style']
        p '*****************tier2_match'
        @tier2_match_cars.push(towed_car)
  elsif user_car['make'] == towed_car['make'] &&
        user_car['color'] == towed_car['color'] &&
        user_car['style'] == towed_car['style']
        p '******************tier3_match'
        @tier3_match_cars.push(towed_car)
  end

end

p '------------tier1_match_car----------'
p @tier1_match_car.length
p '------------tier2_match_cars----------'
p @tier2_match_cars.length
p '------------tier3_match_cars----------'
p @tier3_match_cars.length

binding.pry
