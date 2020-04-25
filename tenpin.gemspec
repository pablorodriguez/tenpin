lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tenpin/version"

Gem::Specification.new do |spec|
  spec.name          = "tenpin"
  spec.version       = Tenpin::VERSION
  spec.authors       = ["Pablo Rodriguez"]
  spec.email         = ["pablorodriguez.ar@gmail.com"]

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://www.tengpin.com.ar"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://www.tenping.com.ar/sourcecode"
  spec.metadata["changelog_uri"] = "https://www.tenping.com.ar/changelog"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.test_files = Dir['spec/**/*']

  spec.add_dependency "tty-table"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency "pry"
  spec.add_development_dependency 'pry-byebug'

end
