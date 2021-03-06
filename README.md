# PermanentNotFound

Tiny little Rack middleware to answer a configured set of path's with a HTTP 404.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'permanent_not_found'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install permanent_not_found

## Usage

### Rack

```
# config.ru
require 'rack/lobster'
require 'permanent_not_found'

use PermanentNotFound, content: '404 Not Found', paths: ['/wp-content', '/phpmyadmin']
run Rack::Lobster.new
```

### Rails

```
# config/application.rb
require 'permanent_not_found'
content = Rails.root.join('public', '404.html').read.freeze
config.middleware.insert_before(
  Rack::Rewrite, PermanentNotFound, content: content,
  paths: ['/wp-content', '/phpmyadmin'],
  pattern: [/^legacyroute\/.*/, /\.swf$/]
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/COMPEON/permanent_not_found.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

