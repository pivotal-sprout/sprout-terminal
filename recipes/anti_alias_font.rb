include_recipe 'sprout-terminal::check_for_active'

execute "Turns on Anti-Aliasing for the #{node['terminal']['profile']} profile's font" do
  command "/usr/libexec/PlistBuddy -c 'set :Window\\ Settings:#{node['terminal']['profile']}:FontAntialias true' #{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist"
  user node['current_user']
end
