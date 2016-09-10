lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name    = 'cracking_the_ruby_coding_interview'
  s.version = '0.0.1'
  s.authors = ["M. Daniel Dyba"]
  s.email   = ["daniel.dyba@gmail.com"]

  s.summary     = %q{Solutions to the Cracking the Coding Interview in Ruby}
  s.description = %q{Solutions to the Cracking the Coding Interview in Ruby}

  s.license = "MIT"

  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }
  s.require_paths = ["lib"]

  s.add_development_dependency "minitest"
  s.add_development_dependency "rake"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-byebug"
end
