# Robotgame [![Gem Version](https://badge.fury.io/rb/robotgame.svg)](https://badge.fury.io/rb/robotgame)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/robotgame`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'robotgame'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install robotgame

## Usage

Initilize the robot on to a variable
```ruby
@robot = Robotgame::Robot.new
```

Run the robot commands
```ruby
@robot.run("place 0,0,north")    #-> nil

@robot.run("move")   #-> nil

@robot.run("report")  #-> "0,1,NORTH"

@robot.run("left")    #-> nil

@robot.run("report")   #-> "0,1,WEST"

@robot.run("right")    #-> nil

@robot.run("move")   #-> nil

@robot.run("report")  #-> "0,2,NORTH"

```

## Testing
For running the rspec tests, first clone this repository and from inside the directory run the command :

    $ rake test

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/antodoms/robotgame. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

