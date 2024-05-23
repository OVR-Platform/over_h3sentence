# Over H3 Sentence

Generate sentence from Over land hex id (H3 address)

## Install

```bash
gem install over_h3sentence
```

Or add to your Gemfile

```ruby
gem 'over_h3sentence'
```

## Usage

```ruby
require 'over_h3sentence'

puts OverH3sentence.sentence('8c1ea284caf05ff')
# -> 'latest.sell.emotionally'
```

## Development

```bash
git clone https://github.com/gregogalante/over_h3sentence
cd over_h3sentence
gem install rake
rake test
```