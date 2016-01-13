# Heartcheck::Appsignal

[![Build Status](https://api.travis-ci.org/p-lambert/heartcheck-appsignal.svg?branch=master)](https://travis-ci.org/p-lambert/heartcheck-appsignal)

A [Heartcheck](https://github.com/locaweb/heartcheck) plugin for the
[AppSignal](https://appsignal.com/) monitoring service.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'heartcheck-appsignal'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install heartcheck-appsignal

## Usage

Add the following code to your `Heartcheck` initializer:

```ruby
Heartcheck.setup do |config|
  config.add(:appsignal)
end
```

## Contributing

1. Fork it ( https://github.com/p-lambert/heartcheck-appsignal/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
