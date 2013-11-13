include_recipe 'sprout-terminal::check_for_active'

execute 'killall cfprefsd'
