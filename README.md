# sinatra-template

Use this repository to create new Sinatra apps. 

Optionally, to use `ActiveRecord` for database operations, add to the `app.rb`:

```ruby
require "sinatra/activerecord"
```

And in the `config/environment.rb` file add this code block:

```ruby
configure do
  # setup a database connection
  set(:database, { adapter: "sqlite3", database: "db/development.sqlite3" })
end
```


# Daily Water Intake Calculator

- Version `1.0`

## Description

The Daily Water Intake Calculator helps users estimate their daily water intake based on their weight, activity level, current temperature, and other factors such as prenancy or breastfeeding. The app guides users through calculation process step by step and provides results in both total ounces and glasses of water. (8 ounces per glass)

## Instructions

- To start the program type `ruby daily-water-intake.rb` into the terminal.
- Follow on screen instructions.
- Type 'exit' to end the program at anytime.
