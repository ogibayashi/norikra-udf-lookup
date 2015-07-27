# Norikra::Udf::Lookup

Norikra UDF to lookup external data source. (Currently, only TSV file)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'norikra-udf-lookup'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install norikra-udf-lookup

## Usage

```
norikra-client query add testquery "SELECT id, lookup('/tmp/lookuptest.tsv', cast(id as string), 'default value') as name, count(*) FROM test_stream.win:time_batch(1 min) GROUP BY id"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/norikra-udf-lookup.

