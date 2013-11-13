include_recipe 'sprout-terminal::check_for_active'

remote_file "#{Chef::Config[:file_cache_path]}/MenloRegular18pt.bin" do
  source node['terminal']['font_src']
  owner node['current_user']
  not_if { node['terminal']['default_profile'].nil? && node['terminal']['font_src'].nil? }
  only_if { node['terminal']['update_font'] }
end

execute "Updates font on the #{node['terminal']['default_profile']} profile to Menlo-Regular 18pt" do
  command "/usr/libexec/PlistBuddy -c 'import :Window\\ Settings:#{node['terminal']['default_profile']}:Font #{Chef::Config[:file_cache_path]}/MenloRegular18pt.bin' #{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist"
  user node['current_user']
  not_if { node['terminal']['default_profile'].nil? && node['terminal']['font_src'].nil? }
  only_if { node['terminal']['update_font'] }
end

execute "Turns on Anti-Aliasing for the #{node['terminal']['default_profile']} profile's font" do
  command "/usr/libexec/PlistBuddy -c 'set :Window\\ Settings:#{node['terminal']['default_profile']}:FontAntialias true' #{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist"
  user node['current_user']
  not_if { node['terminal']['default_profile'].nil? }
  only_if { node['terminal']['update_font'] }
end
