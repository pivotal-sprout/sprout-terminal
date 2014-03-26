include_recipe 'sprout-terminal::check_for_active'
term_opts = node['sprout']['terminal']

execute "Closes window when shell exits cleanly the #{term_opts['default_profile']} profile" do
  command "/usr/libexec/PlistBuddy -c 'add :Window\\ Settings:#{term_opts['default_profile']}:shellExitAction integer 1' #{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist; /usr/libexec/PlistBuddy -c 'set :Window\\ Settings:#{term_opts['default_profile']}:shellExitAction 1' #{ENV['HOME']}/Library/Preferences/com.apple.Terminal.plist"
  ignore_failure true
  user node['current_user']
  not_if { term_opts['default_profile'].nil? }
  only_if { term_opts['close_on_exit'] }
end
