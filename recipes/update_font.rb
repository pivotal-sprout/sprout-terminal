include_recipe 'sprout-terminal::check_for_active'

remote_file "#{Chef::Config[:file_cache_path]}/MenloRegular18pt.bin" do
  source "http://cheffiles.pivotallabs.com/MenloRegular18pt.bin"
  owner node['current_user']
end

execute "Updates font on the #{node['terminal']['profile']} profile to Menlo-Regular 18pt" do
  command "/usr/libexec/PlistBuddy -c 'import :Window\\ Settings:#{node['terminal']['profile']}:Font #{Chef::Config[:file_cache_path]}/MenloRegular18pt.bin' #{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist"
  user node['current_user']
end
