# Aircraft Avionics Built in Ruby

[![Build Status](https://travis-ci.org/eduardordm/enginevib.svg?branch=master)](https://travis-ci.org/eduardordm/enginevib)


Foreword: This was built for a talk in RubyConf Brasil 2015, no changes will be made I guess.

Displays the engine vibration levels as provided by a 0->10 sensor. Sensor must be calibrated.

This program can be used with other sensors like: Speedometer, accelerometer and so forth.
I personally tested it with a pitot system and it worked perfectly with sensors calibrated
to work with Lyncoming O235 engines.

It can run in a RTOS, read rtos.c to know how you can hook this gem into your specific RTOS.
You might need to get rid of Rubygems depending on the OS you are planning to run this code.

This gem was tested in OSX, PREEMPT_RT, Xenomai Linux and a proprietary OS it works as intended.

Warning: While you may use this inside an aircraft for testing purposes I advise you not
to unless you are an experienced instructor or test pilot or passenger.

Read /exe/openmic to learn how you can use your mic port to act as an analog data input
(it's terrible).

### Caveats

* Strip down the gem if you plan to run this in VxWorks;
* io.rb needs some love;
* Tests are there but they are not enough;
* Needs a somewhat fast computer, Linksys WRT54 can't run this.

### Specs

* Deadline: ~30ms + verification tolerance
* Avg execution time: < 6ms
* Uses main loop (ticker)
* Expects fresh data at serial port (it will buffer for one tick if data gets out of sync)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enginevib'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enginevib

## Usage

    $ bundle exec enginevib  -p $SERIAL_PORT

The -s option enables IO simulation.

## Using a microphone as input

Check out /exe/openmic to learn how you can use socat and create a virtual serial port that reads data from your mic.

## DTrace


Outputs dtrace to log.txt:

    $ sudo dtrace -s ./dtrace/script.d -o ./tmp/log.txt -c "`rbenv which ruby` `pwd`/bin/enginevib -p /dev/ttys007"

## Development

This was built for a talk in RubyConf Brasil 2015, no changes will be made.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).



