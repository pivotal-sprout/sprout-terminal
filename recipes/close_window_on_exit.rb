include_recipe 'sprout-terminal::check_for_active'

execute "Closes window when shell exits cleanly the #{node['terminal']['default_profile']} profile" do
  command "/usr/libexec/PlistBuddy -c 'add :Window\\ Settings:#{node['terminal']['default_profile']}:shellExitAction integer 1' #{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist; /usr/libexec/PlistBuddy -c 'set :Window\\ Settings:#{node['terminal']['default_profile']}:shellExitAction 1' #{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist"
  ignore_failure true
  user node['current_user']
  not_if { node['terminal']['default_profile'].nil? }
  only_if { node['terminal']['close_on_exit'] }
end
