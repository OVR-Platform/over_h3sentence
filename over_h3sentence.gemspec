Gem::Specification.new do |s|
  s.name        = "over_h3sentence"
  s.version     = "1.1.0"
  s.summary     = "Generate sentence from Over land hex id (H3 address)"
  s.description = "Generate sentence from Over land hex id (H3 address)"
  s.authors     = ["Gregorio Galante"]
  s.email       = "me@gregoriogalante.com"
  s.files       = ["lib/over_h3sentence.rb", "lib/list_of_words_v1.json"]
  s.homepage    = "https://github.com/gregogalante/over_h3sentence"
  s.license     = "MIT"

  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/gregogalante/over_h3sentence"

  s.add_runtime_dependency 'json'

  s.executables << "over_h3sentence"
end
