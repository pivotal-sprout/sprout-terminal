include_recipe 'sprout-terminal::check_for_active'

execute "Closes window when shell exits cleanly the #{node['terminal']['profile']} profile" do
  command "/usr/libexec/PlistBuddy -c 'set :Window\\ Settings:#{node['terminal']['profile']}:shellExitAction 1' #{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist"
  user node['current_user']
end
