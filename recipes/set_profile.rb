include_recipe 'sprout-terminal::check_for_active'
term_opts = node['sprout']['terminal']
domain = 'com.apple.Terminal'

osx_defaults "Set terminal profile to #{term_opts['default_profile']}" do
  domain domain
  key 'Default Window Settings'
  string term_opts['default_profile']
end

osx_defaults "Set startup terminal profile to #{term_opts['default_profile']}" do
  domain domain
  key 'Startup Window Settings'
  string term_opts['default_profile']
end
