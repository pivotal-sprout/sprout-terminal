include_recipe 'sprout-terminal::check_for_active'
term_opts = node['sprout']['terminal']

node['sprout']['terminal']

font_key = %Q(:Window\\ Settings:#{term_opts['default_profile']}:Font)
antialias_key = %Q(:Window\\ Settings:#{term_opts['default_profile']}:FontAntialias)
file = %Q(#{node['sprout']['home']}/Library/Preferences/com.apple.Terminal.plist)
plist_cmd = '/usr/libexec/PlistBuddy -c'
font_path = %Q(#{Chef::Config[:file_cache_path]}/customFont.bin)

remote_file font_path do
  source term_opts['font_src']
  owner node['sprout']['user']
end

execute %Q(#{plist_cmd} 'import #{font_key} #{font_path}' #{file}) do
  user node['sprout']['user']
end

execute %Q(#{plist_cmd} 'set #{antialias_key} true' #{file}) do
  user node['sprout']['user']
end
