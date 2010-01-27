# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cappruby}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Beynon"]
  s.date = %q{2010-01-26}
  s.default_executable = %q{cappruby}
  s.description = %q{cappruby}
  s.email = %q{adam@adambeynon.com}
  s.executables = ["cappruby"]
  s.files = [
    "VERSION",
     "bin/cappruby",
     "build/CappRuby/CappRuby.j",
     "lib/cappruby.rb",
     "runtime/object.js",
     "runtime/objj_additions.js",
     "runtime/opal.js"
  ]
  s.homepage = %q{http://github.com/adambeynon/cappruby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{cappruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<vienna>, [">= 0"])
    else
      s.add_dependency(%q<vienna>, [">= 0"])
    end
  else
    s.add_dependency(%q<vienna>, [">= 0"])
  end
end

