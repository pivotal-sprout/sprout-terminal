include_recipe 'sprout-terminal::check_for_active'
term_opts = node['sprout']['terminal']

osx_defaults "Set terminal profile to #{term_opts['default_profile']}" do
  domain 'com.apple.Terminal'
  key 'Default Window Settings'
  string term_opts['default_profile']
  not_if { term_opts['default_profile'].nil? }
end

osx_defaults "Set startup terminal profile to #{term_opts['default_profile']}" do
  domain 'com.apple.Terminal'
  key 'Startup Window Settings'
  string term_opts['default_profile']
  not_if { term_opts['default_profile'].nil? }
end
