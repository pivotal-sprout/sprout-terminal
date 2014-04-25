include_recipe 'sprout-terminal::check_for_active'
term_opts = node['sprout']['terminal']

key = %Q(:Window\\ Settings:#{term_opts['default_profile']}:shellExitAction)
file = %Q(#{node['sprout']['home']}/Library/Preferences/com.apple.Terminal.plist)
plist_cmd = '/usr/libexec/PlistBuddy -c'

execute %Q(#{plist_cmd} 'add #{key} integer 1' #{file}) do
  ignore_failure true
  user node['current_user']
end

execute %Q(#{plist_cmd} 'set #{key} 1' #{file}) do
  ignore_failure true
  user node['current_user']
end
