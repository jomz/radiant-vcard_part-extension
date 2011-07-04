class VcardPagePart < PagePart
  part_name "vCard"
  show_filters false
    
  def render_content
    %{<div class="vcard">
        #{vcard_address_fields}
        #{vcard_tel_fields}
        #{vcard_email_and_url_fields}
      </div>}
  end
  
  private
  
  def vcard_address_fields
    vcard = self.page.vcard
    result = ""
    result << "<span class=\"org\">#{vcard.org}</span><br />" unless vcard.org.blank?
    result << "<span class=\"fn n\">#{vcard.fn} #{vcard.n}</span><br />" unless (vcard.n.blank? && vcard.fn.blank?)
    unless(vcard.street_address.blank? && vcard.postal_code.blank? && vcard.locality.blank?)
      result << "<span class=\"adr\">"
        %w(street-address postal-code locality).each do |attrib|
          result << "<span class=\"#{attrib}\">#{vcard.send(attrib.gsub(/-/,'_'))}</span>" unless vcard.send(attrib.gsub(/-/, '_')).blank?
        end
      result << "</span>"
    end
    "<p>#{result}</p>"
  end

  def vcard_tel_fields
    vcard = self.page.vcard
    return if vcard.tel.blank? && vcard.fax.blank?
    result = ""
    unless vcard.tel.blank?
      result << %{
      <span class="tel">
  	    <abbr class="type" title="Work">Tel.:</abbr>
  	    <span class="value">#{vcard.tel}</span>
  	  </span><br />
      }
    end
    unless vcard.fax.blank?
      result << %{
      <span class="tel">
  	    <abbr class="type" title="Fax">Fax:</abbr>
  	    <span class="value">#{vcard.fax}</span>
  	  </span>
      }
    end
    "<p>#{result}</p>"
  end

  def vcard_email_and_url_fields
    vcard = self.page.vcard
    result = ""
    return result if vcard.email.blank? && vcard.url.blank?
    result << %{<a class="email" href="mailto:#{vcard.email}">#{vcard.email}</a><br />} unless vcard.email.blank?
    result << %{<a class="url" href="http://#{vcard.url.gsub(/http(s)?:\/\//,'')}">#{vcard.url}</a><br />} unless vcard.url.blank?
    "<p>#{result}</p>"
  end

end