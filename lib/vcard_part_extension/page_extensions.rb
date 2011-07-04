module VcardPartExtension::PageExtensions
  def self.included(base)
    base.class_eval do
      has_one :vcard
      accepts_nested_attributes_for :vcard, :allow_destroy => true
      
    end
  end
  
end
