module NavigationHelpers
  
  # Extend the standard PathMatchers with your own paths
  # to be used in your features.
  # 
  # The keys and values here may be used in your standard web steps
  # Using:
  #
  #   When I go to the "vcard_part" admin page
  # 
  # would direct the request to the path you provide in the value:
  # 
  #   admin_vcard_part_path
  # 
  PathMatchers = {} unless defined?(PathMatchers)
  PathMatchers.merge!({
    # /vcard_part/i => 'admin_vcard_part_path'
  })
  
end

World(NavigationHelpers)