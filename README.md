# Cron Expression parser

To setup, ensure you have a version of ruby installed on your machine. Instructions to do that can be found [here](https://www.ruby-lang.org/en/documentation/installation/). This was developed using ruby 2.7, it should be compatible with any ruby version > 1.9 but it's not been tested.

Once you have a valid version of ruby installed, if you haven't already run: `gem install bundler`. Then run `bundle install` to install any gem dependencies, we only have rspec here.

To run tests, run `bundle exec rspec`.

To run the command line application, run: `./cron_expression_parser "*/15 0 1,15 * 1-5 /usr/bin/find"`

You should see the following output if everything is working correctly:
```
minute       0 15 30 45
hour         0
day of month 1 15
month        1 2 3 4 5 6 7 8 9 10 11 12
day of week  1 2 3 4 5
command      /usr/bin/find
```
