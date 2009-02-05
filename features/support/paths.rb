def path_to(page_name)
  case page_name
  
  when /the homepage/i
    root_path

  when /Product (\d+)/
    product_path(:id => $1)
  when /Product (\S+)/
    product_path(:id => Fixtures.identify($1))
    
  # Add more page name => path mappings here
  
  else
    raise "Can't find mapping from \"#{page_name}\" to a path."
  end
end