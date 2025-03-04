require "sinatra"
require "sinatra/reloader"
require "http"
require "json"



class WaterIntakeCalculator
  attr_accessor :name, :weight, :minutes_exercised, :temperature, :pregnant

  def initialize(name, weight, minutes_exercised, temperature, pregnant)
    @name = name
    @weight = weight.to_f
    @minutes_exercised = minutes_exercised.to_f
    @temperature = temperature.to_i
    @pregnant = pregnant
  end

  def calculate_weight_intake
    @weight * 0.5
  end

  def calculate_exercise_intake
    (@minutes_exercised / 30.0) * 12
  end

  def calculate_total_intake
    intake = calculate_weight_intake + calculate_exercise_intake

    intake += 32 if @pregnant.downcase == 'yes'

    intake += 16 if @temperature >= 70

    intake
  end

  def glasses_of_water
    (calculate_total_intake / 8).to_i
  end 
end

def get_weather(city)
  url = "http://api.weatherstack.com/current?access_key=#{WEATHERSTACK_API_KEY}&query=#{city}"
  response = HTTP.get(url)
  weather_data = JSON.parse(response.body)

  if weather_data["current"]
    celsius = weather_data["current"]["temperature"]
    fahrenheit = (celsius * 9.0 / 5) + 32
    return fahrenheit.round
  else
    return nil
  end
end

get("/") do
  erb(:homepage)
end

get ("/water/new") do
  @name = params[:name]
  erb(:water_calculator)
end

get("/weather") do
  city = params[:city]
  temperature = get_weather(city)

  if temperature
    { temperature: temperature }.to_json
  else
    { error: "Could not retrieve weather data." }.to_json
  end
end

get ("/water/results") do
  name = params[:name]
  weight = params[:weight]
  minutes_exercised = params[:time_exercised]
  temperature = params[:weather]
  pregnant = params[:pregnant]
  erb(:water_results)

  calculator = WaterIntakeCalculator.new(name, weight, minutes_exercised, temperature, pregnant)

  @name = name
  @daily_intake = calculator.calculate_total_intake
  @glasses_of_water = calculator.glasses_of_water

  erb(:water_results)
end
