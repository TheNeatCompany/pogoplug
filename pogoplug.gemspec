# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pogoplug"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Travis Truman"]
  s.date = "2013-08-19"
  s.description = ""
  s.email = "trumant@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rvmrc",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "Guardfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/pogoplug.rb",
    "lib/pogoplug/api_version.rb",
    "lib/pogoplug/authentication_error.rb",
    "lib/pogoplug/client.rb",
    "lib/pogoplug/device.rb",
    "lib/pogoplug/file.rb",
    "lib/pogoplug/file_listing.rb",
    "lib/pogoplug/hash_initializer.rb",
    "lib/pogoplug/service.rb",
    "lib/pogoplug/version.rb",
    "listDevices.json",
    "listFiles.json",
    "pogoplug.gemspec",
    "test/pogoplug/client_test.rb",
    "test/pogoplug/device_test.rb",
    "test/pogoplug/file_listing_test.rb",
    "test/pogoplug/file_test.rb",
    "test/pogoplug/helper.rb",
    "test/pogoplug/service_test.rb",
    "test/test_file.txt"
  ]
  s.homepage = "http://github.com/trumant/pogoplug"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "A Ruby wrapper around the PogoPlug API"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, ["~> 0.11.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-bundler>, [">= 0"])
      s.add_development_dependency(%q<guard-test>, [">= 0"])
      s.add_development_dependency(%q<ruby_gntp>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, ["~> 0.11.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-bundler>, [">= 0"])
      s.add_dependency(%q<guard-test>, [">= 0"])
      s.add_dependency(%q<ruby_gntp>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, ["~> 0.11.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-bundler>, [">= 0"])
    s.add_dependency(%q<guard-test>, [">= 0"])
    s.add_dependency(%q<ruby_gntp>, [">= 0"])
  end
end

