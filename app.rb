require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end


class WaterIntakeCalculator
  attr_accessor :name, :weight, :minutes_exercised, :temperature, :pregnant

  def initialize(name, weight, minutes_exercised, temperature, pregnant)
    @name = name
    @weight = weight
    @minutes_exercised = minutes_exercised
    @temperature = temperature
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


def home
  puts "Enter your name (type 'exit' to quit)"
  name = gets.chomp
  return if name.downcase == 'exit'

  puts "Hello #{name},
This is a water intake program that will estimate the amount of water you'll have to drink today. 
It will take into consideration:
 - Weight
 - Activity Level
 - Outdoor Temperature
 Let's get started! Are you currently pregnant or breastfeeding? (yes/no)"
 pregnant = gets.chomp
 return if pregnant == 'exit'

 puts "Next, enter your weight (in pounds):"
 weight = gets.chomp.to_f
 return if weight == 'exit'

 puts "Please enter the amount of minutes exercised today:"
 minutes_exercised = gets.chomp.to_f
 return if minutes_exercised == 'exit'

 puts "Now let's take into consideration the weather. What is the current temperature?:"
 temperature = gets.chomp.to_i
 return if temperature == 'exit'

 calculator = WaterIntakeCalculator.new(name, weight, minutes_exercised, temperature, pregnant)

 daily_intake = calculator.calculate_total_intake
 glasses_of_water = calculator.glasses_of_water

 puts "Thank you #{name}. Your water intake for today is #{daily_intake} ounces. That equates to around #{glasses_of_water} glasses of water. Stay hydrated, my friend!"
end

puts home
