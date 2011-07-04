# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'
require 'radiant-vcard_part-extension/version'
class VcardPartExtension < Radiant::Extension
  version RadiantVcardPartExtension::VERSION
  description "Adds a vCardPagePart type."
  url "https://github.com/jomz/radiant-vcard_part-extension"
  
  extension_config do |config|
  #   config.gem 'radiant-page_parts-extension'
  end
  
  def activate
    Page.send :include, VcardPartExtension::PageExtensions
    # tab 'Content' do
    #   add_item "Vcard Part", "/admin/vcard_part", :after => "Pages"
    # end
  end
end
