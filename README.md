# ruby-i18n-months

You may use this gem with `rails-i18n` (although, it's not required).

To install, add to your `Gemfile`:

```ruby
gem 'ruby-i18n-months'
```

This gem add directives `%O` and `%o` for month names that are useful in such formats:

Format     | English     | Russian
-----------|-------------|--------
`%O %Y`    | March 2022  | Март 2022
`%d/%o/%Y` | 23/Mar/2022 | 23/март/2022

Compare with these results (using existing directives `%B` and `%b` in Ruby and gem `rails-i18n`):

Format     | English     | Russian
-----------|-------------|--------
`%B %Y`    | March 2022  | марта 2022 (this result is incorrect for native speakers)
`%d/%b/%Y` | 23/Mar/2022 | 23/марта/2022 (sounds odd but is acceptable)

The languages listed below use different words
for dates in long format(`day, month, year`: `%d %B %Y`)
and for month and year only (`month, year`: `%O %Y`):

- Belorussian
- Greek
- Polish
- Russian
- Ukrainian

This gem adds directives `%O` and `%o` in `I18n::Backend::Base`
(used internally in gem `ruby-i18n`), and adds month names for all languages listed
above for these directives.

For Slavic languages these month names are in nominative case,
and gem `rails-i18n` provides month names in genitive case
(for directives `%B` and `%b`).

Other languages & locales will fallback these directives to `%B` and `%b` respectively.
In this case you should have gem `rails-i18n` installed.

## Usage

You may use `localize` method (shorted to `l`), as usual:

```ruby
I18n.l(Time.new(2022, 3, 1), locale: :ru, format: '%O %Y')
# => "Март 2022" (provided by this gem, `ruby-i18n-months`)

I18n.l(Time.new(2022, 3, 1), locale: :ru, format: '%-e %B %Y')
# => "1 марта 2022" (provided by gem `rails-i18n`)

I18n.l(Time.new(2022, 3, 1), locale: :en, format: '%O %Y')
# => "March 2022" (provided by this gem, `ruby-i18n-months`,
#    with fallback to `%B`, so you need `rails-i18n` also)

I18n.l(Time.new(2022, 3, 1), locale: :en, format: '%-e %B %Y')
# => "1 March 2022" (provided by gem `rails-i18n`)
```

Using `strftime` is not supported:

```ruby
Time.new(2022, 3, 1).strftime('%O %Y')
# => "%O 2022"
```

## Development

To release a new version: `bundle exec rake release`

## Contributing

Bug reports and pull requests are welcome on GitHub at
[github.com/crosspath/ruby-i18n-months](https://github.com/crosspath/ruby-i18n-months).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).
