Gem::Specification.new do |s|
  s.name = "soap5r"
  s.version = "1.5.8"
  s.author = "NAKAMURA, Hiroshi"
  s.email = "nahi@ruby-lang.org"
  s.homepage = "https://github.com/felipec/soap4r"
  s.summary = "An implementation of SOAP 1.1 for Ruby."
  s.files = Dir.glob("{bin,lib}/**/*")
  s.executables = [ "wsdl2ruby.rb", "xsd2ruby.rb" ]
  s.add_dependency("httpclient", ">= 2.1.1")
  s.license = ["RUBY", "GPLv2"]
end
