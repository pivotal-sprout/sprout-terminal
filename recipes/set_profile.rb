include_recipe 'sprout-terminal::check_for_active'

osx_defaults "Set terminal profile to #{node['terminal']['profile']}" do
  domain 'com.apple.Terminal'
  key 'Default Window Settings'
  string node['terminal']['profile']
end

osx_defaults "Set startup terminal profile to #{node['terminal']['profile']}" do
  domain 'com.apple.Terminal'
  key 'Startup Window Settings'
  string node['terminal']['profile']
end
