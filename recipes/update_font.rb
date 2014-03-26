include_recipe 'sprout-terminal::check_for_active'
term_opts = node['sprout']['terminal']

remote_file "#{Chef::Config[:file_cache_path]}/customFont.bin" do
  source term_opts['font_src']
  owner node['current_user']
  not_if { term_opts['default_profile'].nil? && term_opts['font_src'].nil? }
  only_if { term_opts['update_font'] }
end

execute "Updates font on the #{term_opts['default_profile']} profile to #{term_opts['font_src']}" do
  command "/usr/libexec/PlistBuddy -c 'import :Window\\ Settings:#{term_opts['default_profile']}:Font #{Chef::Config[:file_cache_path]}/customFont.bin' #{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist"
  user node['current_user']
  not_if { term_opts['default_profile'].nil? && term_opts['font_src'].nil? }
  only_if { term_opts['update_font'] }
end

execute "Turns on Anti-Aliasing for the #{term_opts['default_profile']} profile's font" do
  command "/usr/libexec/PlistBuddy -c 'set :Window\\ Settings:#{term_opts['default_profile']}:FontAntialias true' #{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist"
  user node['current_user']
  not_if { term_opts['default_profile'].nil? }
  only_if { term_opts['update_font'] }
end
