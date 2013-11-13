include_recipe 'sprout-terminal::check_for_active'

osx_defaults "Set terminal profile to #{node['terminal']['default_profile']}" do
  domain 'com.apple.Terminal'
  key 'Default Window Settings'
  string node['terminal']['default_profile']
  not_if { node['terminal']['default_profile'].nil? }
end

osx_defaults "Set startup terminal profile to #{node['terminal']['default_profile']}" do
  domain 'com.apple.Terminal'
  key 'Startup Window Settings'
  string node['terminal']['default_profile']
  not_if { node['terminal']['default_profile'].nil? }
end
