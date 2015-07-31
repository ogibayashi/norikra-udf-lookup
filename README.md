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


### lookup_tsv(string, string, string)

Parameters are: TSV file path, key to lookup, return value if the key was not found.

Lookup key in TSV file and return corresponding value.

For example, create such file with "key<tab>value" pairs.

```
% cat /tmp/lookuptest.tsv 
1       aaa
2       bbb
3       ccc
```

Register query with this UDF.

```
SELECT
  id, lookup_tsv('/tmp/lookuptest.tsv',id,'not found') as name, count(*) as cnt
FROM
  test_stream.win:time_batch(1 min)
GROUP by id
```

Send some events.

```
% echo '{"id":"1"}' | norikra-client event send test_stream
% echo '{"id":"2"}' | norikra-client event send test_stream
% echo '{"id":"3"}' | norikra-client event send test_stream
% echo '{"id":"4"}' | norikra-client event send test_stream
```

Then, you will get these records.

```
{"time":"2015/07/28 12:13:24","query":"lookuptest","id":"3","cnt":1,"name":"ccc"}
{"time":"2015/07/28 12:13:24","query":"lookuptest","id":"2","cnt":1,"name":"bbb"}
{"time":"2015/07/28 12:13:24","query":"lookuptest","id":"1","cnt":1,"name":"aaa"}
{"time":"2015/07/28 12:13:24","query":"lookuptest","id":"4","cnt":1,"name":"not found"}
```

### Reloading data

This UDF checks the timestamp of TSV files every 60 seconds and reload them if they are updated.

## Copyright

* Copyright (c) 2015- OGIBAYASHI Hironori
* License
    * GPL v2
