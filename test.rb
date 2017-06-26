require 'HTTParty'

urls = {
         "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR148.json" => "Presidio",
         "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR1065.json" => "Marina",
         "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR926.json" => "North Beach",
         "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR909.json" => "Outer Richmond",
         "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR506.json" => "Inner Richmond",
         "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR131.json" => "SOMA",
         "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR902.json" => "Lower Haight",
         "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR79.json" => "Mission",
         "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR938.json" => "Castro",
         "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR1088.json" => "Sunset"
}

excessive_urls = {
        "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR1030.json" => "Dolores",
        "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR1050.json" => "Downtown SF",
        "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR34.json" => "Twin Peaks",        "http://api.wunderground.com/api/key/conditions/q/pws:KCAPOTRE8.json" => "Potrero",
        "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR581.json" => "Noe Valley"
}

urls.each do |key, value|
  response = HTTParty.get(key)
  observations = response.parsed_response["current_observation"]
  info_hash = {}
  info_hash["location"] = value
  info_hash["celcius"] = observations["temp_c"]
  info_hash["farenheit"] = observations["temp_f"]
  info_hash["weather"] = observations["weather"]
  info_hash["wind"] = observations["wind_mph"]
  urls[key] = info_hash
end

puts urls
