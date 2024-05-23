Gem::Specification.new do |s|
  s.name        = "over_h3sentence"
  s.version     = "1.0.0"
  s.summary     = "Generate sentence from Over land hex id (H3 address)"
  s.description = "Generate sentence from Over land hex id (H3 address)"
  s.authors     = ["Gregorio Galante"]
  s.email       = "me@gregoriogalante.com"
  s.files       = ["lib/over_h3sentence.rb", "lib/list_of_words_v1.json"]
  s.homepage    = "https://rubygems.org/gems/over_h3sentence"
  s.license     = "MIT"

  s.add_runtime_dependency 'json'

  s.executables << "over_h3sentence"
end
