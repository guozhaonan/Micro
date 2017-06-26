require 'sinatra'
require 'HTTParty'

urls = {
  "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR148.json"=>{"location"=>"Presidio"},
  "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR1065.json"=>{"location"=>"Marina"},
  "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR926.json"=>{"location"=>"North Beach"},
  "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR909.json"=>{"location"=>"Outer Richmond"},
  "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR506.json"=>{"location"=>"Inner Richmond"},
  "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR131.json"=>{"location"=>"SOMA"},
  "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR902.json"=>{"location"=>"Lower Haight"},
  "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR79.json"=>{"location"=>"Mission"},
  "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR938.json"=>{"location"=>"Castro"},
  "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR1088.json"=>{"location"=>"Sunset"}
}
excessive_urls = {
        "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR1030.json" => {"location"=>"Dolores"},
        "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR1050.json" => {"location"=>"Downtown SF"},
        "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR34.json" => {"location"=>"Twin Peaks"},        "http://api.wunderground.com/api/key/conditions/q/pws:KCAPOTRE8.json" => {"location"=>"Potrero"},
        "http://api.wunderground.com/api/key/conditions/q/pws:KCASANFR581.json" => {"location"=>"Noe Valley"}
}

get '/' do
  urls.each do |key, value|
    response = HTTParty.get(key)
    observations = response.parsed_response["current_observation"]
    info_hash = {}
    info_hash["location"] = value["location"]
    info_hash["celcius"] = observations["temp_c"]
    info_hash["farenheit"] = observations["temp_f"]
    info_hash["weather"] = observations["weather"]
    info_hash["wind"] = observations["wind_mph"]
    urls[key] = info_hash
  end
end
