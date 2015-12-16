# AcceptLanguageHeader

## Usage

```ruby
  accept_header = AcceptLanguageHeader.parse('zh-CN,zh-HK;q=0.9,zh;q=0.7,zh-TW;q=0.6,ja;q=0.4,en-US;q=0.3,en;q=0.1')
  accept_header.lookup(['ja', 'br', 'fr', 'de', 'en']) #=> 'ja'
```

## SEE ALSO

### [http\_accept\_language](https://github.com/iain/http_accept_language)

I does not want to use it as Rails plugin on Rails environment.

### [Rack::Locale](https://github.com/rack/rack-contrib/blob/master/lib/rack/contrib/locale.rb)

I does not want to use it as Rack middleware.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'accept_language_header'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install accept_language_header

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/walf443/accept_language_header.

