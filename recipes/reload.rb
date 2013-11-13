include_recipe 'sprout-terminal::check_for_active'

execute 'killall cfprefsd' do
  not_if { node['terminal']['default_profile'].nil? }
end
