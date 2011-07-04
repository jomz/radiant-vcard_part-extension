# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-vcard_part-extension/version"

Gem::Specification.new do |s|
  s.name        = "radiant-vcard_part-extension"
  s.version     = RadiantVcardPartExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Benny Degezelle"]
  s.email       = ["hi@mokeypatch.be"]
  s.homepage    = "https://github.com/jomz/radiant-vcard_part-extension"
  s.summary     = %q{Vcard Part for Radiant CMS}
  s.description = %q{Adds a vCardPagePart type. Requires radiant-page_parts-extension.}
  
  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end
  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  # s.executables   = Dir['bin/*'] - ignores
  s.require_paths = ["lib"]
  
  s.post_install_message = %{
  Add this to your radiant project with:
    config.gem 'radiant-vcard_part-extension', :version => '~>#{RadiantVcardPartExtension::VERSION}'
  }
end