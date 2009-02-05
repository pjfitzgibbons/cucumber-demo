
Before do
  @fixtures = %w/ products comments /
  @fixtures.each do |table|
    table.classify.constantize.delete_all
  end
end

#Before do
#  Fixtures.reset_cache
#  fixtures_folder = File.join(RAILS_ROOT, 'spec', 'fixtures')
#  fixtures = Dir[File.join(fixtures_folder, '*.yml')].map {|f| File.basename(f, '.yml') }
#  Fixtures.create_fixtures(fixtures_folder, fixtures)
#end

Given /^the following (\S*):$/ do |table, data|
  model = table.classify.constantize
  insert_data = data.hashes
  insert_data.each do |hash|
    (hash.select {|k,v| k =~ /^id$|_id$/ }).each do |kv_pair|
      k,v = kv_pair
      hash[k] = Fixtures::identify(v) if v.is_a?(String)
    end
    rec = model.new(hash)
    if hash.key?('id')
      rec.id = hash['id']
    end
    rec.save
  end
end
