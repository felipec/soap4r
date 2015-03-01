$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "soap/version"

Gem::Specification.new "soap2r", SOAP::VERSION do |s|
  s.author = "NAKAMURA, Hiroshi"
  s.email = "nahi@ruby-lang.org"
  s.homepage = "https://github.com/felipec/soap4r"
  s.summary = "An implementation of SOAP 1.1 for Ruby."
  s.files = `git ls-files lib bin`.split("\n")
  s.executables = [ "wsdl2ruby.rb", "xsd2ruby.rb" ]
  s.add_dependency("httpclient", ">= 2.1.1")
  s.add_dependency("logger-application", "~> 0.0.2")
  s.licenses = ["RUBY", "GPLv2"]
end
